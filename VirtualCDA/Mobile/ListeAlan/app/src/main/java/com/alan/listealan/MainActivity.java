package com.alan.listealan;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

    /* recuperation de listView */
    ListView listView =(ListView)findViewById(R.id.listView);
    /* creation des users */
    UserAccount alan = new UserAccount("Alan","Admin");
    UserAccount maxance = new UserAccount("Maxance","user");
    UserAccount anthony = new UserAccount("Anthony","gest",false);
    /*Création de la liste */
    UserAccount[] users = users = new UserAccount[]{alan,maxance,anthony};
    /* creation de l'adapteur */
    ArrayAdapter<UserAccount> arrayAdapter = new ArrayAdapter<UserAccount>(this,android.R.layout.simple_list_item_1,users);
    /* Affectation de l'adaptateur */
    listView.setAdapter(arrayAdapter);
    for(int i = 0; i< users.length; i++){
        listView.setItemChecked(i,users[i].isActive());
    }
    }
}