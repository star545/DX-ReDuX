//var scale = 0
var scale = orb_scale
scale += random_range(-3, 3)
scale = max(0, scale)
draw_set_color(c_white)
if state != 0
	draw_sprite_ext(sprite_index, image_index, x, y, length_scale, width_scale, dir, c_white, 1)
draw_circle(x, y, scale, 0)	