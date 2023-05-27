function scr_player_ratmounttrickjump()
{
	hsp = (movespeed * xscale)
	/*
	if !did_ramp && !place_meeting(x, y, obj_ramp) {
		did_ramp = true
		vsp = -12
	}
	*/
	if (sprite_index != spr_supertaunt1)
		image_speed = 0.35
	else
	{
		image_speed = 0.5
		if (floor(image_index) == (image_number - 1))
			sprite_index = spr_player_ratmountwalljump
	}
	if (ramp_buffer > 0)
		ramp_buffer--
	if (grounded && ramp_buffer <= 0)
	{
		if (sprite_index = spr_player_ratmountwalljump)
		{

				state = states.ratmount
		}
		else
		{
			ramp_points = 0
			scr_soundeffect(sfx_groundpound)
			state = states.ratmount
			sprite_index = spr_player_ratmountland
			image_index = 0
			landAnim = 1
		}
		global.collect += (ramp_points * 100)
		ramp = 0
	}
	exit;
}

