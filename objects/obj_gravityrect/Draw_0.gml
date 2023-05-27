draw_set_colour(make_colour_rgb(0, 148, 255));
draw_set_alpha(0.5);
draw_roundrect_ext(x, y, x + sprite_width - 1, y + sprite_height - 1, 10, 10, false);
draw_set_alpha(1);