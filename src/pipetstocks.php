<?php
session_start ();
?>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
	body {background-color:  #FFF8DC}
	input.btn { color: #050; font: bold 84%'trebuchet ms',helvetica,sans-serif; background-color: #fed;}
	input.btn2{ color: #050; font: bold 84%'trebuchet ms',helvetica,sans-serif; background-color: #CC6633;}
	hr.pme-hr		     { border: 0px solid; padding: 0px; margin: 0px; border-top-width: 1px; height: 1px; }
	table.pme-main 	     { border: #004d9c 1px solid; border-collapse: collapse; border-spacing: 0px; width: 100%; }
	table.pme-navigation { border: #004d9c 0px solid; border-collapse: collapse; border-spacing: 0px; width: 100%; }
	td.pme-navigation-0, td.pme-navigation-1 { white-space: nowrap; }
	th.pme-header	     { border: #004d9c 1px solid; padding: 4px; background: #add8e6; }
	td.pme-key-0, td.pme-value-0, td.pme-help-0, td.pme-navigation-0, td.pme-cell-0,
	td.pme-key-1, td.pme-value-1, td.pme-help-0, td.pme-navigation-1, td.pme-cell-1,
	td.pme-sortinfo, td.pme-filter { border: #004d9c 1px solid; padding: 3px; }
	td.pme-buttons { text-align: left;   }
	td.pme-message { text-align: center; }
	td.pme-stats   { text-align: right;  }
</style>
<h3> List of Pipets of the GY lab
    <CENTER>
    <FORM ACTION = 'logout.php' METHOD = 'POST'>
      <INPUT TYPE='SUBMIT' VALUE = 'Logout' NAME = 'logout' class = "btn2">
    </FORM> </CENTER>
    <FORM ACTION = 'pipethistory.php' METHOD = 'POST'>
      <INPUT TYPE='SUBMIT' VALUE = 'Go to Pipets History' NAME = 'gotohistory' class = "btn">
    </FORM>
</h3>
<?php

/*
 * IMPORTANT NOTE: This generated file contains only a subset of huge amount
 * of options that can be used with phpMyEdit. To get information about all
 * features offered by phpMyEdit, check official documentation. It is available
 * online and also for download on phpMyEdit project management page:
 *
 * http://platon.sk/projects/main_page.php?project_id=5
 *
 * This file was generated by:
 *
 *                    phpMyEdit version: unknown
 *       phpMyEdit.class.php core class: 1.204
 *            phpMyEditSetup.php script: 1.50
 *              generating setup script: 1.50
 */



/*************************/
//
// Connect to DB and 
// handle session/authentification
//
/*************************/
require_once ("connect_entry.php");
require_once ("session.php");
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
// authentification
CleanOldSessions($connexion);
$session = ControleAcces ("pipetstocks.php", $_POST, session_id(), $connexion);
if (!is_object($session))
	exit;

/*************************/
//
// According to login:
// Define priviledge options
// to pass to phpMyEdit
//
/*************************/

//check that visitor is allowed to use this table
$tb = "pip_stock";
if ($session->target_table != $tb && $session->target_table != "all")
{
   echo "Sorry, your session is not granted access to table <B> $tb </B><p>";
   echo "Please logout and try again with appropriate login<P>";
   exit;
}

//define priv options and change background color accordingly
if ($session->mode == "view"){
	$privopt = 'VF';
	$colorband = "#00ff00";
	$messageband = "You are safely in VIEW mode";
}
else if ($session->mode == "add"){
	$privopt = 'APVF';
	$colorband = "orange";
	$messageband = 'You are in <I><B> ADD </I></B> mode, please logout after you additions';
}
else if ($session->mode == "edit"){
	$privopt = 'ACPVDF';
	$colorband = "rgb(250,0,255)";
	$messageband = 'IMPORTANT: You are in <I><B> EDIT </I></B> mode, please logout after editing.';
}
else{
	$privopt = '';
	$colorband = "grey";
}
echo '<style type="text/css"> ';
echo	"h4 {background-color: $colorband }";
echo '</style>';
echo "<h4> $messageband </h4>";
echo "<HR>";

//************************/
//
// Fix a problem displaying
// symbols (such as delta)
//
//************************/

mysql_query("SET NAMES 'UTF8'", $connexion);

/*************************/
//
// Pass phpMyEdit options
//
/*************************/


$opts['dbh'] = $connexion;
$opts['tb'] = $tb;

// Name of field which is the unique key
$opts['key'] = 'ID';

// Type of key field (int/real/string/date etc.)
$opts['key_type'] = 'int';

// Sorting field(s)
$opts['sort_field'] = array('ID');

// Number of records to display on the screen
// Value of -1 lists all records in a table
$opts['inc'] = 15;

// Options you wish to give the users
// A - add,  C - change, P - copy, V - view, D - delete,
// F - filter, I - initial sort suppressed
$opts['options'] = $privopt;

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

/* Table-level filter capability. If set, it is included in the WHERE clause
   of any generated SELECT statement in SQL query. This gives you ability to
   work only with subset of data from table.

$opts['filters'] = "column1 like '%11%' AND column2<17";
$opts['filters'] = "section_id = 9";
$opts['filters'] = "PMEtable0.sessions_count > 200";
*/

/* Field definitions
   
Fields will be displayed left to right on the screen in the order in which they
appear in generated list. Here are some most used field options documented.

['name'] is the title used for column headings, etc.;
['maxlen'] maximum length to display add/edit/search input boxes
['trimlen'] maximum length of string content to display in row listing
['width'] is an optional display width specification for the column
          e.g.  ['width'] = '100px';
['mask'] a string that is used by sprintf() to format field output
['sort'] true or false; means the users may sort the display on this column
['strip_tags'] true or false; whether to strip tags from content
['nowrap'] true or false; whether this field should get a NOWRAP
['select'] T - text, N - numeric, D - drop-down, M - multiple selection
['options'] optional parameter to control whether a field is displayed
  L - list, F - filter, A - add, C - change, P - copy, D - delete, V - view
            Another flags are:
            R - indicates that a field is read only
            W - indicates that a field is a password field
            H - indicates that a field is to be hidden and marked as hidden
['URL'] is used to make a field 'clickable' in the display
        e.g.: 'mailto:$value', 'http://$value' or '$page?stuff';
['URLtarget']  HTML target link specification (for example: _blank)
['textarea']['rows'] and/or ['textarea']['cols']
  specifies a textarea is to be used to give multi-line input
  e.g. ['textarea']['rows'] = 5; ['textarea']['cols'] = 10
['values'] restricts user input to the specified constants,
           e.g. ['values'] = array('A','B','C') or ['values'] = range(1,99)
['values']['table'] and ['values']['column'] restricts user input
  to the values found in the specified column of another table
['values']['description'] = 'desc_column'
  The optional ['values']['description'] field allows the value(s) displayed
  to the user to be different to those in the ['values']['column'] field.
  This is useful for giving more meaning to column values. Multiple
  descriptions fields are also possible. Check documentation for this.
*/

$opts['fdd']['ID'] = array(
  'name'     => 'ID',
  'select'   => 'N',
  //'options'  => 'LAVCPDR', // auto increment
  'maxlen'   => 10,
  'default'  => '0',
  'sort'     => true
);
$opts['fdd']['Serial_Number'] = array(
  'name'     => 'Serial Number',
  'select'   => 'T',
  'maxlen'   => 30,
  //'default'  => '0',
  'sort'     => true
);
$opts['fdd']['Marque'] = array(
  'name'     => 'Marque',
  'select'   => 'D',
  'maxlen'   => 25,
  'sort'     => true,
  'values'   => array(
  	'table'  => 'pip_marque',
	'column' => 'Marque')
);
$opts['fdd']['Type'] = array(
  'name'     => 'Type',
  'select'   => 'D',
  'maxlen'   => 25,
  'sort'     => true,
  'values'   => array(
  	'table'  => 'pip_type',
	'column' => 'Type')
);

// TRIGGER
// Before displaying the view page


// Now important call to phpMyEdit
require_once 'phpMyEdit.class.php';
new phpMyEdit($opts);

?>


