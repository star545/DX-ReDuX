
with (obj_player)
{
	if (place_meeting((x + 1), y, other) or place_meeting((x - 1), y, other) or place_meeting(x, (y + 1), other) or place_meeting(x, (y - 1), other))
	{
		with (other)
		{
			if (other.state != states.barrel)
			{
				//if override && other.state != states.hurt other.state = states.normal
				scr_hurtplayer(other, true)
				if fake
					instance_destroy()
			}
			else
			{
				with (other)
				{
					state = states.bump
					sprite_index = spr_bump
					image_index = 0
					hsp = (-6 * xscale)
					vsp = -4
					scr_soundeffect(sfx_loseknight)
					repeat (3)
						create_debris(x, y, spr_wooddebris)
				}
			}
		}
	}
}
