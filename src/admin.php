<?php
session_start();
require("headers.php");

if (! defined('PHP_EOL')) {
	define('PHP_EOL', strtoupper(substr(PHP_OS, 0, 3) == 'WIN') ? "\r\n"
			: strtoupper(substr(PHP_OS, 0, 3) == 'MAC') ? "\r" : "\n");
}

$hn = SERVEUR;
$un = NOM;
$pw = PASSE;
$db = BASE;
$submit        = "Submit";
$options       = 1;
$baseFilename  = $tb;
$pageTitle     = $tb;

if (@$_REQUEST["action"] == "CHANGE_TB") {
  $_SESSION["tb"] = $_REQUEST["tb"];
} else {
  if (!isset($_SESSION["tb"]) || $_SESSION["tb"] == "admin") {
    $_SESSION["tb"] = "lab_members";
  }
}
$tb = $_SESSION["tb"];

$phpExtension = '.php';
if (isset($baseFilename) && $baseFilename != '') {
	$phpFile = $baseFilename.$phpExtension;
	//$contentFile = $baseFilename.'Content.inc';
	$contentFile = $baseFilename.'.php';
} elseif (isset($tb)) {
	$phpFile = $tb.$phpExtension;
	//$contentFile = $tb.'Content.inc';
	$contentFile = $tb.'.php';
} else {
	$phpFile = 'index'.$phpExtension;
	//$contentFile = 'Content.inc';
	$contentFile = 'phpMyEdit-content.php';
}

$buffer = '';

function echo_buffer($x)
{
	global $buffer;
	$buffer .= $x.PHP_EOL;
}

function check_constraints($tb,$fd)
{
  $query    = "show create table $tb";
  $result   = mysql_query($query);
  $tableDef = preg_split('/\n/',mysql_result($result,0,1));

  $constraint_arg="";
  while (list($key,$val) = each($tableDef)) {
    $words=preg_split("/[\s'`()]+/", $val);
    if ($words[1] == "CONSTRAINT" && $words[6]=="REFERENCES") {
      if ($words[5]==$fd) {
        $constraint_arg="  'values' => array(\n".
                        "    'table'  => '$words[7]',\n".
                        "    'column' => '$words[8]'\n".
                        "  ),\n";
      }

    }
  }
  return $constraint_arg;
}

$self = basename($_SERVER['PHP_SELF']);
$dbl  = @mysql_pconnect($hn, $un, $pw);
















$select_tb = "<form action='admin.php' method='POST'>";
$select_tb .= "<input type='hidden' name='action' value='CHANGE_TB'/>";
$select_tb .= "<select name='tb'>";
$tbs     = @mysql_list_tables($db, $dbl);
$num_tbs = @mysql_num_rows($tbs);
for ($j = 0; $j < $num_tbs; $j++) {
	$tb_choice = @mysql_tablename($tbs, $j);
  $tb_choice = htmlspecialchars($tb_choice);
  $checked = $tb_choice == $tb ? ' selected="selected" ' : '';
	$select_tb .= "<option value='$tb_choice' $checked>$tb_choice</option>";
}
$select_tb .= "</select>";
$select_tb .= "<input type='Submit' name='Submit' value='Show this table' />";
$select_tb .= "</form>";

echo $select_tb;


















@mysql_select_db($db);
$tb_desc = @mysql_query("DESCRIBE $tb");
$fds     = @mysql_list_fields($db,$tb,$dbl);
$j = 0; 
$fd = @mysql_field_name($fds, $j);
$ff = @mysql_field_flags($fds, $j);

if (!stristr($ff, 'primary_key')) {
  echo "ERROR, first field is not a primary_key.";
  exit();
}

$id = htmlspecialchars($fd);

