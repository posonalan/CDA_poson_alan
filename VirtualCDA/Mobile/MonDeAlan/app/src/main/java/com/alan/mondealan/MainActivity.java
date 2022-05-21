package com.alan.mondealan;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

import java.util.Random;

public class MainActivity extends AppCompatActivity {
  /* on prend l'attribut de ou la donnée doit etre entrée */
    private EditText mRecepteur;
    private TextView mFace;
    private TextView mTitre;

    /* La clef EXTRA reception des données entrés*/
    public static final String EXTRA_MESSAGE = "MonDeAlan.extra.MESSAGE";

    /* a la creation */
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        /* recuperation de l'edit text */
        mRecepteur = findViewById(R.id.Recepteur);
        mFace = findViewById(R.id.face);
        mTitre = findViewById(R.id.titre);
            }

    public void Lancer(View view) {
        /* recuperation du message */
        String nombre = mRecepteur.getText().toString();
        /* creation de la nouvelle activité */
        Intent intent = new Intent(this, content_main.class);
        intent.putExtra(EXTRA_MESSAGE, nombre);
        /* lancement de l'activité */
        startActivity(intent);
    }

}