targetRoom = medieval_1
msg = "Pizzascape"
level = "medieval"
tex_groups = ["medievalgroup"]

details = [
gate_createlayer(spr_gate_medieval, get_level_pct(level) == 100 ? sprite_get_number(spr_gate_medieval) - 1 : 0),
gate_createlayer(spr_gate_medieval, 1),
{
	sprite_index : spr_gate_medieval,
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
		x = 50
		y = -60
		defaultParallax(0.1, 0.1)	
	}
},
{
	sprite_index : spr_gate_medieval,
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
		x = 132
		y = -30
		defaultParallax(0.05, 0.05)	
	}
},
gate_createlayer(spr_gate_medieval, 4)

]
