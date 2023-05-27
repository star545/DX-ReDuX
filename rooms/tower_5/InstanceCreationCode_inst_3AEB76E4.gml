show_fade = 0
targetRoom = kidsparty_1
msg = "Pizzaboy's Pizz-Pizza"
level = "kidsparty"
tex_groups = ["kidspartygroup"]
details = [
{
	sprite_index : spr_gate_kidspartyClosed,
	image_index : 0,
	image_xscale : 1,
	image_yscale : 1,
	image_speed : 0.35,
	image_alpha : 1,
	image_blend : c_white,
	image_angle : 0,
	x : 0,
	y : 0,
	hspeed : 0,
	vspeed : 0,
	func : function() { 
		if other.drawing {
			if sprite_index == spr_gate_kidspartyClosed {
				sprite_index = spr_gate_kidspartyOpening
				scr_soundeffect(sfx_fnaf)
				image_index = 0
			}
		} else if sprite_index == spr_gate_kidspartyOpen {
			sprite_index = spr_gate_kidspartyClosing
			scr_soundeffect(sfx_fnaf2)
			image_index = 0	
		}
		if anim_end(sprite_get_number(sprite_index) - 1, image_index) {
			if sprite_index == spr_gate_kidspartyClosing
				sprite_index = spr_gate_kidspartyClosed
			if sprite_index == spr_gate_kidspartyOpening
				sprite_index = spr_gate_kidspartyOpen
			
		}
		//y = clamp(y, -50, 50)
			
			
	}
},
gate_createlayer(spr_gate_kidsparty_cut, 0),
{
	sprite_index : spr_gate_kidsparty_monsters,
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
		with other.details[0] {
			if sprite_index == spr_gate_kidspartyClosed
				other.image_index = irandom(4)
			
		}
	
			
			
	}
},
gate_createlayer(spr_gate_kidsparty_bg, 0, 0.33),

]