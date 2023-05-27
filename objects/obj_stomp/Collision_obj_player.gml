

if state == states.punch {
	if sprite_index == spr_stomper_fall || sprite_index = spr_stomper_prep {
		with other {
			y = other.y + 32
			vsp = 0
			sprite_index = spr_squished
			image_index = 0
			state = states.stunned
			if place_meeting_collision(x, y)
				while place_meeting_collision(x, y) y--
			
			
		}
		
	}
	if sprite_index == spr_stomper_land {
		with other {
			vsp = 6
			sprite_index = spr_squished
			image_index = 0
			state = states.stunned
			if place_meeting_collision(x, y, Exclude.PLATFORMS)
				while place_meeting_collision(x, y, Exclude.PLATFORMS) y--
			if place_meeting_platform(x, y + 1) y++	
			
			
		}
	}
	
	
}