<?php
require_once ("connect_entry.php");
?>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>

<body>
  <div id="divDebug" style="display: none; font-weight:normal; position:absolute; background-color:#EEEEEE; font-size:xx-small; top:0ex; width:38ex; right:0ex;">toto</div>

  <div id="sheets">

      <h3><?php echo LABNAME; ?> Lab Stocks</h3>
  
      <div id="wrapper">
        <div id="menu">
          <ul>
            <li id="home"><span><a href="home.php"> Home </a></span></li>
            <li id="plasmids"><span><a href="plasmids.php"> Plasmids </a></span></li>
            <li id="pl_features"><span><a href="pl_features.php"> Plasmids Features </a></span></li>
            <li id="strains"><span><a href="strains.php"> Strains </a></span></li>
            <li id="oligos"><span><a href="oligos.php"> Oligos </a></span></li>
            <li id="antibodies"><span><a href="antibodies.php"> Antibodies </a></span></li>
            <li id="cl_name"><span><a href="cl_name.php"> Cell Line Names </a></span></li>
            <li id="cl_passages"><span><a href="cl_passages.php"> Cell Line Passages </a></span></li>
            <!--li id="cl_storage"><span><a href="cl_storage.php"> Cell Line Storage </a></span></li-->
            <li id="rack"><span><a href="rack.php"> Box Manager </a></span></li>
            <li id="wwwblast"><span><a href="wwwblast.php"> wwwBLAST </a></span></li>
            <li id="collections"><span><a href="collections.php"> Collections </a></span></li>
            <li id="pip_stock"><span><a href="pip_stock.php"> Pipets </a></span></li>
            <li id="pip_history"><span><a href="pip_history.php"> Pipet History </a></span></li>
            <li id="notebooks"><span><a href="notebooks.php"> Lab's Notebooks </a></span></li>
            <li id="logout"><span><a href="logout.php"> Logout </a></span></li>
            <li id="admin"><span><a href="admin.php"> Admin </a></span></li>
          </ul>
        </div>

        <div class="sheet">

        <script type="text/javascript"> 
        id=window.location.href.split("/").pop().split(".")[0];
        document.getElementById("divDebug").innerHTML=id;
        document.getElementById(id).setAttribute("class","active");
        </script>


<?php

$to_be_post_list_content = "";
$to_be_pre_list_content = "";
// print($_SERVER["SCRIPT_FILENAME"]);


$tb = array_shift(split("\.php", array_pop(split("/", $_SERVER["SCRIPT_FILENAME"]))));
/*************************/
//
// Connect to DB and 
// handle session/authentification
//
/*************************/

require_once ("lib/session.lib.php");
// connect to DB
$connexion = mysql_pconnect (SERVEUR, NOM, PASSE);
if (!$connexion)
{
 echo "Sorry, connexion to " . SERVEUR . " failed\n";
 exit;
}
if (!mysql_select_db (BASE, $connexion))
{
 echo "Sorry, connexion to database " . BASE . " failed\n";
 exit;
}

if (!(in_array($tb, array("home", "")))) {
  // authentification
  CleanOldSessions($connexion);
  $session = control_access ($tb.".php", $_POST, session_id(), $connexion);
  if (!is_object($session)) {
  	exit;
  }

  // According to login:
  // Define priviledge options
  // to pass to phpMyEdit
  //
  //check that visitor is allowed to use this table
  if (($tb == "admin" || $tb == "add_box") && $session->mode != "super") {
    echo "<p>Sorry, your session is not granted access to admin panel. Please logout and try again with appropriate login...</p>";
    exit;
  } else if ($session->target_table != $tb && $session->target_table != "all") {
    echo "<p>Sorry, your session is not granted access to table <B> $tb </B> in <B>$session->mode</B> mode (login must be <b>$session->mode$tb</b>). Please logout and try again with appropriate login...</p>";
    exit;
  }
  //define priv options and display warning accordingly
  if ($session->login == "superuser"){
  	$privopt = 'ACPVDF';
  	$colorband = "red";
  	$messageband = '<blink>WARNING</bink>: You are in <I><B> SUPERUSER </I></B> mode, at your own risk.';
  } else if ($session->mode == "view"){
  	$privopt = 'VF';
  	$colorband = "#00ff00";
  	$messageband = "You are safely in VIEW mode";
  } else if ($session->mode == "add"){
  	$privopt = 'APVF';
  	$colorband = "orange";
  	$messageband = 'You are in <I><B> ADD </I></B> mode, please logout after you additions';
  } else if ($session->mode == "edit"){
  	$privopt = 'ACPVDF';
  	$colorband = "rgb(250,0,255)";
  	$messageband = 'IMPORTANT: You are in <I><B> EDIT </I></B> mode, please logout after editing.';
  } else{
  	$privopt = '';
  	$colorband = "grey";
  }
  echo "<h4 style='background-color: $colorband'> $messageband </h4>";
}
// Fix a problem displaying
// symbols (such as delta)
mysql_query("SET NAMES 'UTF8'", $connexion);

