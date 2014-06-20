<?php
session_start();
require("headers.php");

if (isset($_REQUEST["action"])) {
  // print_r($_REQUEST);
  $ids = $_REQUEST["ids"];
  $all_ids = explode(" ", preg_replace("/([^0-9]+)/"," ",$ids));
  // print("<pre>");
  // print_r($all_ids);
  // print("</pre>");
  if ($_REQUEST["action"] == "publish_genotypes") {
    $where_clause = "id IN (" . implode(",", $all_ids) . ")";
    $qry = "SELECT * FROM strains WHERE $where_clause";
    $result = mysql_query($qry, $connexion);
    while($strain = mysql_fetch_object($result)) {
      // print("<pre>");
      // print_r($strain);
      // print("</pre>");
      echo dump_genotype($strain);
    }
  }
}


  $output = "";
  $output .= "<p>Enter IDs of strains (blank separated) that you want to publish genotypes.</p>";
  $output .= "<form>";

  $output .= "<textarea name='ids' cols='25' rows='5'>$ids</textarea><br>";
  $output .= "<input type='hidden' name='action' value='publish_genotypes'>\n";
  $output .= "<br><input type='submit' value='Extract genotypes.'>\n";
  $output .= "</form>";

  echo $output;

  // session_start ();
  require("footers.php");

  
?>


