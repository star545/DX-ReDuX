
gpu_set_blendmode(bm_add)
var _max = 16
var limit = (_max)
for (var i = 0; i < limit; i++) {
	var time = ((current_time / 600) + (i * 1)) mod _max
	var timey = _max * (-cos((time / _max) * pi))
	var timex = cos(time * 3 ) * (time / 1)
	var timey2 = sin(time * 3) * time
	var _yy = cos(time) * 10
	var _xx = sin(time) * 10
	draw_sprite_ext(sprite_index, image_index, x + timex + _xx, y - timey2 - _yy, 1 + (timey / 64), 1 + (timey / 64), image_angle, c_red, image_alpha * (0.2 * (1 - (timey / _max))))
}
var playerid = obj_player1
gpu_set_blendmode(bm_normal)
var _xscale = sprite_index = spr_pizzaface_dead ? image_xscale : 1
if !flash draw_sprite_ext(sprite_index, image_index, x, y, _xscale, 1, image_angle, image_blend, image_alpha)
else draw_sprite_ext_flash(sprite_index, image_index, x, y, _xscale, 1, image_angle, c_white, image_alpha)
