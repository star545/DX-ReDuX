function scr_player_jetpackjump()
{
	alarm[5] = 2
	alarm[7] = 60
	static flame_buffer = 2
	landAnim = 0
	if (grounded && vsp > 0 && (!(place_meeting(x, (y + vsp), obj_destructibles))) && (!(place_meeting(x, (y + vsp), obj_iceblock_breakable)))) {
		state = states.normal
		movespeed = abs(hsp)	
		if movespeed >= 6 state = states.mach2
	}
	with (obj_iceblock_breakable)
	{
		if (place_meeting((x - other.hsp), y, other) or place_meeting((x - other.xscale), y, other) or place_meeting(x, (y - other.vsp), other))
		{
			instance_destroy()
			if (other.vsp < 0)
				other.vsp = -14
			else if (other.vsp > -11)
				other.vsp = -11
			jumpstop = 0
		}
	}
	with (obj_destructibles)
	{
		if (place_meeting((x - other.hsp), y, other) or place_meeting((x - other.xscale), y, other) or place_meeting(x, (y - other.vsp), other))
		{
			instance_destroy()
			if (other.vsp < 0)
				other.vsp = -14
			else if (other.vsp > -11)
				other.vsp = -11
			jumpstop = 0
		}
	}
	with (instance_place((x + xscale), y, obj_tntblock))
	{
		instance_destroy()
		if (other.vsp > -11)
			other.vsp = -11
		jumpstop = 0
	}
	with (instance_place(x, (y + 1), obj_tntblock))
	{
		instance_destroy()
		if (other.vsp > -11)
			other.vsp = -11
		jumpstop = 0
	}
	move = (key_left + key_right)
	move2 = key_down - key_up
	dir = xscale
	if ((!jetpackdash))
	{
		dir = xscale
		if (sprite_index == spr_player_jetpackstart)
		{
			sprite_index = spr_player_jetpackmid
			image_index = 0
		}
		else if (sprite_index == spr_player_jetpackmid && floor(image_index) == (image_number - 1))
			sprite_index = spr_player_jetpackend
		if sign(hsp) != 0
			xscale = sign(hsp)
		if (key_slap2 && !jetpackbounce)
		{
			//doublejump = 1
			scr_soundeffect(sfx_explosion)
			scr_soundeffect(sfx_jetpackjump)
			instance_create(x, y, obj_playerexplosion)
			if global.noisejetpack
			sprite_index = spr_player_jetpackbooststart
			else
				sprite_index = spr_rockethitwall
			jetpackbounce = 1
			image_index = 0
			if (move != 0)
				xscale = move
			dir = xscale
			movespeed = 12
			jetpackdash = 1
			hsp = movespeed * xscale
		}
		if move != 0 && ((move == -1 && hsp >= -8) || (move == 1 && hsp <= 8))
			movespeed = Approach(movespeed, move * 8, 0.75)
		hsp = movespeed	
		
	}
	else if jetpackdash
	{
		
		hsp = (xscale * movespeed)
		movespeed += 0.075
		movespeed = max(8, movespeed)
		vsp = 0
		if global.noisejetpack { 
			vsp = move2 * 5
			flame_buffer--
			if flame_buffer <= 0 {
				create_particle(x, y - 35, particle.flame_trail)
				flame_buffer = 2
			}
			

			
		}
		if anim_end() && !global.noisejetpack {
			jetpackdash = 0
			movespeed = hsp	
		}
		if (key_jump && global.noisejetpack) || (place_meeting_solid(x + xscale, y) && !place_meeting(x + xscale, y, obj_destructibles)) {
			jetpackdash = 0
			create_particle(x + (xscale * 10), y, particle.bang_effect)
			//jetpackbounce = 0
			
			hsp /= 2
			movespeed = hsp
			vsp = -11
			sprite_index = spr_rockethitwall
			image_index = 0
		}
	}
	if (place_meeting_solid(x + xscale, y) && (!(place_meeting((x + xscale), y, obj_destructibles))))
		movespeed = 0
		

	if (firemouth_afterimage > 0)
		firemouth_afterimage--
	else
	{
		firemouth_afterimage = 8
		create_firemouth_afterimage(x, y, sprite_index, (image_index - 1), xscale)
	}
	if (punch_afterimage > 0)
		punch_afterimage--
	else if sprite_index != spr_rockethitwall
	{
		punch_afterimage = (8 + irandom_range(-4, 2))
		create_heatpuff((x - (xscale * 2)), y)
	}
	if sprite_index == spr_player_jetpackbooststart && floor(image_index) == (image_number - 1)
		sprite_index = spr_player_jetpackdash
	image_speed = 0.35
	exit;
}

