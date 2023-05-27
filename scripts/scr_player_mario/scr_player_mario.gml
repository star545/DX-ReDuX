function scr_player_mario()
{
	var maxspd = 2.6 * 3
	var hsp_dec = (maxspd * 3)
	if !key_attack maxspd = 1.25 * 3
	if global.mario_mach maxspd *= 15
	var acc = 0.06 * 2.5
	var skidacc = acc * 1.2
	var decc = 0.1 * 4
	var grav = 0.4
	var altgrav = 0.125
	var airborne = substate == states.mariojump || state_delay > 0
	
	var jumpspd = (-4 - (abs(hsp) / hsp_dec)) * 1.6
	var term_vel = 12
	//if bump_wall(hsp) hsp 
	image_speed = 0.5
	move = (key_left + key_right)
	if (sprite_index != spr_mario_fire || anim_end()) && !key_up {
		if substate == states.mariojump {
			image_speed = 0
			if sprite_index != spr_mario_skid && sprite_index != spr_mario_jump sprite_index = spr_mario_walk
		}
		else if hsp != 0 {
			if (hsp < 0.1 && xscale == 1) || (hsp > -0.1 && xscale == -1) sprite_index = spr_mario_skid
			else {
				sprite_index = spr_mario_walk
				if abs(hsp) == maxspd && key_attack sprite_index = spr_mario_mach3
				image_speed = 0.065+abs(hsp)/hsp_dec;	
			}
		} else sprite_index = spr_mario_idleanim
	}
	if key_up {
		if sprite_index != spr_mario_breakdance1 && sprite_index != spr_mario_breakdance2 && sprite_index != spr_mario_breakdance3
			sprite_index = choose(spr_mario_breakdance1, spr_mario_breakdance2, spr_mario_breakdance3)
		image_speed = 0.5	
		
	}
	if key_down sprite_index = spr_mario_crouch
	if grounded {
		state_delay = 0
		if substate == states.mariojump substate = states.mariowalk
	}
	else {
		state_delay++
		if state_delay >= 4 substate = states.mariojump
		
	}
	if (grounded && substate != states.mariojump && key_jump) || (substate == states.mariojump && vsp > 0 && place_meeting_solid(x + xscale, y) && move == xscale && key_jump) {
		vsp = jumpspd
		sprite_index = spr_mario_jump
		jumpstop = 0 
		substate = states.mariojump
		scr_soundeffect(sfx_mariojump)
		
		
	}
	
	if key_attack2 && instance_number(obj_fireball) < 2 {
		sprite_index = spr_mario_fire
		image_index = 0
		with instance_create(x + (xscale * 15), y - 30, obj_fireball) { 
			hsp = max(abs(other.hsp), maxspd) * other.xscale
			movespeed = hsp
			image_xscale = other.xscale	
		}
		
	}
		
		
		
	
	if substate == states.mariojump && !key_jump2 jumpstop = true
	
	if move != 0 {
		if !airborne xscale = move
		if move == 1 {
			if hsp >= 0 hsp = Approach(hsp, maxspd, (airborne && move == -xscale) ? acc / 1.5 : acc)
			else hsp = Approach(hsp, maxspd, (sprite_index == spr_mario_skid) ? skidacc * 1.25 : skidacc)
		} else {
			if hsp < 0 hsp = Approach(hsp, -maxspd, (airborne && move == -xscale) ? acc / 1.5 : acc)
			else hsp = Approach(hsp, -maxspd, (sprite_index == spr_mario_skid) ? skidacc * 1.25 : skidacc)
			
		}
		
		
	} else hsp = Approach(hsp, 0, decc)
	if airborne {
		if sprite_index != spr_mario_jump && state_delay < 4 {
			vsp += altgrav / 8
			
		} else {
			if !jumpstop && vsp < -1 vsp += altgrav
			else {
				jumpstop = true
				vsp += grav
				
			}
			
		}
		
		
	}
	if vsp > term_vel vsp = term_vel
	scr_dotaunt()
	exit;
}

function scr_mario_wallslide() {
	
	var maxspd = 2.6 * 3
	var hsp_dec = (maxspd * 3)
	if !key_attack maxspd = 1.25 * 3
	var acc = 0.06 * 2.5
	var skidacc = acc * 1.2
	var decc = 0.1 * 4
	var grav = 0.4
	var altgrav = 0.125
	var airborne = substate == states.mariojump || state_delay > 0
	
	var jumpspd = (-4 - (abs(hsp) / hsp_dec)) * 1.5
	var term_vel = 12
	//if bump_wall(hsp) hsp 
	sprite_index = spr_mario_slide
	move = (key_left + key_right)
	if move == xscale state_delay = Approach(state_delay, 20, 1)	
	else state_delay = Approach(state_delay, 0, 1)
		
	
	if !place_meeting_solid(x + xscale, y) || move == -xscale { 
		state = states.mariowalk
		sprite_index = spr_mario_walk
		state_delay = 0
		xscale *= -1
		hsp = xscale * 0.5
	}
	if place_meeting_collision(x, y) x += -xscale	
	vsp = grav
	if !place_meeting_collision(x, y + vsp) y += vsp
	if vsp > term_vel vsp = term_vel
	
	if key_jump  {
		xscale *= -1
		state_delay = 0
		hsp = xscale * (maxspd / 2)
		vsp = jumpspd
		sprite_index = spr_mario_jump
		jumpstop = 0 
		substate = states.mariojump
		state = states.mariowalk
		scr_soundeffect(sfx_mariojump)
		
	}
}