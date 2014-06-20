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
  $output .= "Passage: <select name='passage' onChange='submit()'>";
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




  $output .= "Container: <select name='container' onChange='submit()'>";
  $qry = "SELECT DISTINCT container FROM cl_storage ORDER BY container";
  $result = mysql_query($qry, $connexion);
  while($storage = mysql_fetch_object($result)) {
    if (!isset($container)) {
      $container = $storage->container;
    }
    $container == $storage->container ? $selected = "selected" : $selected = "";
    $output .= "<option value='$storage->container' $selected>$storage->container</option>";
  }
  $output .= "</select><br>";





  $output .= "Rack: <select name='rack' onChange='submit()'>";
  $qry = "SELECT DISTINCT rack FROM cl_storage WHERE container='$container' ORDER BY rack";
  $result = mysql_query($qry, $connexion);
  $tmp_racks = array();
  while($storage = mysql_fetch_object($result)) {
    array_push($tmp_racks, $storage->rack);
  }
  if (isset($rack)) {
    if (!in_array($rack, $tmp_racks)) {
      unset($rack);
    }
  }  
  foreach ($tmp_racks as $storage_rack) {
    if (!isset($rack)) {
      $rack = $storage_rack;
    }
    $rack == $storage_rack ? $selected = "selected" : $selected = "";
    $output .= "<option value='$storage_rack' $selected>$storage_rack</option>";
  }
  // while($storage = mysql_fetch_object($result)) {
  // if (!isset($rack)) {
  //   $rack = $storage->rack;
  // }
  // $rack == $storage->rack ? $selected = "selected" : $selected = "";
  // $output .= "<option value='$storage->rack' $selected>$storage->rack</option>";
  // }
  $output .= "</select><br>";
  



  $output .= "Box: <select name='box' onChange='submit()'>";
  $qry = "SELECT DISTINCT box FROM cl_storage WHERE container='$container' AND rack='$rack' ORDER BY box";
  $result = mysql_query($qry, $connexion);
  $tmp_boxes = array();
  while($storage = mysql_fetch_object($result)) {
    array_push($tmp_boxes, $storage->box);
  }
  if (isset($box)) {
    if (!in_array($box, $tmp_boxes)) {
      unset($box);
    }
  }  
  foreach ($tmp_boxes as $storage_box) {
    if (!isset($box)) {
      $box = $storage_box;
    }
    $box == $storage_box ? $selected = "selected" : $selected = "";
    $output .= "<option value='$storage_box' $selected>$storage_box</option>";
  }
  $output .= "</select><br>";




  $qry = "SELECT name FROM cl_passages WHERE ID='$passage'";
  $result = mysql_query($qry, $connexion);
  $cell_line = mysql_fetch_object($result)->name;
  


  $qry = "SELECT * FROM cl_storage, cl_passages WHERE container='$container' AND rack='$rack' AND  box='$box'  AND cl_storage.cl_passages=cl_passages.ID";
  $result = mysql_query($qry, $connexion);
  $content = array();
  $content_index = array();
  $content_cell_line = array();
  while($joint_passage = mysql_fetch_object($result)) {
    $key = $joint_passage->container . $joint_passage->rack . $joint_passage->box . $joint_passage->field_y . $joint_passage->field_x;;
    $value = $joint_passage->name . "<br>" . $joint_passage->passage . "<br>" . $joint_passage->date_of_freezing;
    $content[$key] = $value;
    $content_index[$key] = $joint_passage->cl_passages ;
    $content_cell_line[$key] = $joint_passage->name ;
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
      @$content_cell_line[$key] == $cell_line ? $color="PowderBlue": $color=$color;
      @$content_index[$key] == $passage ? $color="RoyalBlue": $color=$color;
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













  $output2 = "<table class='pme-main'><tr class='pme-header'><th class='pme-header'>Cell Line</th><th class='pme-header'>#Vials</th><th class='pme-header'>Note</th></tr>";

  $qry = "SELECT name, COUNT(cl_passages) as cnt FROM cl_storage, cl_passages WHERE cl_storage.cl_passages=cl_passages.ID GROUP BY name";
  $result = mysql_query($qry, $connexion);
  $content = array();
  $content_index = array();
  while($joint_passage = mysql_fetch_object($result)) {
    if ($joint_passage->cnt <= 5) {
      $note = "<blink><b>Please freeze additional passages to maintain frozen stocks!</b></blink>";
    } else {
      $note = "Sufficient stock.";
    }
    $output2 .= "<tr class='pme-row-0'><td class='pme-cell-0'>$joint_passage->name</td><td class='pme-cell-0'>$joint_passage->cnt</td><td class='pme-cell-0'>$note</td></tr>";    
    // print($joint_passage->name . " "  . $joint_passage->cnt . "<pre>");
    // print_r($joint_passage);
    // print("</pre>");
    // $key = $joint_passage->container . $joint_passage->rack . $joint_passage->box . $joint_passage->field_y . $joint_passage->field_x;;
    // $value = $joint_passage->name . "<br>" . $joint_passage->passage . "<br>" . $joint_passage->date_of_freezing;
    // $content[$key] = $value;
    // $content_index[$key] = $joint_passage->cl_passages ;
  }
  $output2 .= "</table>";

    print($output2);









  // session_start ();
  require("footers.php");

  
?>


