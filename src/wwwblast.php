<?php
session_start ();
require("headers.php");

/*************************/
//
// Connect to DB and 
// handle session/authentification
//
/*************************/
require_once ("connect_entry.php");
require_once ("session.php");
// connect to DB
$connexion = mysql_pconnect (SERVEUR, NOM, PASSE);
if (!$connexion)
{
 echo "Sorry, connexion to " . SERVEUR . " failed\n";
 exit;
}
if (!mysql_select_db (BASE, $connexion))
{
 echo "Sorry, connexion to database " . BASE . " failed\n";
 exit;
}
// authentification
CleanOldSessions($connexion);
$session = ControleAcces ("wwwblast.php", $_POST, session_id(), $connexion);
if (!is_object($session)) {
  exit;
}

/*************************/
//
// Verify login and priviledges
//
/*************************/

// just in case:
// check that visitor is in read-only mode
if ($session->mode != "view" && $session->login != "superuser"){
   echo "Sorry, you should log in <B> view </B> mode<p>";
   echo "Please logout and try again with appropriate login<P>";
   exit;
}

require_once("seq2fasta.php");

// Create an updated fasta
// file of all oligos
$qry = "SELECT * FROM oligos";
$result = mysql_query($qry, $connexion);
$blastbasename = BLAST_HOME . "oligostock_db";
$FastaFile = fopen($blastbasename, 'w');
while($oli = mysql_fetch_object($result)) {
  fwrite($FastaFile, ">$oli->id\n");
  $toprint = Convert2Fasta($oli->Sequence);
  for ($i=0; $i< count($toprint); $i++) {
    fwrite($FastaFile, "$toprint[$i]\n");
  }
}
fclose($FastaFile);
// Using the fasta file
// Create the blast database
// and place it in the appropriate directory for wwwblast
$cmd_formatdb = FORMATDB_CMD." -i $blastbasename -p F";
echo "<pre>$cmd_formatdb</pre>";
system($cmd_formatdb, $retval1);
if ($retval1 != 0){
   echo "Error while formatting the FASTA database into BLAST format";
   exit;
}
echo "Blast has been updated with the latest oligostock.";

// Create an updated fasta
// file of all plasmids
$qry = "SELECT * FROM plasmids";
$result = mysql_query($qry, $connexion);
$blastbasename = BLAST_HOME . "plasmidstock_db";
$FastaFile = fopen($blastbasename, 'w');
while($pl = mysql_fetch_object($result)) {
  //print("**$pl->sequence**<br>");
  if ($pl->sequence != "") {
    fwrite($FastaFile, ">$pl->id $pl->Name_\n");
    $toprint = Convert2Fasta($pl->sequence);
    for ($i=0; $i< count($toprint); $i++) {
      fwrite($FastaFile, "$toprint[$i]\n");
    }
  }
}
fclose($FastaFile);
// Using the fasta file
// Create the blast database
// and place it in the appropriate directory for wwwblast
$cmd_formatdb = FORMATDB_CMD." -i $blastbasename -p F";
echo "<pre>$cmd_formatdb</pre>";
system($cmd_formatdb, $retval1);
if ($retval1 != 0){
   echo "Error while formatting the FASTA database into BLAST format";
   exit;
}
echo "Blast has been updated with the latest plasmidstock.";

