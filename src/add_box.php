<?php
session_start();
require("headers.php");

$box_map = array(
  "A" => range(1,2),
  "B" => range(1,3),
  "C" => range(1,4),
  "D" => range(1,5),
  "E" => range(1,6),
  "F" => range(1,7),
  "G" => range(1,8),
  "H" => range(1,9),
  "I" => range(1,10),
  "J" => range(1,9),
  "K" => range(1,4),
);

if (isset($_REQUEST["action"])) {
  $container = $_REQUEST["container"];
  $rack = $_REQUEST["rack"];
  $box = $_REQUEST["box"];
  if ($_REQUEST["action"] == "add_box_to_db") {
    $where_clause = "container='$container' AND rack='$rack' AND box='$box'";
    if (FALSE) {
      $qry = "UPDATE cl_storage SET cl_passages=NULL WHERE $where_clause";
      $result = mysql_query($qry, $connexion);      
    } else {
      $error = FALSE;
      $qry = "SELECT COUNT(*) FROM cl_storage WHERE $where_clause";   
      $result = mysql_query($qry);
      $row = mysql_fetch_row($result);
      $count = $row[0];
      if ($count > 0) {
        $error = TRUE;
        echo "<H4 style='background-color: red;'><b>ERROR!</b> Container $container rack $rack box $box ever exists!</H4>";
      }
      if ($session->mode != "super") {
        echo "<H4 style='background-color: red;'><b>ERROR!</b> You must be in <b>superuser mode</b> to add a Liquid N2 box.</H4>";
      }
      if (!$error & $session->mode == "super") {
        $qry_part = array();
        foreach ($box_map as $field_y => $fields) {
          foreach($fields as $field_x) {
            array_push($qry_part, "(NULL,'$container','$rack','$box','$field_y','$field_x',NULL)");
          }
        }
        $box_values = implode(",", $qry_part); 
        $qry = "INSERT INTO `cl_storage` VALUES $box_values";
        $result = mysql_query($qry, $connexion);            
        if ($result) {
          echo "<H4 style='background-color: green;'><b>CONGRATULATION!</b> You succesfully add container $container rack $rack box $box.</H4>";
        }
      }      
    }
  }
}


  $output = "";
  $output .= "<p>You want to add a new Liquid N2 box in your database.</p>";
  $output .= "<form>";

  $output .= "What is the number on the container?<br>";
  $output .= "Container: <select name='container' >";
  for ($i = 1; $i <= 50; $i++){
    $output .= "<option value='$i'>$i</option>";
  }
  $output .= "</select><br>";

  $output .= "What is the number on the rack?<br>";
  $output .= "Rack: <select name='rack' >";
  for ($i = 1; $i <= 50; $i++){
    $output .= "<option value='$i'>$i</option>";
  }
  $output .= "</select><br>";
  
  $output .= "What is the number on the box?<br>";
  $output .= "Box: <select name='box' >";
  for ($i = 1; $i <= 100; $i++){
    $output .= "<option value='$i'>$i</option>";
  }
  $output .= "<input type='hidden' name='action' value='add_box_to_db'>\n";
  $output .= "<br><input type='submit' value='Add this new box.'>\n";
  $output .= "</select><br>";
  $output .= "</form>";

  echo $output;

  // session_start ();
  require("footers.php");

  
?>


