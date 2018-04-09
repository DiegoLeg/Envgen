package com.example.root.envgen;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.view.MotionEvent;
//import android.widget.ToggleButton;
import com.DspFaust.DspFaust;
import android.view.View.OnTouchListener;
import android.widget.ImageView;


public class MainActivity extends AppCompatActivity {

    DspFaust dspFaust;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        int SR = 48000;
        int blockSize = 128;
        dspFaust = new DspFaust(SR,blockSize);
        dspFaust.start();
        //dspFaust.setParamValue("/EG/gate", 0); //
    }

    @Override
    public void onDestroy(){
        super.onDestroy();
        dspFaust.stop();
    }

        public void boton(View view) {
        view.setOnTouchListener(new OnTouchListener() {


            @Override
              public boolean onTouch(View v, MotionEvent event) {   // Agregar MotionEvent para que vea ACTION DOWN/UP
                switch (event.getAction()) {                        // Switchea entre eventos/acciones

                    case MotionEvent.ACTION_DOWN: {                 
                        
                        dspFaust.setParamValue("/EG/gate", 1);

                        return true;                        
                    }

                    case MotionEvent.ACTION_UP: {
                        dspFaust.setParamValue("/EG/gate", 0);

                       return true;
                   }
                    default:
                       return false;
                }
            }
        });
    }
    }


