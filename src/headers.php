<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">

body {
  font-family:  sans-serif;
  background-color: #FFF;
  color: #000;
}

#onglets
{
  list-style-type : none;
  padding-bottom : 30px; /* à modifier suivant la taille de la police ET de la hauteur de l'onglet dans #onglets li */
  border-bottom : 1px solid #000;
  margin-left : 0;
}

#onglets li
{
    float : left;
    height : 27px; /* à modifier suivant la taille de la police pour centrer le texte dans l'onglet */
    margin : 2px 2px 0 2px !important;  /* Pour les navigateurs autre que IE */
    margin : 1px 2px 0 2px;  /* Pour IE  */
    border : 1px solid #000;
    background-color: #DDD;
}

#onglets li.active
{
    border-bottom: 1px solid #fff;
    background-color: #fff;
}

#onglets a
{
    display : block;
    color : #000;
    text-decoration : none;
    padding : 4px;
}

#onglets a:hover
{
    background : #fff;
}

input.btn{ color: #050; font: bold 84%'trebuchet ms',helvetica,sans-serif; background-color: #fed;}
input.btn2{ color: #050; font: bold 84%'trebuchet ms',helvetica,sans-serif; background-color: #CC6633;}

hr.pme-hr                    { border: 0px solid; padding: 0px; margin: 0px; border-top-width: 1px; height: 1px; }
table.pme-main       { border: #004d9c 1px solid; border-collapse: collapse; border-spacing: 0px; width: 100%; }
table.pme-navigation { border: #004d9c 0px solid; border-collapse: collapse; border-spacing: 0px; width: 100%; }
td.pme-navigation-0, td.pme-navigation-1 { white-space: nowrap; }
th.pme-header        { border: #004d9c 1px solid; padding: 4px; background: #add8e6; }
td.pme-key-0, td.pme-value-0, td.pme-help-0, td.pme-navigation-0, td.pme-cell-0,
td.pme-key-1, td.pme-value-1, td.pme-help-0, td.pme-navigation-1, td.pme-cell-1,
td.pme-sortinfo, td.pme-filter { border: #004d9c 1px solid; padding: 3px; }
td.pme-buttons { text-align: left;   }
td.pme-message { text-align: center; }
td.pme-stats   { text-align: right;  }
</style>

</head>

<body>

<h3>GY Lab Stocks</h3>

<div id="menu">
  <ul id="onglets">
    <li id="home"><a href="home.php"> Home </a></li>
    <li id="plasmids"><a href="plasmids.php"> Plasmids </a></li>
    <li id="pl_features"><a href="pl_features.php"> Plasmids Features </a></li>
    <li id="strains"><a href="strains.php"> Strains </a></li>
    <li id="oligos"><a href="oligos.php"> Oligos </a></li>
    <li id="wwwblast"><a href="wwwblast.php"> wwwBlast </a></li>
    <li id="antibodies"><a href="antibodies.php"> Antibodies </a></li>
    <li id="collections"><a href="collections.php"> Collections </a></li>
    <li id="pipethistory"><a href="pipethistory.php"> Pipet History </a></li>
    <li id="notebooks"><a href="notebooks.php"> Lab's Notebooks </a></li>
    <li id="logout"><a href="logout.php"> Logout </a></li>
    <li id="admin"><a href="admin.php"> Admin </a></li>
  </ul>
</div>
</div>

<div id="divDebug" style="font-weight:normal; position:absolute; background-color:#EEEEEE; font-size:xx-small; top:0ex; width:38ex; right:0ex;">toto</div>

<script type="text/javascript"> 
id=window.location.href.split("/").pop().split(".")[0];
document.getElementById("divDebug").innerHTML=id;
document.getElementById(id).setAttribute("class","active");
</script>


<?php

$tb = split(".",array_reverse(split("/",$_SERVER["SCRIPT_FILENAME"]))[0])[0]
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
$session = ControleAcces ("antibodies.php", $_POST, session_id(), $connexion);
if (!is_object($session)) {
	exit;
}

/*************************/
//
// According to login:
// Define priviledge options
// to pass to phpMyEdit
//
/*************************/

//check that visitor is allowed to use this table
if ($session->target_table != $tb && $session->target_table != "all") {
   echo "Sorry, your session is not granted access to table <B> $tb </B><p>";
   echo "Please logout and try again with appropriate login<P>";
   exit;
}

//define priv options and display warning accordingly
if ($session->mode == "view"){
	$privopt = 'VF';
	$colorband = "#00ff00";
	$messageband = "You are safely in VIEW mode";
}
else if ($session->mode == "add"){
	$privopt = 'APVF';
	$colorband = "orange";
	$messageband = 'You are in <I><B> ADD </I></B> mode, please logout after you additions';
}
else if ($session->mode == "edit"){
	$privopt = 'ACPVDF';
	$colorband = "rgb(250,0,255)";
	$messageband = 'IMPORTANT: You are in <I><B> EDIT </I></B> mode, please logout after editing.';
}
else{
	$privopt = '';
	$colorband = "grey";
}
echo '<style type="text/css"> ';
echo	"h4 {background-color: $colorband }";
echo '</style>';
echo "<h4> $messageband </h4>";
echo "<HR>";
?>

