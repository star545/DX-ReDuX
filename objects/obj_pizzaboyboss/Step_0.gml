if state != states.transitioncutscene {
	radius += 20	
}
switch state {
	case states.transitioncutscene:
		with obj_player1 {
			hsp = 0
			vsp = 0
			state = states.actor
			image_speed = 0.35
			if anim_end() {
				if sprite_index = spr_player_gnomecutscene2 image_speed = 0
				else if sprite_index == spr_player_gnomecutscene3 sprite_index = spr_player_gnomecutscene4
				
			}
			
		}
		image_speed = 0.35
		if anim_end() && sprite_index != spr_goldenpizzaboy image_speed = 0
	
	
	break
	case states.stun: 
		stunned = 100 
		if audio_is_playing(mu_pizzaboyboss) audio_stop_sound(mu_pizzaboyboss) 
		scr_enemy_stun() 
		if !grounded && sprite_index == spr_goldenpizzaboy_stun sprite_index = spr_goldenpizzaboy_bump 
		scr_collision() 

		flashflickertime++
		if (flashflickertime >= 20)
		{
			flash = 1
			flashflickertime = 0
		}

	break;	
	case states.grabbed: 
		var do_it = false
		with obj_player1 if anim_end(3) || sprite_index != spr_haulingstart do_it = true
		if do_it {
			repeat (6) create_baddiedebris()
			create_particle(x, y, particle.genericpoofeffect)
			repeat(3) with instance_create(x + random_range(-25, 25), y + random_range(-25, 25), obj_machalleffect) {
				image_index = random(3)
				sprite_index = spr_parryeffect
				
			}
			with obj_player1 {
				sprite_index = spr_player_lungehit
				image_index = 0
				state = states.throwing
				scr_soundeffect(sfx_killingblow)
				scr_soundeffect(sfx_punch)
			
				shake_cam(3)
				movespeed = 8
				other.state = states.stun
				other.thrown = 1
				other.linethrown = 1
				other.image_xscale = -xscale
				other.hithsp = other.image_xscale * -25
			}
		} else scr_enemy_grabbed()
	break;	
	case states.charge: 
		image_speed = 0.35
		hsp = (image_xscale * movespeed)
		vsp = 0
		if anim_end() && sprite_index == spr_goldenpizzaboy_grabstart sprite_index = spr_goldenpizzaboy_grab
		scr_collision()
		movespeed += 0.2
		if !instance_exists(obj_jumpdust) with instance_create(x, y, obj_jumpdust) image_xscale = other.image_xscale
		if place_meeting(x + hsp, y, obj_player) || place_meeting_solid(x + hsp, y) {
			vsp = -3
			state = states.stun
			image_index = 0 
			sprite_index = spr_goldenpizzaboy_bump
			hsp = -image_xscale * 5
			
		}
	
	break
	
}
if (flash == 1 && alarm[1] <= 0)
	alarm[1] = (0.15 * room_speed)