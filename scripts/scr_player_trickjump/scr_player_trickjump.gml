function scr_player_trickjump()
{
	hsp = (movespeed * xscale)
	/*
	if !did_ramp && !place_meeting(x, y, obj_ramp) {
		did_ramp = true
		vsp = -12
		y -=5
		grounded = false
	}
	*/
	
	if (sprite_index != spr_supertaunt1 && sprite_index != spr_supertaunt2 && sprite_index != spr_supertaunt3 && sprite_index != spr_supertaunt4)
	{
		image_speed = 0.35
		if (sprite_index == spr_trickramp && floor(image_index) == (image_number - 1))
			image_index = (image_number - 1)
		if anim_end() && sprite_index == spr_knightpep_doublejump sprite_index = spr_knightpepfall	
	}
	else
	{
		image_speed = 0.5
		if (floor(image_index) == (image_number - 1))
			sprite_index = spr_trickramp
	}
	if (scr_solid((x + xscale), y) && (!scr_slope()) && (scr_solid_slope((x + sign(hsp)), y) or place_meeting((x + sign(hsp)), y, obj_solid)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
	{
		
		if sprite_index == spr_knightpep_doublejump || sprite_index == spr_knightpepfall {
			movespeed = 0
			vsp = -6
			sprite_index = spr_knightpep_bump
			image_index = floor((image_number - 1))
			state = states.knightpepbump
			scr_soundeffect(sfx_groundpound)
		} else {
			state = states.bump
			image_index = 0
			sprite_index = spr_wallsplat
		}
	}
	if (ramp_buffer > 0)
		ramp_buffer--
	if (grounded && ramp_buffer <= 0)
	{
		image_speed = 0.5
		if (sprite_index == spr_trickramp)
		{
			sprite_index = spr_rollgetup
			if (movespeed < 12)
				state = states.mach2
			else
				state = states.mach3
		}
		else if sprite_index == spr_knightpep_doublejump || sprite_index == spr_knightpepfall {
			state = states.knightpepslopes
			sprite_index = spr_knightpepcharge
			
		}
		else
		{
			ramp_points = 0
			scr_soundeffect(sfx_groundpound)
			state = states.freefallland
			sprite_index = spr_bodyslamland
			image_index = 0
		}
		global.collect += (ramp_points * 100)
		ramp = 0
	}
	exit;
}

