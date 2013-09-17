<?php
class form {


  // propriétés privées : tous les éléments et attributs utilisables (certaines valeurs sont entrées par défaut)
  private $eventArr = array ('onfocus' => '',
                             'onblur' => '',
                             'onselect' => '',
                             'onchange' => '',
                             'onclick' => '',
                             'ondblclick' => '',
                             'onmousedown' => '',
                             'onmouseup' => '',
                             'onmouseover' => '',
                             'onmousemove' => '',
                             'onmouseout' => '',
                             'onkeypress' => '',
                             'onkeydown' => '',
                             'onkeyup' => '');
  private $commonArr = array ('id' => '',
                              'class' => '',
                              'title' => '',
                              'style' => '',
                              'dir' => '',
                              'lang' => '',
                              'xml:lang' => '');
  private $formArr = array (
                   'method' => 'post',
                   'action' => '',
                   'id' => 'mainForm',
                   'enctype' => 'application/x-www-form-urlencoded',
                   'accept' => '',
                   'onsubmit' => '',
                   'onreset' => '',
                   'accept-charset' => 'unknown',
                   'style' => ''
                   );
  private $inputArr = array ('text' => array ('value' => '',
                                              'name' => '',
                                              'alt' => '',
                                              'tabindex' => '',
                                              'accesskey' => '',
                                              'readonly' => '',
                                              'disabled' => '',
                                              'width' => '',
                                              'maxlength' => '',
                                              'size ' => ''),
                             'button' => array ('name' => '',
                                               'value' => '',
                                               'alt' => '',
                                               'tabindex' => '',
                                               'accesskey' => '',
                                               'disabled' => ''),
                             'hidden' => array ('name' => '',
                                               'value' => '',
                                               'alt' => '',
                                               'disabled' => '',
                                               'size ' => ''),
                             'password' => array ('name' => '',
                                               'value' => '',
                                               'alt' => '',
                                               'tabindex' => '',
                                               'accesskey' => '',
                                               'readonly' => '',
                                               'disabled' => '',
                                               'width' => '',
                                               'maxlength' => '',
                                               'size ' => ''),
                             'submit' => array ('name' => '',
                                               'value' => '',
                                               'alt' => '',
                                               'tabindex' => '',
                                               'accesskey' => '',
                                               'disabled' => ''),
                             'checkbox' => array ('name' => '',
                                               'value' => '',
                                               'alt' => '',
                                               'tabindex' => '',
                                               'accesskey' => '',
                                               'disabled' => '',
                                               'checked' => ''),
                             'radio' => array ('name' => '',
                                               'value' => '',
                                               'alt' => '',
                                               'tabindex' => '',
                                               'accesskey' => '',
                                               'disabled' => '',
                                               'checked' => '',
                                               'title' => ''),
                             'reset' => array ('name' => '',
                                               'class' => '',
                                               'value' => '',
                                               'alt' => '',
                                               'tabindex' => '',
                                               'accesskey' => '',
                                               'disabled' => '',
                                               'title' => ''),
                             'file' => array ('name' => '',
                                               'value' => '',
                                               'alt' => '',
                                               'tabindex' => '',
                                               'accesskey' => '',
                                               'disabled' => '',
                                               'accept' => '',
                                               'size ' => ''),
                             'image' => array ('name' => '',
                                               'value' => '',
                                               'alt' => '',
                                               'tabindex' => '',
                                               'accesskey' => '',
                                               'disabled' => '',
                                               'src' => '',
                                               'usemap' => '',
                                               'ismap' => '')
                             );
  private $fieldsetArr = array ();
  private $pArr = array ();
  private $legendArr = array ();
  private $labelArr = array ('for' => '');
  private $textareaArr = array ('rows' => '',
                                'cols' => '',
                                'disabled' => '',
                                'readonly' => '',
                                'accesskey' => '',
                                'tabindex' => '',
                                'name' => '');
  private $selectArr = array ('disabled' => '',
                              'multiple' => '',
                              'size' => '',
                              'name' => '');
  private $optionArr = array ('disabled' => '',
                              'label' => '',
                              'selected' => '',
                              'value' => '');
  private $optgroupArr = array ('disabled' => '');
  private $formBuffer = array ();
  private $formElementArr = array ();
  private $formAttributeArr = array ();

  //Constructeur
  public function __construct () {

  }

