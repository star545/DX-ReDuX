var _xx  = 195
if (showtext == true) yi = Approach(yi, 800, 5);
else yi = Approach(yi, 1200, 3);	

if msg == "NaN"
	msg = localmusstring
	
draw_set_font(global.font_small)
draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_set_color(c_white)
	
draw_sprite(spr_roomnamebg,0, yi, _xx)

if string_width(string_upper(msg)) <= maxwidth
	draw_text(yi, _xx, string_upper(msg))
else
	draw_text_ext(yi, _xx - 6, string_upper(msg),-1,maxwidth)
