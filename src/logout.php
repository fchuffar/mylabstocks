<?php
session_start();
require_once ("connect_entry.php");
require_once ("lib/session.lib.php");

// connect to DB
$connexion = mysql_pconnect (SERVEUR, NOM, PASSE);
if (!$connexion) {
 echo "Logout error: Sorry, connexion to " . SERVEUR . " failed\n";
 exit;
}
if (!mysql_select_db (BASE, $connexion)) {
 echo "Logout error: Sorry, connexion to database " . BASE . " failed\n";
 exit;
}

//erase session from table
$id = session_id();
$qry = "DELETE FROM websession WHERE id_session = '$id'";
$resultat = execQry ($qry, $connexion);

session_destroy();
header("Location: home.php");
?>
