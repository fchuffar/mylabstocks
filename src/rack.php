<?php
session_start();
require("headers.php");

if ($session->mode == "super") {
  print("<p><a href='add_box.php'>Add a new box for your Liquid N2 storage.</a></p>");
}

if (isset($_REQUEST["action"])) {
  // print_r($_REQUEST);
  $passage = $_REQUEST["passage"];
  $container = $_REQUEST["container"];
  $rack = $_REQUEST["rack"];
  $box = $_REQUEST["box"];
  if ($_REQUEST["action"] == "update_storage") {
    $where_clause = "";
    $try_to_update = FALSE;
    foreach ($_REQUEST as $key => $value) {
      if (preg_match("/fieldy_fieldx/i", $key)) {
        $try_to_update = TRUE;
        $tmp_exp = explode("_", $key);
        $tmp_field_y = $tmp_exp[2];
        $tmp_field_x = $tmp_exp[3];
        $where_clause .= "(container='$container' AND rack='$rack' AND box='$box' AND field_y='$tmp_field_y' AND field_x='$tmp_field_x') OR ";
        // $output .= "<p>$tmp_box $tmp_field***********</p>";
      }
    }    
    $where_clause .= "0";    
    if ($passage == "drop") {
      $qry = "UPDATE cl_storage SET cl_passages=NULL WHERE $where_clause";
      $result = mysql_query($qry, $connexion);      
    } else {
      $qry = "SELECT * FROM cl_storage WHERE $where_clause";    
      // echo "<br>" . $qry . "<br>";
      $result = mysql_query($qry, $connexion);
      $error = FALSE;
      while($tmp_passage = mysql_fetch_object($result)) {
        if (isset($tmp_passage->cl_passages)) {
          $error = TRUE;
          echo "<H4 style='background-color: red;'><b>ERROR!</b>  $tmp_passage->container $tmp_passage->rack $tmp_passage->box $tmp_passage->field_y $tmp_passage->field_x is not empty.</H4>";
        }
      }
      if ($try_to_update & $session->mode == "view") {
        echo "<H4 style='background-color: red;'><b>ERROR!</b> You can't update Liquid N2 storage in view mode.</H4>";
      }
      if (!$error & $session->mode != "view") {
        $qry = "UPDATE cl_storage SET cl_passages='$passage' WHERE $where_clause";
        $result = mysql_query($qry, $connexion);
      }      
    }
  }
}


// $qry = "SELECT * FROM cl_passages";
// $result = mysql_query($qry, $connexion);
// while($tmp_passage = mysql_fetch_object($result)) {
//   if (!isset($passage)) {
//     $passage = $tmp_passage->ID;
//     echo "Passage: $tmp_passage->name $tmp_passage->passage $tmp_passage->date_of_freezing";
//   }
// }


  $output = "";
  $output .= "<form>";

  $output .= "Which passage do you want to precise storage?<br>";
  $output .= "Passage: <select name='passage' >";
  $qry = "SELECT * FROM cl_passages";
  $result = mysql_query($qry, $connexion);
  while($tmp_passage = mysql_fetch_object($result)) {
    if (!isset($passage)) {
      $passage = $tmp_passage->ID;
    }
    $passage == $tmp_passage->ID ? $selected = "selected" : $selected = "";
    $output .= "<option value='$tmp_passage->ID' $selected>$tmp_passage->name $tmp_passage->passage $tmp_passage->date_of_freezing</option>";
  }
  $output .= "<option value='drop'>drop</option>";
  $output .= "</select><br>";




  $output .= "In which container/rack/box?<br>";




  $output .= "Container: <select name='container' >";
  $qry = "SELECT DISTINCT container FROM cl_storage";
  $result = mysql_query($qry, $connexion);
  while($storage = mysql_fetch_object($result)) {
    if (!isset($container)) {
      $container = $storage->container;
    }
    $container == $storage->container ? $selected = "selected" : $selected = "";
    $output .= "<option value='$storage->container' $selected>$storage->container</option>";
  }
  $output .= "</select><br>";





  $output .= "Rack: <select name='rack' >";
  $qry = "SELECT DISTINCT rack FROM cl_storage WHERE container='$container'";
  $result = mysql_query($qry, $connexion);
  while($storage = mysql_fetch_object($result)) {
    if (!isset($rack)) {
      $rack = $storage->rack;
    }
    $rack == $storage->rack ? $selected = "selected" : $selected = "";
    $output .= "<option value='$storage->rack' $selected>$storage->rack</option>";
  }
  $output .= "</select><br>";
  



  $output .= "Box: <select name='box' >";
  $qry = "SELECT DISTINCT box FROM cl_storage WHERE container='$container' AND rack='$rack'";
  $result = mysql_query($qry, $connexion);
  while($storage = mysql_fetch_object($result)) {
    if (!isset($box)) {
      $box = $storage->box;
    }
    $rack == $storage->box ? $selected = "selected" : $selected = "";
    $output .= "<option value='$storage->box' $selected>$storage->box</option>";
  }
  $output .= "</select><br>";

  $qry = "SELECT * FROM cl_storage, cl_passages WHERE container='$container' AND rack='$rack' AND  box='$box'  AND cl_storage.cl_passages=cl_passages.ID";
  $result = mysql_query($qry, $connexion);
  $content = array();
  $content_index = array();
  while($joint_passage = mysql_fetch_object($result)) {
    $key = $joint_passage->container . $joint_passage->rack . $joint_passage->box . $joint_passage->field_y . $joint_passage->field_x;;
    $value = $joint_passage->name . "<br>" . $joint_passage->passage . "<br>" . $joint_passage->date_of_freezing;
    $content[$key] = $value;
    $content_index[$key] = $joint_passage->cl_passages ;
  }


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

  $output .= "In which boxes/fields?<br>";
  $output .= "<table>";
  foreach ($box_map as $field_y => $fields) {
    $output .= "<tr><td >";
    $output .= $field_y;
    $output .= "</td>";
    $output .= "<td>";
    $output .= "<center><table ><tr>";
    foreach($fields as $field_x) {
      $key = $container . $rack . $box . $field_y . $field_x;
      isset($content[$key]) ? $color="LightGray" : $color="LightGreen";
      @$content_index[$key] == $passage ? $color="PowderBlue": $color=$color;
      $output .= "<td style='background-color: $color; width:80; border: 1px solid black;''>";
      if ($session->mode != "view") {
        $output .= "<input type='checkbox' name='fieldy_fieldx_" . $field_y . "_" . $field_x . " value='on'>$field_x</input><br>";
      } else {
        $output .= "<b>$field_x</b><br>";        
      }
      $output .= isset($content[$key]) ? $content[$key] : "empty<br><br><br>";
      $output .= "</td>";
    }
    $output .= "</tr></table></center>";
    $output .= "</td></tr>";
  }
  $output .= "</table>";

  $output .= "<input type='hidden' name='action' value='update_storage'>\n";
  $output .= "<input type='submit' value='update storage or view'>\n";

  $output .= "</table>";

  $output .= "</form>";

  echo $output;

  // session_start ();
  require("footers.php");

  
?>


