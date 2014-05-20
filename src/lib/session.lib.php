<?php
// Base sur Ph. Rigaux, OReilly 3e edition.
// table visitors (login/pwd)
// table websession
// Les privileges de labmember_add sont:
// SELECT sur visitors,
// et ALL sur sessionWeb

function execQry ($qry, $bd)
{
  $result = mysql_query($qry, $bd);
  if (!$result)
  {
    echo "error in execQry ". mysql_error ($db);
    exit;
  }
  else
   return $result;
}


function CleanOldSessions ($bd)
{
  //erase sessions outdated since 15 days
  $tooOld = date ("U") - 1296000;
  $qry = "DELETE FROM websession WHERE time_limit < $tooOld";
  $resultat = execQry ($qry, $bd);
}

function LoginForm ($nom_script, $login_default = "view")
{
  $ret = <<<EOD
  <div class="centered_form">
  <i>To login, cookies must be enabled on your browser</i>
  <br/>
  <br/>
    <form method="post" action="$nom_script">
      <fieldset>
        <legend >Log In</legend>
        <input type="text" id="Login" value="$login_default" name="visitor_login"/>
        <label style="margin: 5px;" for="MyText" > username</label><br/>
        <input type="password" id="Pwd" name="visitor_pwd" value=""/>     
        <label style="margin: 5px;" for="MyText" > password</label><br/>
        <input type="submit" id="MyButton" value="Submit"/>
      </fieldset>
    </form>
  </div>
EOD;
  echo $ret;
}


function get_visitor ($login, $bd) {
  $log = substr($login, 0, 3);
  $qry = "SELECT * FROM visitors WHERE `login` LIKE '%$log%'";
  $result = mysql_query($qry, $bd);
  while($vis = mysql_fetch_object($result)) {
    if ($vis->login == substr($login, 0, strlen($vis->login))) {
      if ($vis->target_table != "all"){
        $vis->target_table = substr($login, strlen($vis->login));        
      }
      return $vis;
    }
  }
  return NULL;
}

function create_session ($bd, $login, $pwd, $id_session){
  $visitor = get_visitor ($login, $bd);
    //L'internaute existe-t-il?
  if (is_object($visitor)) {
    //verif du mot de passe
    if ($visitor->pwd == md5($pwd)) {
      // on insere une session de trente minutes dans table websession
      $time_limit = date ("U") + SESSION_DURATION;
      $insSession = "INSERT INTO websession (id_session, login, "
        . "time_limit, target_table, "
        . "mode) VALUES ('$id_session', '$login', '$time_limit', '$visitor->target_table', '$visitor->mode')";
      $resultat = execQry ($insSession, $bd);
      return TRUE;
    } else {
      echo "<B> Sorry, incorrect password for $login !</B><P>";
      return FALSE;
    }
  } else {
    echo "<B>Sorry, $login is not a registered login!</B><P>";
    return FALSE;
  }
}

//check session validity, destroy if not
function is_valid_session ($session, $bd) {
  //is time over?
  $now = date ("U");
  if ($session->time_limit < $now) {
    session_destroy();
    $destr = "DELETE FROM websession WHERE id_session='$session->id_session'";
    $resultat = execQry ($destr, $bd);    
  } else { //session is valid
   return TRUE;
  }
}


function get_session ($id_session, $bd) {
  $qry = "SELECT * FROM websession WHERE `id_session` = '$id_session'";
  while($sess = mysql_fetch_object(execQry ($qry, $bd))) {
    if ($sess->id_session == $id_session) {
      return $sess;
    }
  }
  return NULL;
}

// main function for access control 
function control_access ($nom_script, $infos_login, $id_session, $bd) {
  //recherche la session
  $session_courante = get_session ($id_session, $bd);
  //cas 1: la session existe, on verifie sa validite
  if (is_object($session_courante)) {
     // la session existe, est-elle valide?
     if (is_valid_session ($session_courante, $bd)) {
        // on renvoie l'objet session
        return $session_courante;
     } else {
        echo "<B> Your session is not (or no longer) valid.<P></B>\n";
     }
  }  
  // Cas 2.a: La session n'existe pas mais un login et pwd ont ete fournis
  if (isset($infos_login['visitor_login']) & isset($infos_login['visitor_pwd'])) {
    // Les login/pwd sont-ils corrects?
    if (create_session ($bd, $infos_login['visitor_login'], $infos_login['visitor_pwd'], $id_session)) {
      // on renvoie l'object session
      return get_session ($id_session, $bd);
    } else {
        echo "<B> Identification failed.<P></B>\n";
    }
  }  
  // Cas 2.b: La session n'existe pas 
  // et il faut afficher le formulaire d'identification
  LoginForm ($nom_script);
}


?>