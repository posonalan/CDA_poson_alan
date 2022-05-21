package com.alan.intent_alan;

import static android.view.View.VISIBLE;
import static androidx.core.content.PackageManagerCompat.LOG_TAG;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    private EditText mEditTextMessage;
    private TextView mReplyHeadTextView;
    private TextView mReplyTextView;

    /* declaration du log */
    private static final String LOG_TAG = MainActivity.class.getSimpleName();
    /* La clef EXTRA */
    public static final String EXTRA_MESSAGE = "deuxActivite.extra.MESSAGE";

    public static final int TEXT_REQUEST =1;





    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        /* recuperation de l'edit text */
        mEditTextMessage = findViewById(R.id.edit_text_message);
        mReplyHeadTextView = findViewById(R.id.text_header_reply);
        mReplyTextView = findViewById(R.id.text_message_reply);
    }

    public void launchSecondActivity(View view) {
        /* Message dans la console */
        Log.d(LOG_TAG,"clique, vasy clique ");
        /* recuperation du message */
        String message = mEditTextMessage.getText().toString();

        /* creation de la nouvelle activité */
        Intent intent = new Intent(this, SecondActivity.class);
        intent.putExtra(EXTRA_MESSAGE, message);
        /* lancement de l'activité */
        startActivityForResult(intent, TEXT_REQUEST);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data){
        super.onActivityResult(requestCode, resultCode, data);
        if(requestCode == TEXT_REQUEST){
            if(resultCode == RESULT_OK){
                String reply = data.getStringExtra(SecondActivity.EXTRA_REPLY);
                mReplyHeadTextView.setVisibility(View.VISIBLE);
                mReplyTextView.setText(reply);
                mReplyTextView.setVisibility(View.VISIBLE);
            }
        }
    }
/* Si une seul info a envoyer on utilise un URI */
/* Si plusieurs info a envoyer on utilise un Extra */

}