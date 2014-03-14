<?php
if ($tb != "home" & $tb != "rack" & $tb != "add_box") {
  // TRIGGER
  $opts['triggers']['select']['pre'][] = 'last_trigger.MVC.php';
  $opts['triggers']['update']['pre'][] = 'last_trigger.MVC.php';

  array_unshift($opts['triggers']['select']['pre'], 'raw_dir.MVC.php');
  array_unshift($opts['triggers']['update']['pre'], 'raw_dir.MVC.php');

  // Now important call to phpMyEdit
  require_once 'phpMyEdit.class.php';
  $pme_instance = new phpMyEdit($opts);  

  print("<p><a href=backup.php?TABLE=$tb>Export to .csv format.</a></p>");
  print("<p>Backup <a href='backup.php?FULL_BACK=1'>the entire system</a> or <a href='backup.php'>only the database</a> NOW!</p>");


  if (!array_key_exists("PME_sys_operation", $_REQUEST)) {
    $tmp_array = $pme_instance->fds;
    if ($tb == "strains") {
      array_unshift($tmp_array, "Genotype");
    }
    $json_cols = json_encode($tmp_array);
    $adv_search = <<<EOD
      <div id="adv_search" class="centered_form">
      <form action="">
      <fieldset>
      <legend>Advanced Search</legend>
      <table id="adv_search_table">
      </table>
      <input type="hidden" name="action" value="ADV_SEARCH"/>
      <input type="submit" value="Search"/>
      </fieldset>
      </form>
      </div>  

      <script type="text/javascript"> 
      nb_filter = 0;
      function filter() {
        var self = this;
        cols = $json_cols;
        conds = ["LIKE", "=", "<", "<=", ">=", ">", "!="];
        ops = ["AND", "OR"];
        table = document.getElementById("adv_search_table");
        this.tmp_tr = document.createElement("tr");
        table.appendChild(this.tmp_tr);
        tmp_td = document.createElement("td");
        if (nb_filter != 0) {
          tmp_select = document.createElement("select")
          tmp_select.setAttribute('name', 'op' + '_' + nb_filter)
          ops.forEach(function(op) {
            tmp_option = document.createElement("option");
            tmp_option.appendChild(document.createTextNode(op));
            tmp_select.appendChild(tmp_option);
            });
          tmp_td.appendChild(tmp_select);
        }
        this.tmp_tr.appendChild(tmp_td)
        tmp_select = document.createElement("select")
        tmp_select.setAttribute('name', 'col' + '_' + nb_filter)
        cols.forEach(function(col) {
          tmp_option = document.createElement("option");
          tmp_option.appendChild(document.createTextNode(col));
          tmp_select.appendChild(tmp_option);
          });
        tmp_td = document.createElement("td");
        tmp_td.appendChild(tmp_select);
        this.tmp_tr.appendChild(tmp_td)
        tmp_select = document.createElement("select")
        tmp_select.setAttribute('name', 'cond' + '_' + nb_filter)
        conds.forEach(function(cond) {
          tmp_option = document.createElement("option");
          tmp_option.appendChild(document.createTextNode(cond));
          tmp_select.appendChild(tmp_option);
        });
        tmp_td = document.createElement("td");
        tmp_td.appendChild(tmp_select);
        this.tmp_tr.appendChild(tmp_td)
        tmp_input = document.createElement("input")
        tmp_input.setAttribute('name', 'input' + '_' + nb_filter)
        tmp_td = document.createElement("td");
        tmp_td.appendChild(tmp_input);
        this.tmp_tr.appendChild(tmp_td);
        tmp_td = document.createElement("td");
        tmp_td.innerHTML = "<input type='button' onclick='new filter();return false;' value='+'/>"
        if (nb_filter != 0) {      
          tmp_input = document.createElement("input");
          tmp_input.setAttribute('value', '-');
          tmp_input.setAttribute('type', 'button');
          tmp_input.setAttribute('value', '-');
          tmp_input.onclick = function(){self.tmp_tr.parentNode.removeChild(self.tmp_tr); return false;};
          tmp_td.appendChild(tmp_input);
        }
        this.tmp_tr.appendChild(tmp_td);
        nb_filter++;
      }
      new filter();
      </script>
EOD;

    $to_be_pre_list_content .= $adv_search;
  }
}

echo <<<EOD
<div id="to_be_pre_list">
  $to_be_pre_list_content
</div>
EOD;
?>

</div>
</div>

<div id="post_list"></div>

<script type="text/javascript"> 
q = document.getElementById("to_be_post_list");
if (q != null) {
  o = document.getElementById("post_list");
  o.appendChild(q.parentNode.removeChild(q));
}
q = document.getElementById("to_be_pre_list");
if (q != null) {
  o = document.getElementById("pre_list");
  o.appendChild(q.parentNode.removeChild(q));
}
</script>




<center><a href="https://forge.cbp.ens-lyon.fr/redmine/projects/mylabstocks">mylabstocks</a>  -- since 2007 -- <a href="http://www.cecill.info/licences/Licence_CeCILL_V2.1-en.html">CeCILL V2.1</a> -- A software from <a href="http://www.ens-lyon.fr/LBMC/gisv/index.php/en/">the lab of Gael Yvert</a></center>



</div>
</body>
</html>