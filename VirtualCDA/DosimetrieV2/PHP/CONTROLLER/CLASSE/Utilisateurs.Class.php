<?php

class Utilisateurs 
{

	/*****************Attributs***************** */

	private $_IdUtilisateur;
	private $_Nom;
	private $_Prenom;
	private $_AdresseMail;
	private $_MotDePasse;
	private $_TelUtilisateur;
	private $_DosimetrieAvantActivite;
	private $_DosimetrieApresActivite;
	private $_DateReleveDosimetrique;
	private $_IdRole;
	private $_IdPosteEntreprise;
	private $_IdEntreprise;
	private static $_attributes=["IdUtilisateur","Nom","Prenom","AdresseMail","MotDePasse","TelUtilisateur","DosimetrieAvantActivite","DosimetrieApresActivite","DateReleveDosimetrique","IdRole","IdPosteEntreprise","IdEntreprise"];
	/***************** Accesseurs ***************** */


	public function getIdUtilisateur()
	{
		return $this->_IdUtilisateur;
	}

	public function setIdUtilisateur(?int $IdUtilisateur)
	{
		$this->_IdUtilisateur=$IdUtilisateur;
	}

	public function getNom()
	{
		return $this->_Nom;
	}

	public function setNom(?string $Nom)
	{
		$this->_Nom=$Nom;
	}

	public function getPrenom()
	{
		return $this->_Prenom;
	}

	public function setPrenom(?string $Prenom)
	{
		$this->_Prenom=$Prenom;
	}

	public function getAdresseMail()
	{
		return $this->_AdresseMail;
	}

	public function setAdresseMail(?string $AdresseMail)
	{
		$this->_AdresseMail=$AdresseMail;
	}

	public function getMotDePasse()
	{
		return $this->_MotDePasse;
	}

	public function setMotDePasse(?string $MotDePasse)
	{
		$this->_MotDePasse=$MotDePasse;
	}

	public function getTelUtilisateur()
	{
		return $this->_TelUtilisateur;
	}

	public function setTelUtilisateur(?string $TelUtilisateur)
	{
		$this->_TelUtilisateur=$TelUtilisateur;
	}

	public function getDosimetrieAvantActivite()
	{
		return $this->_DosimetrieAvantActivite;
	}

	public function setDosimetrieAvantActivite(?float $DosimetrieAvantActivite)
	{
		$this->_DosimetrieAvantActivite=$DosimetrieAvantActivite;
	}

	public function getDosimetrieApresActivite()
	{
		return $this->_DosimetrieApresActivite;
	}

	public function setDosimetrieApresActivite(?float $DosimetrieApresActivite)
	{
		$this->_DosimetrieApresActivite=$DosimetrieApresActivite;
	}

	public function getDateReleveDosimetrique()
	{
		return  $this->_DateReleveDosimetrique;
	}

	public function setDateReleveDosimetrique( $dateReleveDosimetrique)
	{
		$this->_DateReleveDosimetrique=$dateReleveDosimetrique;
	}

	public function getIdRole()
	{
		return $this->_IdRole;
	}

	public function setIdRole(int $IdRole)
	{
		$this->_IdRole=$IdRole;
	}

	public function getIdPosteEntreprise()
	{
		return $this->_IdPosteEntreprise;
	}

	public function setIdPosteEntreprise(int $IdPosteEntreprise)
	{
		$this->_IdPosteEntreprise=$IdPosteEntreprise;
	}

	public function getIdEntreprise()
	{
		return $this->_IdEntreprise;
	}

	public function setIdEntreprise(int $IdEntreprise)
	{
		$this->_IdEntreprise=$IdEntreprise;
	}

	public static function getAttributes()
	{
		return self::$_attributes;
	}

	/*****************Constructeur***************** */

	public function __construct(array $options = [])
	{
 		if (!empty($options)) // empty : renvoi vrai si le tableau est vide
		{
			$this->hydrate($options);
		}
	}
	public function hydrate($data)
	{
 		foreach ($data as $key => $value)
		{
 			$methode = "set".ucfirst($key); //ucfirst met la 1ere lettre en majuscule
			if (is_callable(([$this, $methode]))) // is_callable verifie que la methode existe
			{
				$this->$methode($value===""?null:$value);
			}
		}
	}

	/*****************Autres Méthodes***************** */

	/**
	* Transforme l'objet en chaine de caractères
	*
	* @return String
	*/
	public function toString()
	{
		return 
		// "IdUtilisateur : ".$this->getIdUtilisateur().
		$this->getNom()." ".
		$this->getPrenom();
		// ."AdresseMail : ".$this->getAdresseMail()
		// ."MotDePasse : ".$this->getMotDePasse()
		// ."TelUtilisateur : ".$this->getTelUtilisateur()
		// ."DosimetrieAvantActivite : ".$this->getDosimetrieAvantActivite()
		// ."DosimetrieApresActivite : ".$this->getDosimetrieApresActivite()
		// ."DateReleveDosimetrique : ".$this->getDateReleveDosimetrique()
		// ."IdRole : ".$this->getIdRole()
		// ."IdPosteEntreprise : ".$this->getIdPosteEntreprise()
		// ."IdEntreprise : ".$this->getIdEntreprise()."\n";
	}
}