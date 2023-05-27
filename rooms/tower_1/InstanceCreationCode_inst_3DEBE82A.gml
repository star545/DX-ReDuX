targetRoom = strongcold_arena
msg = "Holiday Cheer"
level = "a_strongcold"
tex_groups = ["strongcoldgroup"]
arena = 1

details = [
gate_createlayer(spr_gate_strongcold, 0),
gate_createlayer(spr_gate_strongcold, 1),
{
	sprite_index : spr_gate_strongcold,
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
		var sx = other.xstart - 15
		var sy = other.ystart - 90
		var pct = 0.05
		var _xx = sx - (sx * pct)
		_xx += (480 * pct)
		var _yy = sy - (sy * pct)
		_yy += (270 * pct)
		x = (camx * pct) + _xx
		y = (camy * pct) + _yy
			
			
	}
},
gate_createlayer(spr_gate_strongcold, 3),
gate_createlayer(spr_gate_strongcold, 4, 0.33),
]
