<?php
require_once("lib/seq.lib.php");
// a Trigger to display plsmid map image
$all = $this->myQuery("SELECT * FROM " . $this->tb . " WHERE id=" . $this->rec);
// reach the plasmid displayed
$obj = mysql_fetch_object($all);
if ($obj) {
  // display image
  if ($obj->Sequence) {
		echo '<textarea readonly rows="10" cols="100">'.$obj->Sequence.'</textarea>';
  }
}

?>
