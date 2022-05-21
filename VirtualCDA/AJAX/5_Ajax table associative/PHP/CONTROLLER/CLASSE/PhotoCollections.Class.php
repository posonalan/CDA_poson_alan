<?php

class PhotoCollections 
{

	/*****************Attributs***************** */

	private $_IdPhotoCollection;
	private $_libellePhoto;
	private $_commentairePhoto;
	private $_idUtilisateur;
	private static $_attributes=["IdPhotoCollection","libellePhoto","commentairePhoto","idUtilisateur"];
	/***************** Accesseurs ***************** */


	public function getIdPhotoCollection()
	{
		return $this->_IdPhotoCollection;
	}

	public function setIdPhotoCollection(int $IdPhotoCollection)
	{
		$this->_IdPhotoCollection=$IdPhotoCollection;
	}

	public function getLibellePhoto()
	{
		return $this->_libellePhoto;
	}

	public function setLibellePhoto(?string $libellePhoto)
	{
		$this->_libellePhoto=$libellePhoto;
	}

	public function getCommentairePhoto()
	{
		return $this->_commentairePhoto;
	}

	public function setCommentairePhoto(?string $commentairePhoto)
	{
		$this->_commentairePhoto=$commentairePhoto;
	}

	public function getIdUtilisateur()
	{
		return $this->_idUtilisateur;
	}

	public function setIdUtilisateur(int $idUtilisateur)
	{
		$this->_idUtilisateur=$idUtilisateur;
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
		return "IdPhotoCollection : ".$this->getIdPhotoCollection()."LibellePhoto : ".$this->getLibellePhoto()."CommentairePhoto : ".$this->getCommentairePhoto()."IdUtilisateur : ".$this->getIdUtilisateur()."\n";
	}
}