function scr_player_cheeseball()
{
	image_speed = 0.35
	

	
	if ((x + hsp) == xprevious)
		stop_buffer--
	else
		stop_buffer = 8
	if (vsp < 0)
		vsp += 0.25
	hsp = (xscale * movespeed)
	if scr_slope()
	{
		var slope = instance_place(x, (y + 1), obj_slope)
		if (sign(slope.image_xscale) == xscale)
		{
			slopejump = 1
			slopejumpx = (slope.x + (slope.image_xscale * 32))
		}
	}
	if (x > (slopejumpx - 10) && x < (slopejumpx + 10) && slopejump == 1 && cheeseballbounce == 0)
	{
		scr_soundeffect(sfx_cheesecling)
		vsp = -12
		cheeseballbounce = 1
		slopejump = 0
	}
	if (grounded && vsp > 0 && cheeseballbounce > 0)
	{
		if (cheeseballbounce == 2)
			vsp = -7
		else if (cheeseballbounce == 1)
			vsp = -6
		else
			vsp = -5
		cheeseballbounce -= 1
		scr_soundeffect(sfx_cheeseland)
		repeat (2)
			create_debris((x + random_range(-8, 8)), (y + 43), spr_cheesechunk)
	}
	if grounded
		movespeed = Approach(movespeed, 12, 0.25)
	sprite_index = spr_cheeseballplayer
	if bump_wall(sign(hsp), 8) && !place_meeting(x + hsp, y, obj_ratblock)
	{
		scr_soundeffect(sfx_cheeseballslam)
		cheeseballbounce = 0
		slopejump = 0
		scr_soundeffect(sfx_groundpound)
		image_index = 0
		movespeed = 0
		cheesepeptimer = 2
		state = states.cheesepepjump
		sprite_index = spr_cheesepepfall
		repeat (8)
			create_debris((x + random_range(-8, 8)), (y + random_range(-8, 8)), spr_cheesechunk)
			
		var myKey1 = get_control_string(global.key_jump)
		scr_controlprompt("[spr_buttonfont]" + myKey1 + "[spr_promptfont]Jump and Stick")
	}
	if key_jump
		input_buffer_jump = 0
	if (grounded && (floor(image_index) % 4) == 0)
		create_debris(x, (y + 43), spr_slimedebris)
	exit;
}

