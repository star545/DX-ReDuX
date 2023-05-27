targetRoom = lightsout_arena
msg = "You bring a light?"
level = "a_lightsout"


details = [
gate_createlayer(spr_gate_lightsout, 0),
gate_createlayer(spr_gate_lightsout, 1),
{
	sprite_index : spr_gate_lightsout,
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
		var cam = new camera_get_position_struct(view_camera[0])
		x = other.xstart + ((cam.cam_x - other.xstart) * 0.05) + 15
		y = other.ystart + ((cam.centeredcam_y - other.ystart) * 0.05) - 210
		y += Wave(-2, 2, 10, 5)
			
			
	}
},
gate_createlayer(spr_gate_lightsout, 3, 0.33)

]

