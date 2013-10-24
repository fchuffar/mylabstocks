<?php
session_start ();
require("headers.php");
//$opts["filters"] = "`ID`=330";

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
  //'options'  => 'AVCPDR', // auto increment
  'maxlen'   => 10,
  'default'  => '0',
  'sort'     => true
);
$opts['fdd']['Name_'] = array(
  'name'     => 'Name',
  'select'   => 'T',
  'maxlen'   => 50,
  'sort'     => true
);
$opts['fdd']['sequence'] = array(
  'name'     => 'Seq',
  'select'   => 'T',
  // 'textarea' => array(
  //   'rows' => 5,
  // 		'cols' => 10
  // ),
  'options'  => 'APD',
  'maxlen'   => 50000,
  'sort'     => false,
  'sqlw' => 'IF($val_qas = "", NULL, $val_qas)' //to use real NULL instead of empty blanks
);
$opts['fdd']['Link_to_file'] = array(
  'name'     => 'Link',
  'select'   => 'T',
   'options'  => 'LFPDV',
  'maxlen'   => 50,
  'sort'     => true,
  'sqlw' => 'IF($val_qas = "", NULL, $val_qas)' //to use real NULL instead of empty blanks
);
$opts['fdd']['Other_names'] = array(
  'name'     => 'Other names',
  'select'   => 'T',
  'maxlen'   => 50,
  'sort'     => true,
  'sqlw' => 'IF($val_qas = "", NULL, $val_qas)' //to use real NULL instead of empty blanks
);
$opts['fdd']['Author'] = array(
  'name'     => 'Author',
  'select'   => 'D',
  'maxlen'   => 25,
  'sort'     => true,
  'values'   => array(
  	'table'  => 'lab_members',
	'column' => 'id')
);
$opts['fdd']['Type_'] = array(
  'name'     => 'Type ',
  'select'   => 'D',
  'maxlen'   => 25,
  'sort'     => true,
  'values'   => array(
  	'table'  => 'pl_type',
	'column' => 'type')
);
$opts['fdd']['Marker_1'] = array(
  'name'     => 'Marker 1',
  'select'   => 'D',
  'maxlen'   => 25,
  'sort'     => true,
  'values'   => array(
  	'table'  => 'pl_yeast_marker',
	'column' => 'type')
);
$opts['fdd']['Marker_2'] = array(
  'name'     => 'Marker 2',
  'select'   => 'D',
  'maxlen'   => 25,
  'sort'     => true,
  'values'   => array(
  	'table'  => 'pl_yeast_marker',
	'column' => 'type')
);
$opts['fdd']['Construction_Description'] = array(
  'name'     => 'Construction Description',
  'select'   => 'T',
  'maxlen'   => 1000000000, //4294967295,
  'textarea' => array(
    'rows' => 5,
    'cols' => 50),
  'sort'     => true
);
$opts['fdd']['Tags'] = array(
  'name'     => 'Tags',
  'select'   => 'D',
  'maxlen'   => 25,
  'sort'     => true,
  'values'   => array(
  	'table'  => 'pl_tag',
	'column' => 'type')
);
$opts['fdd']['Reporter'] = array(
  'name'     => 'Reporter',
  'select'   => 'T',
  'maxlen'   => 25,
  'sort'     => true
);
$opts['fdd']['Promoter'] = array(
  'name'     => 'Promoter',
  'select'   => 'D',
  'maxlen'   => 25,
  'sort'     => true,
  'values'   => array(
  	'table'  => 'pl_yeast_promoter',
	'column' => 'type')
);
$opts['fdd']['parent_vector'] = array(
  'name'     => 'Parent vector',
  'select'   => 'T',
  'maxlen'   => 50,
  'sort'     => true
);
$opts['fdd']['Insert_'] = array(
  'name'     => 'Insert ',
  'select'   => 'T',
  'maxlen'   => 50,
  'sort'     => true
);
$opts['fdd']['Insert_Type'] = array(
  'name'     => 'Insert Type',
  'select'   => 'T',
  'maxlen'   => 25,
  'sort'     => true
);
$opts['fdd']['Reference_'] = array(
  'name'     => 'Reference ',
  'select'   => 'T',
  'maxlen'   => 200,
  'sort'     => true
);

$opts['fdd']['date_'] = array(
  'name'     => 'Date ',
  'select'   => 'N',
  'maxlen'   => 10,
  'sort'     => true,
  'default'  => date("Y-m-d", strtotime("now"))
);
$opts['fdd']['Checkings'] = array(
  'name'     => 'Checkings',
  'select'   => 'T',
  'maxlen'   => 200,
  'sort'     => true
);
$opts['fdd']['Bacterial_selection'] = array(
  'name'     => 'Bacterial selection',
  'select'   => 'D',
  'maxlen'   => 25,
  'sort'     => true,
  'values'   => array(
  	'table'  => 'pl_bacterial_selection',
	'column' => 'type'),
  'default'  => 'Amp'
);



//link to sequence file:
$opts['fdd']['Link_to_file']['URL'] = '$value';
//$opts['fdd']['Link_to_file']['URLdisp'] = 'Link'; 
$opts['fdd']['Link_to_file']['URLprefix'] = 'plasmid_files/';
$opts['fdd']['Link_to_file']['URLtarget'] = '_self';

// TRIGGER
$opts['triggers']['select']['pre'][]    = 'plasmids.MVC.php';
$opts['triggers']['update']['pre'][]    = 'plasmids.MVC.php';

require("footers.php");
?>