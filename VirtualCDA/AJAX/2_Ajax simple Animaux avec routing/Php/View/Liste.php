<?php
$liste = AnimauxManager::getList(false);
?>
<div class="espaceHorizon fondBlanc"></div>
<div id="contenu">
	<div id="crudBarreOutil">
		<!--  nouvelle route   -->
	<a class=" crudBtn crudBtnOutil" href="/PHP/Controller/Routes.php?mode=ajout" >Ajouter </a>
	</div>
	<div id="crudTableau">
		<table id="crud" class="avectri">
			<thead class="crudEntete">
				<th class="crudColonne">Libelle animal</th>
				<th class="crudColonne">date Naissance</th>
			</thead>
			<?php
			foreach ($liste as $elt) {
				echo '<tr class="crudLigne">';

				echo '	<td class="crudColonne">' . $elt->getLibelleAnimal() . '</td>';
				echo '	<td class="crudColonne">' . $elt->getDateNaissance() . '</td>';
?>
			
						<td class="crudColonneBtn">
							<a class=" crudBtn crudBtnEdit">Afficher </a>
							<a class=" crudBtn crudBtnModif">Modifier</a>
							<a class=" crudBtn crudBtnSuppr">Supprimer</a>
						</td>
					</tr>';
		<?php }?>	
		<tr class="crudLigne">
						<td>Nombre d\'animaux : </td>
						<td id="anim"></td>
					</tr>
				</table>
			</div>
</div>
<div class="espaceHorizon fondBlanc"></div>';
