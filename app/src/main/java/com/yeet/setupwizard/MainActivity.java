package com.yeet.setupwizard;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.ViewFlipper;

public class MainActivity extends Activity {

    ViewFlipper vf;
    LinearLayout btn_navGroup;
    int pageCounter = 0;

    final int totalPageNum = 3 - 1; // started from zero

    final String TAG = "TAG";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        vf = (ViewFlipper) findViewById(R.id.vf);
        btn_navGroup = (LinearLayout) findViewById(R.id.btn_navGroup);
    }

    public void onWelcomeNextClick(View v){
        btn_navGroup.setVisibility(View.VISIBLE);
        gotoNextPage(v);
    }

    public void gotoNextPage(View v){
        pageCounter++;
        vf.setDisplayedChild(pageCounter);
        if(pageCounter == totalPageNum){
            btn_navGroup.setVisibility(View.GONE);
        }
        Log.d(TAG, "gotoNextPage: "+pageCounter);
    }

    public void gotoPrevPage(View v){
        pageCounter--;
        vf.setDisplayedChild(pageCounter);
        if(pageCounter == 0){
            btn_navGroup.setVisibility(View.GONE);
        }
        Log.d(TAG, "gotoNextPage: "+pageCounter);
    }

    public void finish(View v){
        finish();
    }
}