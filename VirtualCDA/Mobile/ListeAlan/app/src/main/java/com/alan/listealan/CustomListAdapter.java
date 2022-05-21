package com.alan.listealan;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.os.Bundle;
import android.text.Layout;
import android.view.LayoutInflater;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.List;

public class CustomListAdapter extends AppCompatActivity {

    private List<UserAccount> listUser;
    private LayoutInflater layoutInflater;
    private Context context;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_custom_list_adapter);
    }
   /* attributs */
    public int getCount(){
        return listUser.size();
    }
    public Object getItem(int position){
        return listUser.get(position);
    }
    public long getItemId(int position){
        return position;
    }

    /* constructeur */
    public CustomListAdapter(List<UserAccount>listUser, Context context){
        this.listUser = listUser;
        layoutInflater = LayoutInflater.from(context);
        this.context = context;
    }

    /* la class pour le viewholder qui contient les info de la vue */
    static class ViewHolder{
        /* attributs */
        ImageView rolePicView;
        TextView userNameView;
        TextView roleView;

        /* changer les images en fonction de leurs noms */
        public int getMipmapResIdByName(String resName){
            String pkgName = context.getPackageName();
            /* retourne 0 si pas trouver */
            int resID = context.getRessources().getIdentifier(resName, "mipmap", pkgName);
            
        }

    }
}