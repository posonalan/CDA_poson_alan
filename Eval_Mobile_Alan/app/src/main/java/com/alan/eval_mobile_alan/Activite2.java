package com.alan.eval_mobile_alan;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import java.util.Random;

public class Activite2 extends AppCompatActivity {


    /* affichage de la resultat */
    private TextView resultat;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_activite2);
       // compare();
            /* je prend la textview resultat */
        resultat = (TextView) findViewById(R.id.resultat);
        /* je prend mon bouton retour  */
        Button retour = (Button) findViewById(R.id.retour);
        /* je lui passe une action vers la page 1 */
        Intent RetourAcc = new Intent(this,MainActivity.class);
        /* se que j'ai recu */
        Intent intentrecu =getIntent();
        /* l'aleatoire*/
        String alea =  intentrecu.getStringExtra("reponsefinal");
        /* le chiffre de l'utilisateur */
        String chiffreUser =  intentrecu.getStringExtra("nombreChoisi");
        /* la j'affiche les deux ... se qui ne sert qu'a voir si ils ont bien voyager */
        resultat.setText("Aleatoire : " + alea + " utilisateur : "+ chiffreUser);
            /* on donne l'action au bouton retour */
        retour.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                /* j'aimerais bien recuperer que le resultat de la  comparaison */
               // RetourAcc.putExtra("tu as ", compare());
                startActivity(RetourAcc);
            }
        });




//    /* fonction compare l'aleatoire et la reponse utilisateur */
//    public void compare(){
//        /* si le resultat est egal au chiffre aleatoir */
//        if( nombreChoisi == reponsefinal ){
//            TextView reponsefinal = findViewById(R.id.reponsefinal);
//            /* on met a jour le textView */
//            reponsefinal.setText(String.valueOf("c'est gagné !"));
//        }
////        else if( nombreChoisi < reponsefinal ){
////            TextView reponsefinal = findViewById(R.id.reponsefinal);
////            /* on met a jour le textView */
//
////        }
//        else {
//            TextView reponsefinal = findViewById(R.id.reponsefinal);
//            /* on met a jour le textView */
//            reponsefinal.setText(String.valueOf("cest trop petit"));
//        }

    }
}