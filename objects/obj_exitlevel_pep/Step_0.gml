if drop_state != 2 {
y += vsp
vsp += 0.5
}
if y >= obj_player1.y {
	if drop_state = 0 && vsp > 0 {
		vsp = -12
		sprite_index = obj_player1.spr_slipbanan1
		image_index = 0
		drop_state = 1	
		scr_soundeffect(sfx_groundpound)
		shake_cam(10)
	}
	if drop_state = 1 && vsp > 0 {
		y = obj_player1.y 
		drop_state = 2
		vsp = 0
		sprite_index = obj_player1.spr_slipbanan2
		image_index = 0
		
	}
	
	
}
if anim_end() {
		if sprite_index == obj_player1.spr_slipbanan1
			image_index = image_number - 1
		if sprite_index == obj_player1.spr_slipbanan2
			instance_destroy()
		
	}