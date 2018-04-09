import ("music.lib");
import ("filter.lib");
import ("stdfaust.lib");

pink_filter = fi.iir((0.049922035, -0.095993537, 0.050612699, -0.004408786),
                    (-2.494956002, 2.017265875, -0.522189400));
pink_noise = noise : pink_filter;


gain = hslider ("gain", 0.5, 0, 1, 0.01) : smooth(0.999); // Llamar a este slider desde afuera
gate = checkbox ("gate") : smooth (0.999); // Llamar a este gate desde afuera

//out = vslider("[0] Noise [style:menu{'White':0;'Pink':1}]", 0, 0, 1, 0);
//signal= noise, pink_noise: select2(out);


process = vgroup ("Pink Noise Generator", pink_noise*gain*gate);