  // débuter effectivement le formulaire
  public function openForm ($arrArgs = array ()) {
     foreach ($this -> formArr as $clef => $val) {
      if (array_key_exists ($clef, $arrArgs)) {
        $this -> formAttributeArr[$clef] = $arrArgs[$clef];
      }
      else if (!empty ($val)) {
        $this -> formAttributeArr[$clef] = $val;
      }
    }
    $this -> formBuffer['open'] = '<form ';
    foreach ($this -> formAttributeArr as $clef => $val) {
      $this -> formBuffer['open'] .= $clef.'="'.$val.'" ';
    }
    $this -> formBuffer['open'] .= '>';
  }

  // fermer le formulaire
  public function closeForm () {
    $this -> formBuffer['close'] = '</form>';
  }

  // ajouter un type input
  public function addInput ($elem, $arrArgs = array ()) {
    if (!array_key_exists ($elem, $this -> inputArr)) {
      throw new Exception ($elem.' n\'est pas un élément valide');
    }
    if (!array_key_exists ('name', $arrArgs) && $elem !== 'submit' && $elem !== 'reset') {
      $arrArgs['name'] = 'default';
    }
    $cpt = count ($this -> formElementArr);
    $this -> formElementArr[$cpt][$elem] = array ();
    $arrTemp = array_merge ($this -> eventArr, $this -> commonArr, $this -> inputArr[$elem]);
    foreach ($arrTemp as $clef => $val) {
      if (array_key_exists ($clef, $arrArgs)) {
      $this -> formElementArr[$cpt][$elem][$clef] = $arrArgs[$clef];
      }
    }
    $chaineTemp = '<input type="'.$elem.'" ';
    foreach ($this -> formElementArr[$cpt][$elem] as $clef => $val) {
      $chaineTemp .= $clef.'="'.$val.'" ';
    }
    $chaineTemp .= '/>';
    $this -> formBuffer['elements'][$cpt] = $chaineTemp;
  }

  // ouvrir un fieldset
  public function openFieldset ($arrArgs = array ()) {
    $cpt = count ($this -> formElementArr);
    $this -> formElementArr[$cpt]['fieldset'] = array ();
    $arrTemp = array_merge ($this -> eventArr, $this -> commonArr, $this -> fieldsetArr);
    foreach ($arrTemp as $clef => $val) {
      if (array_key_exists ($clef, $arrArgs)) {
        $this -> formElementArr[$cpt]['fieldset'][$clef] = $arrArgs[$clef];
      }
    }
    $chaineTemp = '<fieldset ';
    foreach ($this -> formElementArr[$cpt]['fieldset'] as $clef => $val) {
      $chaineTemp .= $clef.'="'.$val.'" ';
    }
    $chaineTemp .= '>';
    $this -> formBuffer['elements'][$cpt] = $chaineTemp;
  }

  // fermer un fieldset
  public function closeFieldset () {
    $cpt = count ($this -> formElementArr);
    $this -> formElementArr[$cpt]['/fieldset'] = array ();
    $chaineTemp = '</fieldset>';
    $this -> formBuffer['elements'][$cpt] = $chaineTemp;
  }

  // ajouter une légende
  public function addLegend ($legend, $arrArgs = array ()) {
    $cpt = count ($this -> formElementArr);
    $this -> formElementArr[$cpt]['legend']['innerHTML'] = $legend;
    $arrTemp = array_merge ($this -> eventArr, $this -> commonArr, $this -> legendArr);
    foreach ($arrTemp as $clef => $val) {
      if (array_key_exists ($clef, $arrArgs)) {
        $this -> formElementArr[$cpt]['legend'][$clef] = $arrArgs[$clef];
      }
    }
    $chaineTemp = '<legend ';
    foreach ($this -> formElementArr[$cpt]['legend'] as $clef => $val) {
	 if ($clef !== 'innerHTML') {
		$chaineTemp .= $clef.'="'.$val.'" ';
	}
    }
    $chaineTemp .= '>'.$legend.'</legend>';
    $this -> formBuffer['elements'][$cpt] = $chaineTemp;
  }

   // ouvrir une balise p
   public function openP ($arrArgs = array ()) {
     $cpt = count ($this -> formElementArr);
     $this -> formElementArr[$cpt]['p'] = array ();
     $arrTemp = array_merge ($this -> eventArr, $this -> commonArr, $this -> pArr);
     foreach ($arrTemp as $clef => $val) {
       if (array_key_exists ($clef, $arrArgs)) {
         $this -> formElementArr[$cpt]['p'][$clef] = $arrArgs[$clef];
       }
     }
     $chaineTemp = '<p ';
     foreach ($this -> formElementArr[$cpt]['p'] as $clef => $val) {
       $chaineTemp .= $clef.'="'.$val.'" ';
     }
     $chaineTemp .= '>';
     $this -> formBuffer['elements'][$cpt] = $chaineTemp;
   }

