package com.alan.topquiz;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.Display;
import android.view.View;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {

    public static final String EXTRA_MESSAGE = "com.afpa.myapplication.MESSAGE";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void sendMessage(View view){
        /* Notre action ici */
        /* la classe vers laquelle nous allons nous rendre */
        Intent intent = new Intent(this, DisplayMessageActivity.class);
        /* on va chercher le text */
        EditText editText = (EditText) findViewById(R.id.editText);
        String message = editText.getText().toString();
        /* ajout  de la valeur au a EditText */
        intent.putExtra(EXTRA_MESSAGE, message);
        /* demarre l'instance de display message activity */
        startActivity(intent);

    }
}