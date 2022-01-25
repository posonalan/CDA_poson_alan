<?php

class Animaux{
	private $_idAnimal;
	private $_libelleAnimal;
	private $_dateNaissance;

	public function getIdAnimal()
	{
		return $this->_idAnimal;
	}

	public function setIdAnimal($idAnimal)
	{
		$this->_idAnimal = $idAnimal;
	}

	public function getLibelleAnimal()
	{
		return $this->_libelleAnimal;
	}

	public function setLibelleAnimal($libelleAnimal)
	{
		$this->_libelleAnimal = $libelleAnimal;
	}

	public function getDateNaissance()
	{
		return $this->_dateNaissance;
	}

	public function setDateNaissance($dateNaissance)
	{
		$this->_dateNaissance = $dateNaissance;
	}

	// Constructeur
	public function __construct(array $options = [])
	{ 
		if (!empty($options))
		{
			$this->hydrate($options);
		}
	}
	public function hydrate($data)
	{
		foreach ($data as $key => $value)
		{
			$method = 'set'.ucfirst($key);
			
			if (is_callable([$this, $method]))
			{
				$this->$method($value);
			}
		}
	}


}