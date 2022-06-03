INSERT INTO `typesproduits` (`IdTypeProduit`, `LibelleTypeProduit`) VALUES (NULL, 'Non Alimentaire'), (NULL, 'Alimentaire');

INSERT INTO `categories` (`IdCategorie`, `LibelleCategorie`, `IdTypeProduit`) VALUES (NULL, 'Jouet', '1'), (NULL, 'Jeux', '1'), (NULL, 'Viande', '2');

INSERT INTO `articles` (`IdArticle`, `LibelleArticle`, `QuantiteStockee`, `IdCategorie`) VALUES (NULL, 'Nounours', '15', '1'), (NULL, 'Petit chevaux', '10', '2'), (NULL, 'Steak de boeuf', '9', '3');