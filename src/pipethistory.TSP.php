<?php
// a Trigger to display pipet info
$allevents = $this->myQuery("SELECT * FROM ".$this->tb);
$allpipets = $this->myQuery("SELECT * FROM pip_stock");

/* there must be a more straightforward way to do this
 * but this seems to work
 */
// reach the event displayed
$foundevent = 0;
while(!$foundevent && $event = mysql_fetch_object($allevents)){
	if ($event->ID == $this->rec)
		$foundevent = 1;
}
// record Serial Number of the pipet considered
if ($event){
  $SerialNum = $event->Serial_Number ;
}

// reach the pipet displayed
$foundpipet = 0;
while(!$foundpipet && $pipet = mysql_fetch_object($allpipets)){
	if ($pipet->Serial_Number == $SerialNum)
		$foundpipet = 1;
}

if ($pipet){
   // print pipet infos
   echo " Pipet : ".
        $pipet->Marque . " " .
	$pipet->Type . " " .
	"<BR>" .
	"Serial Number: ".
        $pipet->Serial_Number . "<BR>". "<BR>";
}

?>