<?php
// a function that cleans and print one sequence into fasta format
function Convert2Fasta ($seq)
{
  $basesPerLine = 60;
  // remove blanks in beginning or end of seq:
  $out = trim($seq);
  // remove "-" and "_" spacers
  $out = str_replace("-", "",$out);
  $out = str_replace("_", "",$out);  
  // change to upper case
  $out = strtoupper($out);
  // convert to a table and print *** bases per line:str_split()
  $out = str_split($out, $basesPerLine);
  return ($out);
}

function seq2png($seq, $plasmapper_server) {
  $dest = $plasmapper_server . "servlet/DrawVectorMap";
  $bundary = "--" . substr(md5(rand(0,32000)), 0, 10);
  $crlf = "\r\n";
  $pst = "POST /PlasMapper/servlet/DrawVectorMap HTTP/1.1" . $crlf;
  $cnt = "";
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="fastaFile"; filename=""' . $crlf; 
  $cnt  .= 'Content-Type: application/octet-stream' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="vendor"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= 'Amersham%20Pharmacia' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="biomoby"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '1' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="sequence"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= $seq . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="Submit"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= 'Graphic Map' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="showOption"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '1' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="showOption"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '2' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="showOption"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '3' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="showOption"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '4' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="showOption"' . $crlf; 
  $cnt  .= '6' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="showOption"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '7' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="showOption"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '8' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="showOption"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '5' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
//  $cnt  .= 'Content-Disposition: form-data; name="showOption"' . $crlf; 
//  $cnt  .= '' . $crlf; 
//  $cnt  .= '9' . $crlf; 
//  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="restriction"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '1' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="orfLen"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '200' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="strand"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '1' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="strand"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '2' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="featureName1"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="start1"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="dir1"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '1' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="category1"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= 'origin_of_replication' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="stop1"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="featureName2"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="start2"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="dir2"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '1' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="category2"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= 'origin_of_replication' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="stop2"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="featureName3"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="start3"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="dir3"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '1' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="category3"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= 'origin_of_replication' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="stop3"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="featureName4"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="start4"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="dir4"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '1' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="category4"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= 'origin_of_replication' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="stop4"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="featureName5"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="start5"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="dir5"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '1' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="category5"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= 'origin_of_replication' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="stop5"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="featureName6"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="start6"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="dir6"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '1' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="category6"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= 'origin_of_replication' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="stop6"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="scheme"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '0' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="shading"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '0' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="labColor"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '0' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="labelBox"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '1' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="labels"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '0' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="innerLabels"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '0' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="legend"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '0' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="arrow"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '0' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="tickMark"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '0' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="mapTitle"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="comment"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= 'Created using PlasMapper' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="imageFormat"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= 'PNG' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="imageSize"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= '850 x 750' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="backbone"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= 'medium' . $crlf; 
  $cnt  .= "--" . $bundary . $crlf; 
  $cnt  .= 'Content-Disposition: form-data; name="arc"' . $crlf; 
  $cnt  .= '' . $crlf; 
  $cnt  .= 'medium' . $crlf; 
  $cnt  .= "--" . $bundary . '--' . $crlf; 
  $hdr = "";
  $hdr .= 'Content-Type: multipart/form-data; boundary=' . $bundary . $crlf; 
  $params = array('http' => array( 
          'method' => 'POST', 
          'header' => $hdr, 
          'content' => $cnt 
      )); 
  $ctx = stream_context_create($params); 
  $fp = fopen($dest, 'r', false, $ctx); 
  $resp = stream_get_contents($fp); 
  preg_match("/tmp(.)*.png/", $resp, $matches);
  return $plasmapper_server . $matches[0];
}



function post_vars_old($url, $vars) {
  $dest = $url;
  $bundary = "--" . substr(md5(rand(0,32000)), 0, 10);
  $crlf = "\r\n";
  # /blast/blast.cgi
  $pst = "POST $url HTTP/1.1" . $crlf;
  $cnt = "";
  foreach ($vars as $key => $value) {
    $cnt  .= "--" . $bundary . $crlf; 
    $cnt  .= 'Content-Disposition: form-data; name="' . $key . '"' . $crlf; 
    $cnt  .= '' . $crlf; 
    $cnt  .= $value . $crlf; 
  }
  $cnt  .= "--" . $bundary . '--' . $crlf; 
  $hdr = "";
  $hdr .= 'Content-Type: multipart/form-data; boundary=' . $bundary . $crlf; 
  $params = array('http' => array( 
          'method' => 'POST', 
          'header' => $hdr, 
          'content' => $cnt 
      )); 
  $ctx = stream_context_create($params); 
  $fp = fopen($dest, 'r', false, $ctx); 
  $resp = stream_get_contents($fp); 
  return $resp;
}


/** 
 * Send a POST requst using cURL 
 * @param string $url to request 
 * @param array $post values to send 
 * @param array $options for cURL 
 * @return string 
 */ 
function post_vars($url, array $post = NULL, array $options = array()) {
  $defaults = array( 
      CURLOPT_POST => 1, 
      CURLOPT_HEADER => 0, 
      CURLOPT_URL => $url, 
      CURLOPT_FRESH_CONNECT => 1, 
      CURLOPT_RETURNTRANSFER => 1, 
      CURLOPT_FORBID_REUSE => 1, 
      CURLOPT_TIMEOUT => 4, 
      CURLOPT_POSTFIELDS => http_build_query($post) 
  ); 

  $ch = curl_init(); 
  curl_setopt_array($ch, ($options + $defaults)); 
  if( ! $result = curl_exec($ch)) 
  { 
      trigger_error(curl_error($ch)); 
  } 
  curl_close($ch); 
  return $result; 
} 



?>
