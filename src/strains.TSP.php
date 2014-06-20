<?php

// a Trigger to display full genotype
$all = $this->myQuery("SELECT * FROM ".$this->tb);

// reach the strain displayed
$found = 0;
while(!$found && $strain = mysql_fetch_object($all)){
	if ($strain->id == $this->rec)
		$found = 1;
}

if ($strain){
 // print full genotype
 echo dump_genotype($strain);
  /*	
 // find author in table labmembers
 $allauth = $this->myQuery("SELECT * FROM labmembers");
 if ($allauth){
    $found = 0;
    while(!$found && $labm = mysql_fetch_object($allauth)){
	   if ($labm->id == $strain->author_id)
		   $found = 1;
    }
 }
 // print author's name
 echo 	"Author: " .
	$labm->Firstname . " ".
	$labm->Name .
 	"<BR>". "<BR>";
 */
}
?>
