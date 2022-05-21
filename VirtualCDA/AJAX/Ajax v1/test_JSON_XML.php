<?php
echo "*********************************************\n";
echo "*****           JSON                *********\n";
echo "*********************************************\n";

/**** tableau simple */
echo "\n\n ***** tableau simple   *****\n";
$tabSimple = array( 1,  2,  3,  4);
echo json_encode($tabSimple);

/**** tableau associatif */
echo "\n\n ***** tableau associatif   *****\n";
$tabAssoc = array('a' => 1, 'b' => 2, 'c' => 3, 'd' => 4);
echo json_encode($tabAssoc);

/**** Objet public */

echo "\n\n ***** objet public   *****\n";
require "Client.Class.php";

$p1 = new Client("Alan","Kaline",23);

var_dump($p1);
var_dump (json_encode($p1));


/**** Objet privé */

echo "\n\n ***** objet privé   *****\n";

require "Alimentation1.Class.php";

$v1 = new Alimentation1(["libelleAliment"=>"abricot","typeAliment"=>"fruit","poid"=>"14 grammes","couleur"=>"orange"]);
var_dump($v1);
var_dump (json_encode($v1));

echo "\n\n\n\n";
echo "*********************************************\n";
echo "*****           XML                 *********\n";
echo "*********************************************\n";

/**** tableau simple */
echo "\n\n ***** tableau simple   *****\n";
echo xmlrpc_encode($tabSimple);

/**** tableau associatif */
echo "\n\n ***** tableau associatif   *****\n";
echo xmlrpc_encode($tabAssoc);

/**** Objet public */

echo "\n\n ***** objet public   *****\n";
var_dump (xmlrpc_encode($p1));


/**** Objet privé */
echo "\n\n ***** objet privé   *****\n";
require "Alimentation2.Class.php";

$a2 = new Alimentation2(["libelleAliment"=>"Pasteque","typeAliment"=>"fruit","poid"=>"150 grammes","couleur"=>"Verte"]);
var_dump($a2);
var_dump(Alimentation2::XMLEncode($a2));
var_dump(xmlrpc_encode(Alimentation2::XMLEncode($a2)));
