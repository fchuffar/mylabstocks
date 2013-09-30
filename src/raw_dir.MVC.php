<?php
$q = "SELECT * FROM $this->tb WHERE `$this->key`='$this->rec'";
// echo "$q";
// echo "<pre>";
// print_r($this);
// echo "</pre>";
$all = $this->myQuery($q);
$current_object = mysql_fetch_object($all);

if ($current_object) {
  $current_class_raw_dir = "raw_dirs/$this->tb";
  $current_entry_raw_dir = "$current_class_raw_dir/$this->rec/";
  if ($_REQUEST["action"] == "ADD_RAW_FILE") {
    if (!file_exists($current_class_raw_dir)) {
      mkdir($current_class_raw_dir);
    }
    $userfile = $_FILES["userfile"]["tmp_name"];
    $userfile_name = $_FILES["userfile"]["name"];
    $ext = strtolower(array_pop(explode("\.", $userfile_name)));
    if (in_array($ext, array("php", "php5", "cgi"))) {
      if(file_exists($userfile)) {
        unlink($userfile);
      }
      exit("ERROR 1, your file CAN NOT have this extension.<br/><a href='".$_SERVER["HTTP_REFERER"]."'>Back</a>");
    }
    if (!file_exists($current_entry_raw_dir)) {
      mkdir($current_entry_raw_dir);
    }
    $dest_filename = str_replace(" ","_",substr($userfile_name, 0, strlen($userfile_name)));
    $dest_filepath = $current_entry_raw_dir . $dest_filename;
    if (file_exists($dest_filepath)) {
      if (file_exists($userfile)) {
        unlink($userfile);
      }
      exit("ERROR 2, this filename is already used. <br/><a href='".$_SERVER["HTTP_REFERER"]."'>Back</a>");
    }
    if (!copy($userfile, $dest_filepath)){
      if (file_exists($userfile)) {
        unlink($userfile);
      }
      exit("ERROR 3, problem copying file. <br/><a href='".$_SERVER["HTTP_REFERER"]."'>Back</a>");
    }
    if(file_exists($userfile)) {
      unlink($userfile);
    }
  }
  /*
  * VIEW
  */
  $in_edit_mode = $_REQUEST["PME_sys_operation"] == "Change" || $_REQUEST["PME_sys_operation"] == "PME_op_Change";

  if ($in_edit_mode) {  
    $raw_dir_form = <<<EOD
  <form action='' method='post' enctype='multipart/form-data'>
    Upload a file to the raw directory of this entry: 
    <input type='hidden' name='PME_sys_operation' value='PME_op_Change'/>
    <input type='hidden' name='PME_sys_rec' value='$this->rec'/>
    <input type='hidden' name='action' value='ADD_RAW_FILE'/>
    <input name='userfile' type='file' size='10'/>
    <input type='button' name='send' value='Upload' onclick='return this.form.submit();'/>
  </form>
EOD;
  }

  if (file_exists($current_entry_raw_dir)) {
    $fp = fopen(LABSTOCK_SERVER . $current_entry_raw_dir, 'r', false);
    $raw_dir_content = preg_replace("/a href=\"/", "a href=\"" . LABSTOCK_SERVER . $current_entry_raw_dir, stream_get_contents($fp));
    preg_match("'<table>(.*?)</table>'si", $raw_dir_content, $match);
    // print_r($match);
    $raw_dir_frame = "<table>" . $match[1] . "</table>";
  }
}

$to_be_post_list_content .= <<<EOD
  $raw_dir_form
  $raw_dir_frame
  <hr/>
EOD;
?>
