var y_diff = y - ystart
var height = y_diff / sprite_get_height(spr_stomper_leg)
draw_sprite_ext(spr_stomper_leg, leg_index, x, ystart, image_xscale, height, image_angle, image_blend, image_alpha)
draw_self()
