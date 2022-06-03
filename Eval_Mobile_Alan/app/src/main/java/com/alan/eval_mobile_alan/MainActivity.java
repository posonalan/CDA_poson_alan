package com.alan.eval_mobile_alan;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import java.util.Random;


public class MainActivity extends AppCompatActivity {

    /* reciperation du contenu de l'input */
    private EditText nombreChoisi ;
    /* affichage de se qu'a choisi l'utilisateur */
    private TextView reponse;
    /* affichage de la reponse */
    private TextView reponsefinal;
    /* affichage de la victoire */
    private TextView victoire;

    private int compteur;
    private int randomNb;  // c'est le nombre qu'il faut chercher

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        /* création de l'action */
        Intent intent = new Intent(this, Activite2.class);
        /* l'input qui demande le chiffre de l'utilisateur */
        nombreChoisi = (EditText) findViewById(R.id.nombreChoisi);
        /* suivant le comparatif on lui dit si il gagne ou pas  */
        victoire = (TextView) findViewById(R.id.victoire);
        /* le rendu de son chiffre */
        reponse  = (TextView) findViewById(R.id.reponse);
        reponsefinal  = (TextView) findViewById(R.id.reponsefinal);
        /* recuperation de mon bouton */
        Button boutonValide = (Button) findViewById(R.id.valide);
        chiffreAleatoire();
        /* recuperation de mon bouton */
        Button BoutonRejouer = (Button) findViewById(R.id.rejouer);

        /* on met l'action du clique */
        boutonValide.setOnClickListener(new View.OnClickListener() {



            @Override
            /* fonction au clique */
            public void onClick(View view) {
                    /* au clique on montre le resultat */
                /* j'envoi le nombre choisi par l'utilisateur   */

                /* Sur le clic, pas besoin d'envoyer d'intent.
                * Les intents servent à changer de page
                * ii, on va d'abord comparer et voir si c'est gagné ou perdu, il n'y a que dans ce cas qu'on envoi des intents pour changer de page*/

              /*  intent.putExtra("nombreChoisi", nombreChoisi.getText().toString() );
                intent.putExtra("aleatoire", reponsefinal.getText().toString() );*/
                /* on demarre l'action  */
            /*    startActivity(intent);
                */

                gameOver();
//               int compteur += (int) compteur;
            }


       /* fonction au clique */
        public void BoutonRejouer( ) {
//          rejouer();
            }
    });
   }

    /* fonction compare l'aleatoire et la reponse utilisateur */
    public void compare() {
        /* si le resultat est egal au chiffre aleatoir */

        /*  nombreChoisi est un EditText, il faut extraire le texte*/
        int valeurChoisie = Integer.parseInt(nombreChoisi.getText().toString());
        if ( valeurChoisie== randomNb) {
          //   victoire = (TextView) findViewById(R.id.victoire); // pas besoin d'aller le rechercher, c'est deja fait plus haut
            /* on met a jour le textView */
            victoire.setText(String.valueOf("c'est gagné !"));
        }
        else if( valeurChoisie < randomNb ){
           // TextView reponsefinal = findViewById(R.id.reponsefinal);// pas besoin d'aller le rechercher, c'est deja fait plus haut
            /* on met a jour le textView */
            reponsefinal.setText("c'est trop petit");
        }
        else {
//            TextView reponsefinal = findViewById(R.id.reponsefinal);
            /* on met a jour le textView */
            reponsefinal.setText(String.valueOf("cest trop grand"));
        }
    }

    /* fonction rejoué donc affiche un nouveau chiffre aleatoire */
    public void rejouer(View view){ chiffreAleatoire();}

        /* affiche un chiffre aleatoire */
    public void chiffreAleatoire(){
        /* on créée un objet random (un chiffre aleatoire) */
        Random r = new Random();
        /* je souhaite un aleatoir entre 1 et 10, donc +1 pour evité le 0  */
         randomNb = r.nextInt(10)+1;
        /* on prend la textView(div)*/
       // reponsefinal = (TextView) findViewById(R.id.reponsefinal);
        /* je met mon aleatoire dans une div qui sera montrée qu'a la victoire  */

        reponsefinal.setText(String.valueOf(randomNb));
    }

    public void gameOver() {
        if(compteur > 8){
            victoire.setText(String.valueOf("c'est perdu !"));
        }else{
            compare();
        }
    }
        }