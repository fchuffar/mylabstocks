<?php
define ('SERVEUR', "localhost");  // hostname for mysql server
define ('BASE', "labstocks_db"); // name of the targeted db
define ('LABNAME', "Demo");     // Name of the lab, appear in web page header
define ('PASSE', "root");      // passwrd for db access
define ('NOM', "root");       // username for db access
// CONSTANTS, DO NOT CHANGE  //
define ('PLASMAPPER_HOME', "/var/lib/tomcat6/webapps/PlasMapper/");
define ('PLASMAPPER_SERVER', "http://" . $_SERVER["HTTP_HOST"] . ":8080/PlasMapper/");
define ('LABSTOCK_SERVER', "http://" . $_SERVER["HTTP_HOST"] . "/labstocks/");
define ('WWWBLAST_SERVER', "http://" . $_SERVER["HTTP_HOST"] . "/blast/");
define ('BLAST_HOME', "/var/www/blast/db/");
define ('FORMATDB_CMD', "formatdb");
?>