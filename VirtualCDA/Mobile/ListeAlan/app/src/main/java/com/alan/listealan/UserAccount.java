package com.alan.listealan;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

public class UserAccount extends AppCompatActivity {

    private String userName;
    private String userType;
    private Boolean active;

    public String getUserName() {
        return this.userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserType() {
        return this.userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public Boolean getActive() {
        return this.active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    /* convertir en string pour la liste */
    @Override
    public String toString() {
        return this.userName + "(" + this.userType + ")";
    }


}