   // fermer une balise p
   public function closeP () {
     $cpt = count ($this -> formElementArr);
     $this -> formElementArr[$cpt]['/p'] = array ();
     $chaineTemp = '</p>';
     $this -> formBuffer['elements'][$cpt] = $chaineTemp;
  }

  // ajouter un label
  public function addLabel ($label, $arrArgs = array ()) {
    $cpt = count ($this -> formElementArr);
   $this -> formElementArr[$cpt]['label']['innerHTML'] = $label;
    $arrTemp = array_merge ($this -> eventArr, $this -> commonArr, $this -> labelArr);
    foreach ($arrTemp as $clef => $val) {
      if (array_key_exists ($clef, $arrArgs)) {
        $this -> formElementArr[$cpt]['label'][$clef] = $arrArgs[$clef];
      }
    }
    $chaineTemp = '<label ';
    foreach ($this -> formElementArr[$cpt]['label'] as $clef => $val) {
	 if ($clef !== 'innerHTML') {
		$chaineTemp .= $clef.'="'.$val.'" ';
	}
    }
    $chaineTemp .= '>'.$label.'</label>';
    $this -> formBuffer['elements'][$cpt] = $chaineTemp;
  }

  // ajouter un textarea
  public function addTextarea ($txt, $arrArgs = array ()) {
    $cpt = count ($this -> formElementArr);
    $this -> formElementArr[$cpt]['textarea']['innerHTML'] = $txt;
    $arrTemp = array_merge ($this -> eventArr, $this -> commonArr, $this -> textareaArr);
    foreach ($arrTemp as $clef => $val) {
      if (array_key_exists ($clef, $arrArgs)) {
        $this -> formElementArr[$cpt]['textarea'][$clef] = $arrArgs[$clef];
      }
    }
    $chaineTemp = '<textarea ';
    foreach ($this -> formElementArr[$cpt]['textarea'] as $clef => $val) {
	 if ($clef !== 'innerHTML') {
		$chaineTemp .= $clef.'="'.$val.'" ';
	}
    }
    $chaineTemp .= '>'.$txt.'</textarea>';
    $this -> formBuffer['elements'][$cpt] = $chaineTemp;
  }

  // ouvrir un select
  public function openSelect ($arrArgs = array ()) {
    $cpt = count ($this -> formElementArr);
    $this -> formElementArr[$cpt]['select'] = array ();
    $arrTemp = array_merge ($this -> eventArr, $this -> commonArr, $this -> selectArr);
    foreach ($arrTemp as $clef => $val) {
      if (array_key_exists ($clef, $arrArgs)) {
        $this -> formElementArr[$cpt]['select'][$clef] = $arrArgs[$clef];
      }
    }
    $chaineTemp = '<select ';
    foreach ($this -> formElementArr[$cpt]['select'] as $clef => $val) {
      $chaineTemp .= $clef.'="'.$val.'" ';
    }
    $chaineTemp .= '>';
    $this -> formBuffer['elements'][$cpt] = $chaineTemp;
  }

  // fermer un select
   public function closeSelect () {
    $cpt = count ($this -> formElementArr);
    $this -> formElementArr[$cpt]['/select'] = array ();
    $chaineTemp = '</select>';
    $this -> formBuffer['elements'][$cpt] = $chaineTemp;
  }

  // ajouter une option
  public function addOption ($txt, $arrArgs = array ()) {
    $cpt = count ($this -> formElementArr);
    $this -> formElementArr[$cpt]['option']['innerHTML'] = $txt;
    $arrTemp = array_merge ($this -> eventArr, $this -> commonArr, $this -> optionArr);
    foreach ($arrTemp as $clef => $val) {
      if (array_key_exists ($clef, $arrArgs)) {
        $this -> formElementArr[$cpt]['option'][$clef] = $arrArgs[$clef];
      }
    }
    $chaineTemp = '<option ';
    foreach ($this -> formElementArr[$cpt]['option'] as $clef => $val) {
	 if ($clef !== 'innerHTML') {
		$chaineTemp .= $clef.'="'.$val.'" ';
	}
    }
    $chaineTemp .= '>'.$txt.'</option>';
    $this -> formBuffer['elements'][$cpt] = $chaineTemp;
  }

