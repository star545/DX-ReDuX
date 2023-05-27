
for (var i = 0; i < 6; i++) {
	var _xx = 57 + ((i % 3)	* 45)
	var _yy = 50 + (floor(i / 3) * 43)
	if global.option_funnyhud _yy += 100
	draw_sprite(spr_bosshealth, php_index, _xx, _yy)
}
for (var i = 0; i < 10; i++) {
	var _xx = (960 - 57) - ((i % 5) * 45)
	var _yy = 50 + (floor(i / 5) * 43)
	draw_sprite_ext(spr_pbHp, php_index, _xx, _yy, 1, 1, 0, instance_exists(obj_pizzaboyboss) ? c_white : c_black, 1)
}