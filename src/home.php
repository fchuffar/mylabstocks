<?php
session_start ();
require("headers.php");
?>

<p>Welcome to <b>mylabstocks</b>. This web application allows you to manage, sort and filter the stocks of your lab. It is composed of several sections related to different parts of your stocks.

<pre>
  `-:-.   ,-;"`-:-.   ,-;"`-:-.   ,-;"`-:-.   ,-;"
     `=`,'=/     `=`,'=/     `=`,'=/     `=`,'=/
       y==/        y==/        y==/        y==/
     ,=,-<=`.    ,=,-<=`.    ,=,-<=`.    ,=,-<=`.
  ,-'-'   `-=_,-'-'   `-=_,-'-'   `-=_,-'-'   `-=_
</pre>

<?php
if (file_exists("useful_links.html")) {
  require("useful_links.html");
}


// session_start ();
require("footers.php");
?>
