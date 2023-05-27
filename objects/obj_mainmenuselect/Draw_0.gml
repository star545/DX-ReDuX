draw_rectangle_color(0,0, 960, 540, c_black,c_black,c_black,c_black, 0)
draw_sprite(sprite_index, image_index, 0, 0)
//draw_rectangle_color(686 - titlex, 156, 911 - titlex, 369, c_black,c_black,c_black,c_black, 0)

draw_set_alpha(1)
draw_sprite_ext(spr_title, -1, -64 + 100, 120 + 100, 1, 1, 0, c_white, 1)
draw_text(480, 500, msg[optionselected])