// Create an updated fasta
// file of all pl_features
$blastbasename = BLAST_HOME . "plfeatstock_db";
$FastaFile = fopen($blastbasename, 'w');
$qry = "SELECT * FROM pl_features";
$result = mysql_query($qry, $connexion);
while($pl = mysql_fetch_object($result)) {
  //print("**$pl->sequence**<br>");
  fwrite($FastaFile, ">$pl->Description\n");
  $toprint = Convert2Fasta($pl->Sequence);
  for ($i=0; $i< count($toprint); $i++) {
    fwrite($FastaFile, "$toprint[$i]\n");
  }
}
$qry = "SELECT * FROM oligos";
$result = mysql_query($qry, $connexion);
while($feat = mysql_fetch_object($result)) {
  //print("**$feat->id**<br>");
  fwrite($FastaFile, ">_$feat->id\n");
  $toprint = Convert2Fasta($feat->Sequence);
  for ($i=0; $i< count($toprint); $i++){
    fwrite($FastaFile, $toprint[$i] . "\n");
  }
}
fclose($FastaFile);
// Using the fasta file
// Create the blast database
// and place it in the appropriate directory for wwwblast
$cmd_formatdb = FORMATDB_CMD." -i $blastbasename -p F";
echo "<pre>$cmd_formatdb</pre>";
system($cmd_formatdb, $retval1);
if ($retval1 != 0){
   echo "Error while formatting the FASTA database into BLAST format";
   exit;
}
echo "Blast has been updated with the latest plfeatstock.";




// Create an updated PlasMapper fasta
// file of all pl_features
$blastbasename = PLASMAPPER_HOME."dataBase/db_vectorFeature/features.fasta.nt";
$FastaFile = fopen($blastbasename, 'w');
$fasta_content = "";

$qry = "SELECT * FROM pl_features";
$result = mysql_query($qry, $connexion);
while($feat = mysql_fetch_object($result)) {
  fwrite($FastaFile, ">$feat->Description[$feat->Category]{" . $feat->Description . "}," . strlen($feat->Sequence) . " bases, " . md5($feat->Sequence) . " checksum.\n");
  $fasta_content .= ">$feat->Description\n";
  $toprint = Convert2Fasta($feat->Sequence);
  for ($i=0; $i< count($toprint); $i++){
    fwrite($FastaFile, $toprint[$i] . "\n");
    $fasta_content .= $toprint[$i] . "\n";
  }
}

$qry = "SELECT * FROM oligos";
$result = mysql_query($qry, $connexion);
while($feat = mysql_fetch_object($result)) {
  //print("**$feat->id**<br>");
  fwrite($FastaFile, ">_$feat->id[OTH]{_$feat->id}," . strlen($feat->Sequence) . " bases, " . md5($feat->Sequence) . " checksum.\n");
  $fasta_content .= ">_$feat->id\n";
  $toprint = Convert2Fasta($feat->Sequence);
  for ($i=0; $i< count($toprint); $i++){
    fwrite($FastaFile, $toprint[$i] . "\n");
    $fasta_content .= $toprint[$i] . "\n";
  }
}

fclose($FastaFile);

/*************************/
//
// Using the fasta file
// Create the blast database
// and place it in the appropriate directory for wwwblast
//
/*************************/

$cmd_formatdb = FORMATDB_CMD." -i $blastbasename -p F -o T";
echo "<pre>$cmd_formatdb</pre>";
system($cmd_formatdb, $retval1);

if ($retval1 != 0){
   echo "<b><font color='red'>ERROR!</font></b> while formatting the FASTA database into BLAST format. <a href=formatdb.log>formatdb.log</a>";
   exit;
}

$html_feat_cnt = <<<EOD
<html>
<head>
  <meta HTTP-EQUIV =" Content-Type" CONTENT =" text/html; charset=iso-8859-1">
  <meta NAME =" Description" CONTENT =" Wishart Pharmaceutical Research Group -
   PlasMap">
   <link rel=stylesheet type="text/css" href="/PlasMapper/style/PlasMapper.css" title="default PlasMap styles" />
  <title>PlasMap - Help</title>
</head>
<body bgcolor="#ffffff">
<pre>
$fasta_content
</pre>
</body>
</html>
EOD;

$html_feat_filename = PLASMAPPER_HOME . "html/feature.html";
$fp = fopen($html_feat_filename, 'w');
fwrite($fp, $html_feat_cnt);
fclose($fp);

echo "Blast has updated PlasMapper with the latest plasmid's features.";

?>











<center>
<iframe src="/blast/blast.html" width="100%" height="90%" border="0"/>
</center>













