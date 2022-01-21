<?php
//  $r = new Regions(["libelleRegion"=>"test","numeroRegion"=>3]);
//  var_dump(RegionsManager::add($r));
//   $r = RegionsManager::findById(15);
//  $r2 = RegionsManager::findById(16);
 //$r->setLibelleRegion("toto");
// var_dump($r);
 //var_dump(RegionsManager::update($r));
// var_dump( RegionsManager::delete($r));
$d = AnimauxManager::getList(null,["idAnimal"=>1,"LibelleAnimal"=>"%i%"],1,"2000-12-15",1,1);
var_dump($d);