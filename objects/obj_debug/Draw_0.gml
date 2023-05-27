draw_set_font(font_console);
draw_set_halign(fa_center);
draw_set_color(c_white);
with obj_player1
draw_text(x, y - 50, "State: " + string(state) + "." + string(substate) + ", " + string(stateName));