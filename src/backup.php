<?php
require_once ("connect_entry.php");

$tmp_dir = "/tmp/";
$backup_dirname = "labstocks_backup_" . date("Y-m-d_H:i:s", mktime());
$backup_filename = $backup_dirname . ".tgz";
$absolute_backup_dir = $tmp_dir . $backup_dirname;
$absolute_backup_file = $absolute_backup_dir . ".tgz";

exec("mkdir $absolute_backup_dir");
if ($_REQUEST["FULL_BACK"]) {
  exec("cp -r plasmid_files raw_dirs $absolute_backup_dir");
}
exec("mysqldump --user=" . NOM . " --password=" . PASSE . " --host=" . SERVEUR . " " . BASE . " > " . $absolute_backup_dir . "/" . BASE . ".sql");
$cmd = "tar Pcfvz $absolute_backup_file -C $tmp_dir $backup_dirname";
exec($cmd);
exec("rm -Rf " . $absolute_backup_dir);

$attachment_location = $absolute_backup_dir . ".tgz";
if (file_exists($attachment_location)) {
  header($_SERVER["SERVER_PROTOCOL"] . " 200 OK");
  header("Cache-Control: public"); // needed for i.e.
  header("Content-Type: application/gzip");
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