{
	echo_buffer("
// MySQL host name, user name, password, database, and table
\$opts['hn'] = '$hn';
\$opts['un'] = '$un';
\$opts['pw'] = '$pw';
\$opts['db'] = '$db';
\$opts['tb'] = '$tb';

// Name of field which is the unique key
\$opts['key'] = '$id';

// Type of key field (int/real/string/date etc.)");

	if ($id == '') {
		echo_buffer("\$opts['key_type'] = '';");
	} else {
		$fds = @mysql_list_fields($db,$tb,$dbl);
		for ($j = 0; ($fd = @mysql_field_name($fds, $j)) != ''; $j++) {
			if ($fd == $id) {
				echo_buffer("\$opts['key_type'] = '".@mysql_field_type($fds, $j)."';");
				break;
			}
		}
	}
	echo_buffer("
// Sorting field(s)
\$opts['sort_field'] = array('$id');

// Options you wish to give the users
// A - add,  C - change, P - copy, V - view, D - delete,
// F - filter, I - initial sort suppressed
\$opts['options'] = \$privopt;
");

	@mysql_select_db($db);
	$tb_desc = @mysql_query("DESCRIBE $tb");
	$fds     = @mysql_list_fields($db, $tb, $dbl);
	$num_fds = @mysql_num_fields($fds);
	$ts_cnt  = 0;
	for ($k = 0; $k < $num_fds; $k++) {
		$fd = mysql_field_name($fds,$k);
		$fm = mysql_fetch_field($fds,$k);
		$fn = strtr($fd, '_-.', '   ');
		$fn = preg_replace('/(^| +)id( +|$)/', '\\1ID\\2', $fn); // uppercase IDs
		$fn = ucfirst($fn);
		$row = @mysql_fetch_array($tb_desc);
		echo_buffer('$opts[\'fdd\'][\''.$fd.'\'] = array('); // )
		echo_buffer("  'name'     => '".str_replace('\'','\\\'',$fn)."',");
		$auto_increment = strstr($row[5], 'auto_increment') ? 1 : 0;
		if (substr($row[1],0,3) == 'set') {
			echo_buffer("  'select'   => 'M',");
		} else {
			echo_buffer("  'select'   => 'T',");
		}
		if ($auto_increment) {
			echo_buffer("  'options'  => 'AVCPDR', // auto increment");
		}
		// timestamps are read-only
		else if (@mysql_field_type($fds, $k) == 'timestamp') {
			if ($ts_cnt > 0) {
				echo_buffer("  'options'  => 'AVCPD',");
			} else { // first timestamp
				echo_buffer("  'options'  => 'AVCPDR', // updated automatically (MySQL feature)");
			}
			$ts_cnt++;
		}
		echo_buffer("  'maxlen'   => ".@mysql_field_len($fds,$k).',');
		// blobs -> textarea
		if (@mysql_field_type($fds,$k) == 'blob') {
			echo_buffer("  'textarea' => array(");
			echo_buffer("    'rows' => 5,");
			echo_buffer("    'cols' => 50),");
		}
		// SETs and ENUMs get special treatment
		if ((substr($row[1],0,3) == 'set' || substr($row[1],0,4) == 'enum')
				&& ! (($pos = strpos($row[1], '(')) === false)) {
			$indent = str_repeat(' ', 18);
			$outstr = substr($row[1], $pos + 2, -2);
			$outstr = explode("','", $outstr);
			$outstr = str_replace("''", "'",  $outstr);
			$outstr = str_replace('"', '\\"', $outstr);
			$outstr = implode('",'.PHP_EOL.$indent.'"', $outstr);
			echo_buffer("  'values'   => array(".PHP_EOL.$indent.'"'.$outstr.'"),');
		}
		// automatic support for Default values
		if ($row[4] != '' && $row[4] != 'NULL') {
			echo_buffer("  'default'  => '".$row[4]."',");
		} else if ($auto_increment) {
			echo_buffer("  'default'  => '0',");
		}
		// check for table constraints
		$outstr = check_constraints($tb, $fd);
		if ($outstr != '') {
			echo_buffer($outstr);
		}
		echo_buffer("  'sort'     => true");
		//echo_buffer("  'nowrap'   => false,");
		echo_buffer(');');
	}

   
  eval($buffer);

}

require("footers.php");
?>
