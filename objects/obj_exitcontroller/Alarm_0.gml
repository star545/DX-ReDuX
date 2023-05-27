if global.panic {
	cam_shakex(20, 0.5, 0);
	repeat(60) with create_debris(irandom(room_width), 0, spr_johnDebris_generic, false) {
		vsp = random_range(0, 7)
		image_speed = 0		
	}
	
	
}
alarm[0] = irandom_range(time_in_frames(0, 10), time_in_frames(0, 30))