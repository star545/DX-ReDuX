if other.pistol && image_index == 0 && get_keypieces() >= 5 && get_progress() >= 1 {
	image_index = 1
	flash = true
	alarm[0] = room_speed * 0.15
	scr_soundeffect(sfx_break)
	scr_soundeffect(sfx_breakblock1)
	with instance_create(x, y - 50, obj_keypiece) {
		keyid = "w1_secret"	
		depth = other.depth - 1
		
	}
	shake = 15
}