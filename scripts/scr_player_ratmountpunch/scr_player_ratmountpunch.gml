function scr_player_ratmountpunch()
{
	image_speed = 0.5
	hsp = movespeed
	move = (key_left + key_right)
	landAnim = 0
	sprite_index = spr_lonegustavo_punch
	if (move != 0)
	{
		dir = move
		movespeed = Approach(movespeed, (move * ratmount_movespeed), 0.5)
	}
	else
		movespeed = Approach(movespeed, 0, 0.5)
	ratmountpunchtimer--
	if scr_solid(x + sign(movespeed), y) && !place_meeting(x + hsp, y, obj_slope) && !place_meeting(x + hsp, y, obj_destructibles) {
		movespeed *= -0.8
		create_particle(x, y, particle.bang_effect)
	}
	if ((key_down && grounded && vsp > 0) or scr_solid(x, y))
	{
		state = states.ratmountcrouch
		movespeed *= 1.05
		if (brick == 1)
		{
			with (instance_create(x, y, obj_brickcomeback))
			{
				wait = 1
				instance_create(x, y, obj_genericpoofeffect)
			}
		}
		brick = 0
	}
	
	
	if (ratmountpunchtimer < 0 || (ratmountpunchtimer < 7 && !key_slap))
	{
		state = states.ratmount
		if (hsp != 0)
		{
			dir = sign(hsp)
			xscale = dir
		}
	}
	if (punch_afterimage > 0)
		punch_afterimage--
	else
	{
		punch_afterimage = 5
		 create_mach3effect(x, y, sprite_index, image_index, xscale)
	}
	exit;
}

