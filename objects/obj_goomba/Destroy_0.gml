if squished {
	with instance_create(x, y, obj_machalleffect) {
		sprite_index = spr_goomba_dead
		image_speed = 1
	
	}
} else if y < room_height {
	with instance_create(x, y + 32, obj_sausageman_dead) {
		sprite_index = spr_goomba 
		image_yscale = -1
		
	}
		
}