import ("oscillator.lib");
import ("filter.lib");
import ("stdfaust.lib");
//import ("music.lib");

// Filtros	
fc = 500;

freq = vslider ("freq", 440, 50, 4000, 0.01) : smooth (0.999);

A = fc>freq;
B = fc<freq;

gain = vslider ("gain", 0.5, 0, 1, 0.01) : smooth (0.999);
gate = button ("gate");

// Sawtooth

out1 = (saw2(freq)*A);
out2 = (saw5(freq)*B);

// Salida Sawtooth
out_sawtooth = out1+out2;

// ADSR parameters

attack  = vslider ("Attack", 0.00, 0, 1, 0.001): si.polySmooth (gate,0.999,1);
decay   = vslider ("Decay", 0.1, 0, 1, 0.001) : si.polySmooth (gate,0.999,1);
sustain = vslider ("Sustain", 0.07, 0, 1, 0.01) : si.polySmooth (gate,0.999,1);
release = vslider ("Release", 0.08, 0, 1, 0.001) : si.polySmooth (gate,0.999,1);

eg = en.adsr(attack, decay, sustain, release);

process = hgroup ("EG", out_sawtooth*gain*(gate:eg));