// // Include My own MVC (FCh.)
// $mvc_filename = $tb . ".MVC.php";
// if (file_exists($mvc_filename)) {
//   require($mvc_filename);
// } 

// Number of records to display on the screen
// Value of -1 lists all records in a table
$opts['inc'] = 15;

// Number of lines to display on multiple selection filters
$opts['multiple'] = '4';

// Navigation style: B - buttons (default), T - text links, G - graphic links
// Buttons position: U - up, D - down (default)
$opts['navigation'] = 'UDBG';

// Display special page elements
$opts['display'] = array(
	'form'  => true,
	'query' => true,
	'sort'  => true,
	'time'  => true,
	'tabs'  => true
);

// Set default prefixes for variables
$opts['js']['prefix']               = 'PME_js_';
$opts['dhtml']['prefix']            = 'PME_dhtml_';
$opts['cgi']['prefix']['operation'] = 'PME_op_';
$opts['cgi']['prefix']['sys']       = 'PME_sys_';
$opts['cgi']['prefix']['data']      = 'PME_data_';

/* Get the user's default language and use it if possible or you can
   specify particular one you want to use. Refer to official documentation
   for list of available languages. */
$opts['language'] = $_SERVER['HTTP_ACCEPT_LANGUAGE'] . '-UTF8';

?>


<div id="pre_list"></div>

<?php

// echo "<pre>";
// print_r($_SESSION);
// echo "</pre>";
if (@$_SESSION["tb"] != $tb) {
  unset($_SESSION["action"]);
  $_SESSION["tb"] = $tb;   
}
// MVC for ADV_SEARCH
if (array_key_exists("action", $_REQUEST)) {
  if ($_REQUEST["action"] == "ADV_SEARCH") {
    $_SESSION["action"] = $_REQUEST["action"];
    $fltr = "";
    $cols = preg_filter("/col_/","", array_keys($_REQUEST));
    foreach ($cols as $index) {
      if ($index != 0) {
        $fltr .= " " . $_REQUEST["op_$index"];
      }
      if ($_REQUEST["col_$index"] == "Genotype") {
        $k = $_REQUEST["input_$index"];
        $fltr .= " (`locus1` LIKE '%$k%' OR `locus2` LIKE '%$k%' OR `locus3` LIKE '%$k%' OR `locus4` LIKE '%$k%' OR `locus5` LIKE '%$k%' OR `ADE2` LIKE '%$k%' OR `HIS3` LIKE '%$k%' OR `LEU2` LIKE '%$k%' OR `LYS2` LIKE '%$k%' OR `MET15` LIKE '%$k%' OR `TRP1` LIKE '%$k%' OR `URA3` LIKE '%$k%' OR `HO_` LIKE '%$k%' OR `Cytoplasmic_Character` LIKE '%$k%' OR `extrachromosomal_plasmid` LIKE '%$k%')";
      } else {
        $fltr .= " " . $_REQUEST["col_$index"];
        $fltr .= " " . $_REQUEST["cond_$index"];
        if ($_REQUEST["cond_$index"] == "LIKE") {
          $fltr .= " '%" . $_REQUEST["input_$index"] . "%'";                    
        } else {
          $fltr .= " '" . $_REQUEST["input_$index"] . "'";          
        }
      }
    }
    $_SESSION["filters"] = $fltr;    
  }
}
if (array_key_exists("action", $_SESSION)) {
  if ($_SESSION["action"] == "ADV_SEARCH") {
    $opts["filters"] = $_SESSION["filters"];
  }
}






?>
