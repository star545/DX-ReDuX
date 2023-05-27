if get_keypieces() < 36 instance_destroy()
state = states.pizzahead_sexypicture
y_crop = 1
targetRoom = boss_pizzaboy
msg = "GOLDEN PIZZABOY"
level = "gpb"
//tex_groups = ["entrancegroup"]
details = [
gate_createlayer(spr_gate_pizzaboy, 0),
gate_createlayer(spr_gate_pizzaboy, 1),
{
		sprite_index : spr_gate_pizzaboy,
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
			var cent_cam = (camx + (camw / 4)) 
			var par_val = (cent_cam * 0.1)
			x = (0 + par_val)
			cent_cam = (camy + camh)
			par_val = (cent_cam * 0.1)
			y = (0 + par_val)
			
			
		}
	}
]