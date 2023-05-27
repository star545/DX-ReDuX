switch state {
	case states.underground:
		if sprite_index != spr_pepclone_form sprite_index = spr_pepclone_hide
		else if anim_end() {
			state = states.normal
			sprite_index = spr_fakepeppino_idle
			
			
		}
	
	break
	
	case states.handstandjump:
		scr_collision()
		vsp = 0
		hsp = Approach(hsp, image_xscale * 8, 1.25)
		var a = instance_place(x, y, obj_player)
		if a > 0 { 
			with a {
				state = states.grabbed
				grabbedby = other.id
				x = (other.x + other.image_xscale * 30)
				y = other.y
				sprite_index = spr_hurt
				xscale = -other.image_xscale
				image_speed = 0.35
			}
			state = states.finishingblow
			image_index = 0
			sprite_index = spr_fakepeppino_grabattack
			
		}
		if anim_end() && sprite_index == spr_fakepeppino_grabdash {
			state = states.normal
			cooldown = 80
			
		}
	break;
	case states.finishingblow:
		scr_collision()
		vsp = 0
		hsp = Approach(hsp, 0, 1)
		with obj_player1 {
			x = (other.x + other.image_xscale * 30)
			y = other.y
			
		}
		if anim_end(5) {
			with obj_player1 {
				if state = states.grabbed {
					state = states.normal
					scr_hurtplayer(id)
					
				}
				
			}
			state = states.normal
		}
	
	break
	case states.jump:
		scr_collision()
		hsp = Approach(hsp, 6 * image_xscale, 0.35)
		//if hsp != 0 image_xscale = sign(hsp)
		if (floor(image_index) == (image_number - 1))
		{
			if (sprite_index == spr_fakepeppino_jumpstart)
				sprite_index = spr_fakepeppino_jump
			else if (sprite_index == spr_fakepeppino_jump)
				sprite_index = spr_fakepeppino_fall
		}
		if (grounded && vsp > 0)
		{
			create_particle(x, y, particle.landcloud, 0)
			sprite_index = spr_fakepeppino_land
			image_index = 0
			state = states.normal
		}		
	break;
	case states.normal:
		scr_collision()
		hsp = Approach(hsp, 6 * face_obj(plyr), 0.35)
		if hsp != 0 image_xscale = sign(hsp)
		if (sprite_index != spr_fakepeppino_land && sprite_index != spr_fakepeppino_grabattack)
		{
			if (x != xprevious)
				sprite_index = spr_fakepeppino_walk
			else
				sprite_index = spr_fakepeppino_idle
		}
		else if (floor(image_index) == (image_number - 1))
			sprite_index = spr_fakepeppino_idle
		if (sprite_index == spr_fakepeppino_walk)
		{
			if ((!steppy) && (floor(image_index) == 2 or floor(image_index) == 7))
			{
				steppy = 1
				create_particle(x, (y + 38), particle.cloudeffect, 0)
			}
			if (steppy && floor(image_index) != 2 && floor(image_index) != 7)
				steppy = 0
		}
		
		if !grounded {
			state = states.jump
			if (vsp < 0)
			{
				with (instance_create(x, y, obj_highjumpcloud1))
				{
					if scr_solid(x, (y + 64))
					{
						while (!(scr_solid(x, (y + 1))))
							y++
					}
				}
				sprite_index = spr_fakepeppino_jumpstart
				image_index = 0
			}
			else
			{
				sprite_index = spr_fakepeppino_fall
				image_index = 0
			}
			
		}
		cooldown--		

		if place_meeting_solid(x + (sign(hsp) * 10), y)  {
			trace("meeting")
			var _solid = instance_place(x + (sign(hsp) * 10), y, obj_solid)
			if _solid != -4 {
				var top_of_solid = _solid.y 
				var dist = abs(top_of_solid - y)
				var pct = dist / 160
				if dist > 0 && dist <= 160 { 
					vsp = -12// * pct
					substate = states.jump
				}
			}
		} else if point_distance(x, 0, plyr.x, 0) <= 120 && cooldown <= 0 {
			state = states.handstandjump
			image_index = 0
			if face_obj(plyr) != 0 { 
				hsp = face_obj(plyr) * -6
				image_xscale = face_obj(plyr)	
			}
			else hsp = -(sign(hsp) * 6)
			sprite_index = spr_fakepeppino_grabdash
		}
			
		
		
		
		
	break
}