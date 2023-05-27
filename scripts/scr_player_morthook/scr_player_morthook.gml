function scr_player_morthook()
{
	
	jumpstop = 1
	doublejump = 0
	hsp = 0
	vsp = 0
	if (!instance_exists(morthookID))
	{
		state = states.mortjump
		sprite_index = spr_fall
		exit;
	}
	image_speed = 0.7
	x = Approach(x, morthookID.x, movespeed)
	y = Approach(y, morthookID.y, movespeed)
	if (floor(x) == morthookID.x && floor(y) == morthookID.y)
	{
		if (sprite_index != spr_player_morthook)
		{
			scr_soundeffect(sfx_hookgrab)
			sprite_index = spr_player_morthook
			image_index = 0
		}
		else if (floor(image_index) == (image_number - 1))
		{
			scr_soundeffect(sfx_hookrelease)
			x = morthookID.x
			y = morthookID.y
			state = states.mortjump
			sprite_index = spr_mortdoublejumpstart
			image_index = 0
			vsp = -14
			hsp = (xscale * 12)
		}
	}
	exit;
}

