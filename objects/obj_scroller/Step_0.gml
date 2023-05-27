var range = 50
with obj_player1 {
	if (x < -range) x = room_width + range
	if (x > room_width + range) x = -range	
	if (y < -range) y = room_height + range
	if (y > room_height + range) && room != pinball_arena y = -range	
}
with obj_baddie {
	if (x < -range) { 
		if thrown { 
			if object_index != obj_meatball instance_destroy() 
			else thrown = false		
		}
		x = room_width + range 
	}
	if (x > room_width + range) { 
		if thrown { 
			if object_index != obj_meatball instance_destroy() 
			else thrown = false		
		}
		x = -range
	}
	if object_index != obj_meatball {
		if (y < -range) y = room_height + range
		if (y > room_height + range) y = -range	
	}
}
with obj_blobmonster_arena {
	if (x < -range) x = room_width + range
	if (x > room_width + range) x = -range	
	if (y < -range) y = room_height + range
	if (y > room_height + range) y = -range	
}