import ("filter.lib");
import ("oscillator.lib");
import ("stdfaust.lib");
import ("math.lib");


input = noise;
fc = hslider ("fc", 440, 50, 4000, 0.01) : smooth (0.999); // Llamar a este slider desde afuera


//modulacion = hslider ("modulacion", 440, 50, 4000, 0.01) : smooth (0.999);
Q = hslider ("Q", 1, 0.1, 30, 0.01) : smooth (0.999); // Llamar a este slider desde afuera

gain = hslider ("gain", 0.5, 0, 1, 0.01) : smooth(0.999); // Llamar a este slider desde afuera
gate = checkbox ("gate") : smooth (0.999); // Llamar a este gate desde afuera

//Filtro
lp = resonlp(fc,Q,gain);


// Salida
out_lp = input:lp;


//filter = vslider("[0] filter [style:menu{'Lowpass':0;'Highpass':1;'Bandpass':2}]", 0, 0, 2, 1);

//signal = out_lp, out_hp, out_bp: select3(filter);

process = vgroup ("LPF", out_lp*gain*gate);
