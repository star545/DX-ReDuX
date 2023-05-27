targetRoom = pinball_arena
msg = "Multiball"
level = "a_pinball"
tex_groups = ["pinballgroup"]
arena = true
details = [
gate_createlayer(spr_gate_pinball, 0),
gate_createlayer(spr_gate_pinball, 1),
{
	sprite_index : spr_gate_pinball,
	image_index : 2,
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
		x = other.xstart + ((camx - other.xstart) * 0.05) + 20
		y = other.ystart + ((camy - other.ystart) * 0.05) - 140
	}
},
gate_createlayer(spr_gate_pinball, 3, 0.2)
]