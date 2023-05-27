if place_meeting(x, (y - 1), obj_player)
{
	with (obj_player)
	{
		if (state != states.golf && state != states.tackle && state != states.gotoplayer && state != states.trashjump && state != states.trashroll)
		{
			if place_meeting(x, (y + 1), other)
			{
				if (state != states.barrel && state != states.barreljump && state != states.barrelslide && state != states.barrelclimbwall) || room == plage_pizzaboy
				{
					state = states.slipnslide
					sprite_index = other.object_index == obj_iceblock_slip ? spr_slipnslide : spr_currentplayer
					if state != states.slipnslide
					{
						var sound_ = choose(sfx_water1, sfx_water2)
						scr_soundeffect_at(sound_, x, y, 0, 300, 800, 1, false, 1)
					}
				}
				else
				{
					state = states.barrelslide
					if (sprite_index != spr_player_barrelslipnslide)
						sprite_index = spr_player_barrelroll
					var sound_ = choose(sfx_water1, sfx_water2)
					scr_soundeffect_at(sound_, x, y, 0, 300, 800, 1, false, 1)
				}
				if other.object_index != obj_iceblock_slip xscale = sign(other.image_xscale)
				movespeed = other.object_index == obj_iceblock_slip ? 15 : 20
			}
		}
		else
		{
			vsp = -6
			image_index = 0
			var sound_ = choose(sfx_water1, sfx_water2)
			scr_soundeffect_at(sound_, x, y, 0, 300, 800, 1, false, 1)
		}
	}
}
