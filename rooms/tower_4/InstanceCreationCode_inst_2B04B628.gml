targetRoom = clown_arena
msg = "What's so funny?"
arena = 1
level = "a_clown"
tex_groups = ["citygroup"]
details = [
gate_createlayer(spr_gate_clown, 0),
gate_createlayer(spr_gate_clown, 1),
gate_createlayer(spr_gate_clown, 2, 0.33),
{
	sprite_index : spr_gate_clown,
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
		var cam = new camera_get_position_struct(view_camera[0])
		x = other.xstart + ((cam.cam_x - other.xstart) * 0.05) + 5
		y = other.ystart + ((cam.cam_y - other.ystart) * 0.05) - 50
			
			
	}
}

]

