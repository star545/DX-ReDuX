targetRoom = kungfu_arena
msg = "Hiiiiiiiiiyah!!!!"
level = "a_kungfu"
arena = 1
tex_groups = ["kungfugroup"]
var sx = xstart
var sy = ystart
details = [
gate_createlayer(spr_gate_kungfu, 0),
gate_createlayer(spr_gate_kungfu, 1),
{
		sprite_index : spr_gate_kungfuBG,
		image_index : 0,
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
			var sx = other.xstart
			var sy = other.ystart
			var pct = 0.05
			var _xx = sx - (sx * pct)
			_xx += (480 * pct)
			var _yy = sy - (sy * pct)
			_yy += (270 * pct)
			x = (camx * pct) + _xx
			y = (camy * pct) + _yy
			
			
		}
	}
]