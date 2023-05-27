function scr_player_ratmountbounce()
{
	image_speed = 0.7
	
	if (sprite_index == spr_player_ratmountbounce)
	{
		move = (key_left + key_right)
		hsp = movespeed
		movespeed = Approach(movespeed, 0, 1)
		if (floor(image_index) == (image_number - 1))
		{
			hsp = movespeed
			vsp = tauntstoredvsp
			sprite_index = spr_player_ratmountwalljump
			vsp = clamp(vsp, -20, -11)
		}
		if (!key_jump2)
		{
			if (hsp != 0)
				xscale = sign(hsp)
			state = states.ratmount
		}
	}
	else
	{
		hsp = movespeed
		move = (key_left + key_right)
		if (move != 0)
			movespeed = Approach(movespeed, (move * 8), 0.5)
		else
			movespeed = Approach(movespeed, 0, 0.5)
		if (key_jump && brick)
		{
			state = states.ratmountgroundpound
			sprite_index = spr_player_ratmountwalljump
			image_index = 0
			image_speed = 0.35
			vsp = -16
			gustavokicktimer = 2
			/*brick = 0
			with (instance_create((x - (xscale * 10)), (y + 60), obj_ratmountgroundpound))
			{
				image_xscale = other.xscale
				image_index = 0
			}
			*/
		}
		ratmount_fallingspeed += 0.5
		if key_jump
			input_buffer_jump = 0
		if (brick && scr_solid((x + sign(hsp)), y) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) or scr_solid_slope((x + sign(hsp)), y)))
		{
			state = states.ratmountclimbwall
			sticktime = 15
			xscale = sign(hsp)
			landAnim = 0
		}
		if (grounded && vsp > 0 && brick)
		{
			tauntstoredvsp = (-((8 + ratmount_fallingspeed)))
			ratmount_fallingspeed = 0
			sprite_index = spr_player_ratmountbounce
			image_index = 0
		}
		if (key_shoot2 && brick)
			ratmount_kickbrick()
		if key_slap2 
			ratmount_guspunch()
	}
	
	ratmount_dotaunt()
	exit;
}

