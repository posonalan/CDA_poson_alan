package com.example.tutoand1;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;


/* class */
public class MainActivity extends AppCompatActivity {

        /* Attributs */
        private TextView resultat;
        private EditText entre;
        private Button go;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        /* recuperation des elements du layout */
        resultat = findViewById(R.id.resultat);
        /* On va chercher les elements */
        entre = findViewById(R.id.entre);
        go = findViewById(R.id.go);
    }

  go.setOnClickListener(this);

    @Override
    public void onclick(View v){
        if (v == go) {
            resultat.setText(entre.getText());
        }
    }
}