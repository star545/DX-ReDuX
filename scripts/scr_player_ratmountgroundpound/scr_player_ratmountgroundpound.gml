function scr_player_ratmountgroundpound()
{
	if (sprite_index == spr_player_ratmountgroundpound)
	{
		if (floor(image_index) == (image_number - 1))
			sprite_index = spr_player_ratmountgroundpoundfall
	}
	move = (key_left + key_right)
	//ratmount_movespeed = 8
	if instance_exists(obj_champ_fall) move = 0
	hsp = movespeed
	if (move != 0)
	{
		if (sprite_index == spr_lonegustavo_groundpoundland)
			movespeed = Approach(movespeed, (move * ratmount_movespeed), 0.25)
		else
			movespeed = Approach(movespeed, (move * ratmount_movespeed), 0.5)
	}
	else
		movespeed = Approach(movespeed, 0, 0.5)
	if (freefallsmash >= 10 && (!instance_exists(superslameffectid)))
	{
		with (instance_create(x, y, obj_superslameffect))
		{
			playerid = other.object_index
			other.superslameffectid = id
		}
	}	
	if (sprite_index == spr_lonegustavo_groundpoundstart && floor(image_index) == (image_number - 1))
	{
		image_index = 0
		sprite_index = spr_lonegustavo_groundpound
	}
	if sprite_index != spr_lonegustavo_kick && sprite_index != spr_lonegustavo_groundpoundland {
		if vsp > 0 
			freefallsmash++
		else
			freefallsmash = -4
		if sprite_index != spr_player_ratmountwalljump
			vsp++
		else {
			if (key_jump2 && grounded && brick && vsp > 0) {
				state = states.ratmountbounce
				sprite_index = spr_player_ratmountbounce
				image_index = 0
				tauntstoredvsp = -14
				ratmount_fallingspeed = 0
			}
			if (brick && !grounded && scr_solid((x + sign(hsp)), y) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) or scr_solid_slope((x + sign(hsp)), y))) {
				state = states.ratmountclimbwall
				sticktime = 15
				xscale = sign(hsp)
				landAnim = 0
			}
			if vsp > 0  vsp += 0.5
		}
	
		if (key_shoot2 && brick)
			ratmount_kickbrick()
		if key_slap2 
			ratmount_guspunch()
		var metal_block = (!place_meeting(x, y + vsp, obj_metalblock) && !place_meeting(x, y + vsp + 2, obj_metalblock) && !place_meeting(x, y + 10, obj_metalblock)) || freefallsmash < 10
		if !brick metal_block = true
		if (grounded && vsp > 0 && !scr_meeting_destructibles(,vsp) && !scr_meeting_destructibles(,vsp + 2) && !scr_meeting_destructibles(,10) && metal_block)
		{
			if (key_jump2 && grounded && brick && vsp > 0)
			{
				state = states.ratmountbounce
				sprite_index = spr_player_ratmountbounce
				image_index = 0
				tauntstoredvsp = -14
				ratmount_fallingspeed = 0
			} else {
				if (move != 0)
					movespeed = (xscale * 3)
				scr_soundeffect(sfx_groundpound)
				sprite_index = spr_lonegustavo_groundpoundland
				image_index = 0
				jumpAnim = 1
				jumpstop = 0
				
				if (freefallsmash >= 10)
				{
					with (obj_baddie)
					{
						if (shakestun && grounded && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0 && (!invincible) && groundpound)
						{
							state = states.stun
							if (stunned < 60)
								stunned = 60
							vsp = -11
							image_xscale *= -1
							hsp = 0
							momentum = 0
						}
					}
					shake_cam(10, 30 / room_speed)
					combo = 0
					bounce = 0
				} else shake_cam(5, 15 / room_speed)
				create_particle(x, (y + 3), particle.groundpoundeffect, 0)
			}
		}
	}
	if (sprite_index == spr_lonegustavo_groundpoundland && floor(image_index) == (image_number - 1))
	{
		sprite_index = spr_lonegustavo_idle
		state = states.ratmount
	}
	if ((sprite_index == spr_lonegustavo_kick or sprite_index == spr_lonegustavo_jumpstart) && floor(image_index) == (image_number - 1))
	{
		if (sprite_index == spr_lonegustavo_kick)
			sprite_index = spr_player_ratmountgroundpoundfall
		else
			sprite_index = spr_lonegustavo_jump
		state = states.ratmount
	}
	image_speed = 0.35
	if (punch_afterimage > 0)
		punch_afterimage--
	else
	{
		punch_afterimage = 5
		create_mach3effect(x, y, sprite_index, image_index, xscale)
	}
	exit;
}