  // ouvrir un optgroup
  public function openOptgroup ($label, $arrArgs = array ()) {
    $cpt = count ($this -> formElementArr);
    $this -> formElementArr[$cpt]['optgroup']['label'] = $label;
    $arrTemp = array_merge ($this -> eventArr, $this -> commonArr, $this -> optgroupArr);
    foreach ($arrTemp as $clef => $val) {
      if (array_key_exists ($clef, $arrArgs)) {
        $this -> formElementArr[$cpt]['select'][$clef] = $arrArgs[$clef];
      }
    }
    $chaineTemp = '<optgroup ';
    foreach ($this -> formElementArr[$cpt]['optgroup'] as $clef => $val) {
      $chaineTemp .= $clef.'="'.$val.'" ';
    }
    $chaineTemp .= '>';
    $this -> formBuffer['elements'][$cpt] = $chaineTemp;
  }

  // fermer un optgroup
  public function closeOptgroup () {
    $cpt = count ($this -> formElementArr);
    $this -> formElementArr[$cpt]['/optgroup'] = array ();
    $chaineTemp = '</optgroup>';
    $this -> formBuffer['elements'][$cpt] = $chaineTemp;
  }

  // ajouter n'importe quoi
  public function addAnything ($any) {
    $cpt = count ($this -> formElementArr);
    $this -> formBuffer['anything'][$cpt] = $any;
  }

  // méthode magique utilisée pour afficher effectivement le formulaire défini
	public function __toString () {
		$chaineTemp = '';
		if (isset ($this -> formBuffer['open']) && isset ($this -> formBuffer['close'])) {
			$chaineTemp = $this -> formBuffer['open'];
			if (isset ($this -> formBuffer['elements']) && !empty ($this -> formBuffer['elements'])) {
				foreach ($this -> formBuffer['elements'] as $clef => $val) {
					 if (isset ($this -> formBuffer['anything'][$clef])) {
					        $chaineTemp .= $this -> formBuffer['anything'][$clef];
      					}
      					$chaineTemp .= $val;
				}
			}
			$chaineTemp .= $this -> formBuffer['close'];
		}
		return $chaineTemp;
	}

  // méthode pour libérer les ressources et créer un nouveau formulaire (tout formulaire réé auparavant et non affiché sera perdu)
  public function freeForm () {
    $this -> formBuffer = array ();
    $this -> formElementArr = array ();
    $this -> formAttributeArr = array ();
  }

  // destructeur (en attendant mieux...)
  public function __destruct () {
    unset ($this);
  }

  /** *************************
   ***METHODS FOR DEBUGGING***
   ***************************/

  // méthode affichant tous les éléments que contient le formulaire
  public function showElems () {
    $chaineTemp = '';
    foreach ($this -> formElementArr as $clef => $val) {
      foreach ($val as $elem => $attrArr) {
        if (strpos ($elem, '/') !== false) {
           $chaineTemp .= '<ul><li style="color: blue;">end '.substr ($elem, 1, strlen ($elem)).'</li></ul>';
        }
        else {
          $chaineTemp .= '<ul><li style="color: blue;">'.$elem.'</li><ul>';
          foreach ($attrArr as $attr => $value) {
            $chaineTemp .= '<li style="color: red;">'.$attr.' = <span style="color: green; font-style: italic;">'.$value.'</span></li>';
          }
          $chaineTemp .= '</ul></ul>';
        }
      }
    }
    return $chaineTemp;
  }

  // méthode coomptant les éléments que contient le formulaire : total global, et total par élément
  public function countElems () {
    foreach ($this -> formElementArr as $clef => $val) {
      foreach ($val as $elem => $attrArr) {
        if (strpos ($elem, '/') === false) {
          $arrTemp[] = $elem;
        }
      }
    }
    $cptElem = count ($arrTemp);
    $arrEachElem = array_count_values ($arrTemp);
    $chaineTemp = '<span style="color: black; font-weight: bold;">Total éléments : <span style="color: red;">'.$cptElem.'</span><br />dont : </span><br />';
    ksort ($arrEachElem, SORT_STRING);
    foreach ($arrEachElem as $elem => $nbr) {
      $chaineTemp .= '<span style="color: blue; margin-left: 20px;">'.$elem.' : </span><span style="color: red;">'.$nbr.'</span><br />';
    }
    return $chaineTemp;
  }

}
?>
