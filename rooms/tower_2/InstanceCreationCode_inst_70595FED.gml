targetRoom = saloon_1
msg = "Fast Food Saloon"
level = "saloon"
tex_groups = ["pinballgroup"]
var _x = xstart
var _y = ystart
details = [
gate_createlayer(spr_gate_saloon, get_level_pct(level) == 100 ? sprite_get_number(spr_gate_saloon) - 1 : 0),
gate_createlayer(spr_gate_saloon, 1),
{
		sprite_index : spr_gate_saloonbg,
		image_index : 0,
		image_xscale : 1,
		image_yscale : 1,
		image_speed : 0.1,
		image_alpha : 1,
		image_blend : c_white,
		image_angle : 0,
		x : 0,
		y : 0,
		hspeed : 0,
		vspeed : 0,
		func : function() { 
			x = (camx * 0.15) + 128
			y = (camy * 0.15) - 128
			
			
		}
	}
]