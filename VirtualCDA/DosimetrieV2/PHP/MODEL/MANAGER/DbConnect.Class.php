<?php
/* Ce fichier sera inclus a chaque demande d'accés a la base de données. */ 
/* Il permet d'ouvrir la connexion a la base de données */ 
class DbConnect{
	/* variable */ 
	private static $db;
/* fonction d'appel de la base de données */ 
	public static function getDb()
	{
		return DbConnect::$db;
	}
/* fonction initialisation */ 
	public static function init()
	{ /* essai */ 
		try {
			/* données / identifiants de connexion */ 
			self::$db= new PDO ( 'mysql:host='. Parametres::getHost().';dbname='. Parametres::getDbname().';charset=utf8', Parametres::getLogin(), Parametres::getPwd());
		}
		catch (Exception $e)
		{/* en cas d'erreur nous affichons un message et on stop */ 
			die('Erreur :'. $e->getMessage());
		}
	}
}