<?php
function pre_print_r($obj) {
  echo "<PRE>";
  print_r($obj);
  echo "</PRE>";
}
$warnings = "";
$link_to_plasmids = array();
$link_to_oligos = array();

// Plasmids
$all = $this->myQuery("SELECT * FROM " . $this->tb . " WHERE id=" . $this->rec);
// reach the strain displayed
$strain = mysql_fetch_object($all);
$plasmids_id_str = $strain->relevant_plasmids;
$plasmids_ids = preg_split('/;|,| /', $plasmids_id_str, -1, PREG_SPLIT_NO_EMPTY); 
foreach ($plasmids_ids as $plasmids_id) {
  $req = "SELECT COUNT(*) FROM plasmids WHERE ID=\"$plasmids_id\"";
  // print($req);
  $tmp_plasmids = mysql_fetch_array($this->myQuery($req));
  // pre_print_r($tmp_plasmids);
  if ($tmp_plasmids[0] == 1) {    
    $link_to_plasmids[] = " <a href=\"plasmids.php?PME_sys_operation=PME_op_View&PME_sys_rec=$plasmids_id\">$plasmids_id</a>";
  } else {
    $warnings .= "<blink>WARNING</bink>: <I><B> $plasmids_id </I></B> is not a valid plasmid ID.</br>";
  }
}
$link_to_plasmids = implode(",", $link_to_plasmids);
  
// Oligos
$all = $this->myQuery("SELECT * FROM " . $this->tb . " WHERE id=" . $this->rec);
// reach the strain displayed
$strain = mysql_fetch_object($all);
$oligos_id_str = $strain->relevant_oligos;
$oligos_ids = preg_split('/;|,| /', $oligos_id_str, -1, PREG_SPLIT_NO_EMPTY); 
foreach ($oligos_ids as $oligos_id) {
  $req = "SELECT COUNT(*) FROM oligos WHERE ID=\"$oligos_id\"";
  // print($req);
  $tmp_oligos = mysql_fetch_array($this->myQuery($req));
  // pre_print_r($tmp_oligos);
  if ($tmp_oligos[0] == 1) {    
    $link_to_oligos[] = " <a href=\"oligos.php?PME_sys_operation=PME_op_View&PME_sys_rec=$oligos_id\">$oligos_id</a>";
  } else {
    $warnings .= "<blink>WARNING</bink>: <I><B> $oligos_id </I></B> is not a valid oligo ID.</br>";
  }
}
$link_to_oligos = implode(",", $link_to_oligos);
  

$to_be_post_list_content = <<<EOD
    <div class="sheet">
      <p>$warnings
      <p>Relevant Plasmids: $link_to_plasmids 
      <p>Relevant Oligos: $link_to_oligos
    </div>
    $to_be_post_list_content
EOD;

?>
