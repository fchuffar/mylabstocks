<?php
require_once("seq2png.php");
// a Trigger to display plsmid map image
$all = $this->myQuery("SELECT * FROM " . $this->tb . " WHERE id=" . $this->rec);
// reach the plasmid displayed
$plasmid = mysql_fetch_object($all);
if ($plasmid) {
    $id =  $this->rec;
    if ($_REQUEST["action"] == "REMOVE_FILE_SEQ") {
      if ($plasmid->Link_to_file != "") {
        $to_rem_file = "plasmid_files/" . $plasmid->Link_to_file;
        if (file_exists($to_rem_file)) {
          unlink($to_rem_file);
        }
      }
      $reqsql = "UPDATE  plasmids SET sequence='', Link_to_file=''  WHERE  id = $id";
      mysql_query($reqsql);
      $all = $this->myQuery("SELECT * FROM " . $this->tb . " WHERE id=" . $this->rec);
      $plasmid = mysql_fetch_object($all);
    }
    if ($_REQUEST["action"] == "ADD_GB_GZ_FILE") {
      $userfile = $_FILES["userfile"]["tmp_name"];
      $userfile_name = $_FILES["userfile"]["name"];
      if (stristr($userfile_name, ".gb.gz")) {
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
        $reqsql = "UPDATE  plasmids SET sequence='$seq', Link_to_file='$dest_filename'  WHERE  id = $id";
        mysql_query($reqsql);
        $all = $this->myQuery("SELECT * FROM " . $this->tb . " WHERE id=" . $this->rec);
        $plasmid = mysql_fetch_object($all);
      }
    }

  // display image
  if ($plasmid->sequence) {
    if ($GLOBALS["session"]->mode == "edit") {
      echo("<form action='' method='post'>Remove file, filename and sequance for this plasmid: <input type='hidden' name='action' value='REMOVE_FILE_SEQ'/><input type='button' name='send' value='Remove' onclick='confirm(\"Are you sure that you want to remove file, filename and sequence for this plasmid?\");this.form.submit();'/></form><hr/>");
    }
    $imgurl = seq2png($plasmid->sequence, PLASMAPPER_SERVER);
    echo '<div id="to_be_post_list">';
    echo '<img src="' . $imgurl . '"><br/>';
    echo '<textarea readonly rows="10" cols="100">'.$plasmid->sequence.'</textarea>';
    $wwwblast_url = WWWBLAST_SERVER . "blast.cgi?DATALIB=plfeatstock_db&PROGRAM=blastn&EXPECT=10&OOF_ALIGN=0&OVERVIEW=on&ALIGNMENT_VIEW=0&DESCRIPTIONS=100&ALIGNMENTS=50&COLOR_SCHEMA=0&SEQUENCE=$plasmid->sequence";
    $fp = fopen($wwwblast_url, 'r', false);
    $resp = stream_get_contents($fp);
    echo "<br/>" . preg_replace("/nph-viewgif.cgi/", WWWBLAST_SERVER . "nph-viewgif.cgi", $resp);
    echo '</div>';
  } else {
    if ($GLOBALS["session"]->mode == "edit") {  
      echo("<form action='' method='post' enctype='multipart/form-data'>Add a .gb.gz file to this plasmid: <input type='hidden' name='action' value='ADD_GB_GZ_FILE'/><input name='userfile' type='file' size='10'/><input type='button' name='send' value='Upload' onclick='return this.form.submit();'/></form><hr/>");
     echo '<div id="to_be_post_list"></div>';
   }
  }
}


$plasmid_raw_dir = "";
if (file_exists($plasmid_raw_dir)) {
  $post_list_content .= "<center><iframe src='collections' width='95%' height='90%'/></center>";
}

?>
