<?php
function pre_print_r($obj) {
  echo "<PRE>";
  print_r($obj);
  echo "</PRE>";
}

$results = $this->myQuery("SELECT cl_storage.ID, cl_storage.container, cl_storage.rack, cl_storage.box, cl_storage.field_y, cl_storage.field_x FROM `cl_storage`   WHERE cl_storage.cl_passages='" . $this->rec . "'");


$table_of_passages = "<table class=\"pme-main\"><tr class=\"pme-navigation\">
<th class=\"pme-header\">Storage</th>
</tr>";

while ($row = mysql_fetch_array($results)) {
  // pre_print_r($row);
  $table_of_passages .= "<tr class=\"pme-row-0\">
    <td class=\"pme-cell-0\"><a href=\"rack.php?action=update_view&passage=" . $this->rec . "&container=" . $row["container"] . "&rack=" . $row["rack"] . "&box=" . $row["box"] . "\">c" . $row["container"] . " r" . $row["rack"] . " b" . $row["box"] . "</a> " . $row["field_y"] . "" . $row["field_x"] . "</td>
  </tr>";
  
}

$table_of_passages .= "</table>";

// pre_print_r($ids);




  $to_be_post_list_content .= <<<EOD
    <div class="sheet">
    $table_of_passages
    </div>
EOD;

?>
