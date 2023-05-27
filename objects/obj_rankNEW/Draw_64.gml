shader_set(global.Pal_Shader)
player_palette()
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
shader_reset()
// Toppins
var center_x = 600
draw_line_color(center_x, 0, center_x + 1, 540, c_black, c_black)
for (var i = 0; i < 5; i++) {
	var pad = 100
	
	var _tx = center_x - ( (pad * 4) / 2)
	var _y = clipy + 75
	with toppins[i] {
		image_index += image_speed
		if anim_end(sprite_get_number(sprite_index) - 1)
			image_speed = 0
		shake = Approach(shake, 0, 1)
		draw_sprite_ext(sprite_index, image_index, _tx + (pad * i) + random_range(-shake, shake), _y, 1, 1, 0, c_white, 1 )
		
	}
}
for (var s = 0; s < 3; s++) {
	pad = 100
	_tx = center_x - ((2 * pad) / 2)
	_y = clipy + 275
	with secrets[s] {
		image_index += image_speed
		if anim_end(sprite_get_number(sprite_index) - 1)
			image_speed = 0
		shake = Approach(shake, 0, 1)
		draw_sprite_ext(sprite_index, image_index, _tx + (pad * s) + random_range(-shake, shake), _y, 1, 1, 0, c_white, 1 )
		
	}
	
}