<?php
function pre_print_r($obj) {
  echo "<PRE>";
  print_r($obj);
  echo "</PRE>";
}

$results = $this->myQuery("SELECT cl_passages.ID, cl_storage.ID, cl_passages.passage, cl_passages.date_of_freezing, cl_passages.Author, cl_storage.container, cl_storage.rack, cl_storage.box, cl_storage.field_y, cl_storage.field_x FROM `cl_passages`, `cl_storage`   WHERE cl_passages.name='" . $this->rec . "' AND cl_storage.cl_passages=cl_passages.ID");

$cl_passages_ids = array();
$cl_storage_ids = array();

$table_of_passages = "<table class=\"pme-main\"><tr class=\"pme-navigation\">
<th class=\"pme-header\">Passage</th>
<th class=\"pme-header\">Date of freezing</th>
<th class=\"pme-header\">Author</th>
<th class=\"pme-header\">Storage</th>
</tr>";

while ($row = mysql_fetch_array($results)) {
  // pre_print_r($row);
  $cl_passages_ids[] = $row[0];
  $cl_storage_ids[] = $row[1];
  $table_of_passages .= "<tr class=\"pme-row-0\">
    <td class=\"pme-cell-0\">" . $row["passage"] . "</td>
    <td class=\"pme-cell-0\">" . $row["date_of_freezing"] . "</td>
    <td class=\"pme-cell-0\">" . $row["Author"] . "</td>
    <td class=\"pme-cell-0\">c" . $row["container"] . " r" . $row["rack"] . " b" . $row["box"] . " " . $row["field_y"] . "" . $row["field_x"] . "</td>
  </tr>";
  
}

$table_of_passages .= "</table>";

// pre_print_r($ids);


$link_to_paasages = "<a href=\"http://minideb/labstocks/cl_passages.php?action=ADV_SEARCH&col_0=name&cond_0=%3D&input_0=$this->rec\">all passages (" . count(array_unique($cl_passages_ids)) . ")</a>";



  $to_be_post_list_content .= <<<EOD
    <div class="sheet">
    $link_to_paasages
    $table_of_passages
    </div>
EOD;

?>
