<?php
require_once ("connect_entry.php");

$tmp_dir = "/tmp/";
$backup_dirname = "labstocks_backup_" . date("Y-m-d_H-i-s", mktime());
$backup_filename = $backup_dirname . ".tgz";
$absolute_backup_dir = $tmp_dir . $backup_dirname;
$absolute_backup_file = $absolute_backup_dir . ".tgz";

exec("mkdir $absolute_backup_dir");
exec("chmod a+w $absolute_backup_dir");

exec("mkdir $absolute_backup_dir");
if ($_REQUEST["FULL_BACK"]) {
  exec("cp -r plasmid_files raw_dirs $absolute_backup_dir");
}  
  

// $cmd = "mysqldump --user=" . NOM . " --password=" . PASSE . " --host=" . SERVEUR . ' --tab=' . $absolute_backup_dir . ' --fields-terminated-by=";" --fields-enclosed-by="\"" --fields-escaped-by="\"\"" --lines-terminated-by="\r\n" --no-create-db --no-create-info ' . BASE . " " . $_REQUEST["TABLE"] . " > " . $absolute_backup_dir . "/" . BASE . "_" . $_REQUEST["TABLE"] . ".csv";

if ($_REQUEST["TABLE"]) {
  $cmd = "mysqldump --user=" . NOM . " --password=" . PASSE . " --host=" . SERVEUR . ' --tab=' . $absolute_backup_dir . ' --fields-terminated-by=";"  --no-create-db --no-create-info ' . BASE . " " . $_REQUEST["TABLE"];
  // echo($cmd);
  // die();
  exec($cmd);  
  exec("cp $absolute_backup_dir/" . $_REQUEST["TABLE"] . ".txt $absolute_backup_dir/" . $_REQUEST["TABLE"] . ".csv ");
} else {
  exec("mysqldump --user=" . NOM . " --password=" . PASSE . " --host=" . SERVEUR . " " . BASE . " > " . $absolute_backup_dir . "/" . BASE . ".sql");  
}

$cmd = "tar Pcfvz $absolute_backup_file -C $tmp_dir $backup_dirname";
exec($cmd);
exec("rm -Rf " . $absolute_backup_dir);

$attachment_location = $absolute_backup_dir . ".tgz";
if (file_exists($attachment_location)) {
  header($_SERVER["SERVER_PROTOCOL"] . " 200 OK");
  header("Cache-Control: public"); // needed for i.e.
  //header("Content-Type: application/gzip");
  header("Content-Transfer-Encoding: Binary");
  header("Content-Length:".filesize($attachment_location));
  header("Content-Disposition: attachment; filename=" . $backup_filename);
  readfile($attachment_location);
  exec("rm -Rf $absolute_backup_file");
  die();        
} else {
  die("Error: File not found.");
} 



?>
