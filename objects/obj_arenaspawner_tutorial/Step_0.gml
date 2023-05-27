var _found = 0
var total_count = 0
with obj_baddie {
	total_count++
	if arenaID = other.id 
		_found++
}



switch state {
	case states.normal:
		var proceed = true

		
		if anim_end(16) && proceed image_speed = 0	
			
		var in_cam = bbox_in_camera(view_camera[0], 100) || _found < 2
		var enem_max = instance_number(obj_baddie) < 10 || total_count < 10
		
		// If enemies left, proceed.
		if _found == 0 {
			state = states.portal
			image_index = 0
			visible = true
			image_speed = 0.35
		}
		
		if anim_end() {
			visible = false
			image_speed = 0
		}
	break
	case states.portal:
		if (floor(image_index) > 5) {
			state = states.normal

			
			with instance_create(x + random_range(-25, 25), y + random_range(-25, 25), obj_cheeseslime) {
				arenaID = other.id
				state = states.stun
				//hsp = random_range(-5, 5)
				vsp = -3
				important = 1
		        sprite_index = stunfallspr
		        stunned = 5
		        boundbox = 0	
				event_perform(ev_other, ev_room_start)
			}
			
		}
	break
	
}