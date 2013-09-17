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
 echo " Genotype: ".
 	"<I>".
	"<B>". 
 	$strain->Mating_Type ." ".
	"</B>" .
	$strain->ADE2 ." ".
	$strain->HIS3 ." ".
	$strain->LEU2 ." ".
	$strain->LYS2 ." ".
	$strain->MET15 ." ".
	$strain->TRP1 ." ".
	$strain->URA3 ." ".
	$strain->HO_ ." ".
	$strain->locus1 ." ".
	$strain->locus2 ." ".
	$strain->locus3 ." ".
	$strain->locus4 ." ".
	$strain->locus5 ." ".
	"</I>".
	" [" .
	$strain->Cytoplasmic_Character ." ".
	"] (" .
	$strain->extrachromosomal_plasmid ." ".
	")" .
	"<BR>". "<BR>";
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
