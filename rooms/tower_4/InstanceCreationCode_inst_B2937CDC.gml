targetRoom = freezer_1
msg = "The Three-Cheese Tundra"
level = "freezer"
tex_groups = ["freezergroup"]
details = [
gate_createlayer(spr_gate_freezer, get_level_pct(level) == 100 ? sprite_get_number(spr_gate_freezer) - 1 : 0),
gate_createlayer(spr_gate_freezer, 1),
gate_createlayer(spr_gate_freezer, 2, 1),
{
	sprite_index : spr_gate_freezer,
	image_index : 3,
	image_xscale : 1,
	image_yscale : 1,
	image_speed : 0,
	image_alpha : 1,
	image_blend : c_white,
	image_angle : 0,
	x : 0,
	y : 0,
	hspeed : 0,
	vspeed : 0,
	func : function() { 

		x = camx + hspeed
		hspeed += -2
		y = camy + vspeed
		vspeed -= -4
		

	}
},	
gate_createlayer(spr_gate_freezer, 4, 0.33),
]