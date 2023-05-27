if (!(ds_exists(tex_list, 2)))
	exit;
var p = (tex_max - ds_list_size(tex_list))
var t = ((p / tex_max) * 100)
//draw_healthbar(0, 524, 960, 540, t, c_black, c_white, c_white, 0, 0, 0)


	icon_alpha += alarm[1] > 0 ? -0.3 : 0
	var a = clamp(icon_alpha, 0, 1)
	draw_sprite_ext(spr_pizzaslice, icon_index, 896, 480, 1, 1, 0, c_white, a)

