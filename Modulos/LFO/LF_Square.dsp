import ("oscillator.lib");
import ("filter.lib");

freq = hslider ("freq", 10, 1, 20, 0.01) : smooth (0.999);	// Llamar a este slider desde afuera
gain = hslider ("gain", 0.5, 0, 1, 0.01) : smooth (0.999);	// Llamar a este slider desde afuera
gate = checkbox ("gate") : smooth (0.999);			// Llamar a este gate desde afuera

// Square Wave

out_lfsquare = lf_squarewave(freq);

//wave = vslider("[0] signal [style:menu{'Sawtooth':0;'Square':1;'Triangle':2}]", 0, 0, 2, 1);

//signal= out_sawtooth, out_square, out_triangle: select3(wave);

process = vgroup ("Square", out_lfsquare*gain*gate);

