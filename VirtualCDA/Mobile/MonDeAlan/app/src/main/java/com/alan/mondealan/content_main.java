package com.alan.mondealan;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

import java.text.MessageFormat;
import java.util.Random;

public class content_main extends AppCompatActivity {

/* le nombre a afficher */
    private int nombre;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.content_main);
        /* on recupere le contenu ecrit par l'utilisateur dans l'intent et on l'affiche. */
         Intent intent = getIntent();
         /* on prend le contenu de se qu'il y a de marqué dans l'input et on le convertie en chiffre*/
         nombre = Integer.parseInt(intent.getStringExtra(MainActivity.EXTRA_MESSAGE));

/* puis on appel notre fonction chiffre aleatoire */
        chiffreAleatoire();

}/* fonction rejoué donc affiche un nouveau chiffre aleatoire */
    public void refreshNumber(View view){ chiffreAleatoire();}

    /* affiche un chiffre aleatoire */
    public void chiffreAleatoire(){
        /* on créée un objet random (un chiffre aleatoire) */
        Random r = new Random();
        /* le nombre entrer +1 pour ne pas avoir le 0 et on fusionne avec le objet "aleatoire" */
        int randomNb = r.nextInt(nombre)+1;
        /* on prend la textView(div)*/
       TextView description = findViewById(R.id.description2);
       /* on met le random dans le textView */
       description.setText(String.valueOf(randomNb));
    }




}