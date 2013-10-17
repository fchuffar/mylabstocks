<?php


require_once("lib/seq.lib.php");
// a Trigger to display plsmid map image
$all = $this->myQuery("SELECT * FROM " . $this->tb . " WHERE id=" . $this->rec);
// reach the plasmid displayed
$plasmid = mysql_fetch_object($all);

if ($plasmid) {

  if ($_REQUEST["action"] == "REMOVE_FILE_SEQ") {
    if ($plasmid->Link_to_file != "") {
      $to_rem_file = "plasmid_files/" . $plasmid->Link_to_file;
      if (file_exists($to_rem_file)) {
        unlink($to_rem_file);
      }
    }
    $reqsql = "UPDATE  plasmids SET sequence='', Link_to_file=''  WHERE  id = $this->rec";
    mysql_query($reqsql);
    $all = $this->myQuery("SELECT * FROM " . $this->tb . " WHERE id=" . $this->rec);
    $plasmid = mysql_fetch_object($all);
  }

  if ($_REQUEST["action"] == "ADD_GB_GZ_FILE") {
    // echo"<pre>";
    // print_r($_FILES);
    // echo"</pre>";
    if ($_FILES["userfile"]["error"]) {
      exit("ERROR, your file is probably too big, maximum upload file size is "  . ini_get('upload_max_filesize') . ". <br/><a href='".$_SERVER["HTTP_REFERER"]."'>Back</a>");
    }
    $userfile = $_FILES["userfile"]["tmp_name"];
    $userfile_name = $_FILES["userfile"]["name"];
    if (stristr($userfile_name, ".gb.gz")) {
      $ext=".gb.gz";
    } else if (stristr($userfile_name, ".gb")) {
      $fp = fopen($userfile, "r");
      $data = fread ($fp, filesize($userfile));
      fclose($fp);
      $zp = gzopen($userfile, "w9");
      gzwrite($zp, $data);
      gzclose($zp);      
      $userfile_name = $userfile_name . ".gz";
      $ext=".gb.gz";
    } else {
      if(file_exists($userfile)) {
        unlink($userfile);
      }
      exit("ERROR 1, your file MUST have the extension .gb.gz (lowercase)). <br/><a href='".$_SERVER["HTTP_REFERER"]."'>Back</a>");
    }
    $dest_filename = str_replace(" ","_",substr($userfile_name, 0, strlen($userfile_name)-6)) . $ext;
    $dest_filepath = "plasmid_files/" . $dest_filename;
    if (file_exists($dest_filepath)) {
      if (file_exists($userfile)) {
        unlink($userfile);
      }
      exit("ERROR 2, this .gb.gz filename is already used. <br/><a href='".$_SERVER["HTTP_REFERER"]."'>Back</a>");
    }
    echo "<pre>$userfile $dest_filepath</pre>";
    if (!copy($userfile, $dest_filepath)){
      if (file_exists($userfile)) {
        unlink($userfile);
      }
      exit("ERROR 3, problem copying file. <br/><a href='".$_SERVER["HTTP_REFERER"]."'>Back</a>");
    }
    if(file_exists($userfile)) {
      unlink($userfile);
    }

    $url = "/var/www/labstocks/plasmid_files/" . $dest_filename;
    $handle = gzopen($url, 'r');
    if ($handle) {
      $content = "";
      while (!gzeof($handle)) {
         $buffer = gzgets($handle, 4096);
         $content .= $buffer;
      }
      gzclose($handle);
      preg_match('#ORIGIN(.*)//#sm', $content, $matches);
      $seq = $matches[0];
      $seq = preg_replace("#ORIGIN#", "", $seq);
      $seq = preg_replace("#[^a-zA-Z]#ms", "", $seq);
      $reqsql = "UPDATE  plasmids SET sequence='$seq', Link_to_file='$dest_filename'  WHERE  id = $this->rec";
      mysql_query($reqsql);
      $all = $this->myQuery("SELECT * FROM " . $this->tb . " WHERE id=" . $this->rec);
      $plasmid = mysql_fetch_object($all);
    }
  }


  /*
  * VIEW
  */

  $in_edit_mode = $_REQUEST["PME_sys_operation"] == "Change" || $_REQUEST["PME_sys_operation"] == "PME_op_Change";

  if ($plasmid->sequence) {
    if ($in_edit_mode) {  
      $remove_gbgz_form = <<<EOD
<form action='' method='post'>
  Remove file, filename and sequence for this plasmid: 
  <input type='hidden' name='PME_sys_operation' value='PME_op_Change'/>
  <input type='hidden' name='PME_sys_rec' value='$this->rec'/>
  <input type='hidden' name='action' value='REMOVE_FILE_SEQ'/>
  <input type='button' name='send' value='Remove' onclick='if(confirm("Are you sure that you want to remove file, filename and sequence for this plasmid?")){this.form.submit()}else{return false;}'/>
</form>
EOD;
    }
    $imgurl = seq2png($plasmid->sequence, PLASMAPPER_SERVER);
    $plasmapper_output = <<<EOD
<center>
<img src="$imgurl">
<br/>
<textarea readonly rows="10" cols="100">$plasmid->sequence</textarea></center>
</center>
EOD;

    $wwwblast_url = WWWBLAST_SERVER . "blast.cgi";
    $resp = post_vars($wwwblast_url, array(
      "DATALIB" => "plfeatstock_db", 
      "PROGRAM" => "blastn", 
      "EXPECT" => 10, 
      "OOF_ALIGN" => 0, 
      "OVERVIEW" => "on", 
      "ALIGNMENT_VIEW" => 0, 
      "DESCRIPTIONS" => 100, 
      "ALIGNMENTS" => 50, 
      "COLOR_SCHEMA" => 0,
      "SEQUENCE" => $plasmid->sequence
    ));

    $blast_output = preg_replace("/nph-viewgif.cgi/", WWWBLAST_SERVER . "nph-viewgif.cgi", $resp);

  } else {
    if ($in_edit_mode) {  
      $add_gbgz_form = <<<EOD
    <div class="centered_form">
      <i>Add a <b>.gb</b> or a <b>.gb.gz</b> file to this plasmid</i> 
      <br/>
      <br/>
      <form action='' method='post' enctype='multipart/form-data'>
        <fieldset>
          <legend>Upload .gb File</legend>
          <input type='hidden' name='action' value='ADD_GB_GZ_FILE'/>
          <input type='hidden' name='PME_sys_operation' value='PME_op_Change'/>
          <input type='hidden' name='PME_sys_rec' value='$this->rec'/>
          <input name='userfile' type='file' size='10'/>
          <input type='button' name='send' value='Upload' onclick='return this.form.submit();'/>
        </fieldset>
      </form>
    </div>
EOD;
    }
  }
}


  $to_be_post_list_content .= <<<EOD
    <div class="sheet">
    $remove_gbgz_form
    $add_gbgz_form
    $plasmapper_output
    </div>
EOD;

if ($blast_output != "") {
  $to_be_post_list_content .= <<<EOD
    <div class="sheet">
    $blast_output
    </div>
EOD;
}

?>
