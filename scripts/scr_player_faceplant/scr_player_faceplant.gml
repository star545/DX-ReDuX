function scr_player_faceplant()
{
	hsp = (xscale * movespeed)
	move = (key_right + key_left)
	if movespeed < 10 movespeed = Approach(movespeed, 10, grounded ? 0.5 : 10)

	if bump_wall(sign(hsp))
	{
		sprite_index = spr_hitwall
		scr_soundeffect(sfx_groundpound)
		scr_soundeffect(sfx_bumpwall)
		with (obj_camera)
		{
			shake_mag = 20
			shake_mag_acc = (40 / room_speed)
		}
		hsp = 0
		image_speed = 0.35
		with (obj_baddie)
		{
			if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded)
			{
				stun = 1
				alarm[0] = 200
				ministun = 0
				vsp = -5
				hsp = 0
			}
		}
		flash = 0
		state = states.bump
		hsp = -2.5
		vsp = -3
		mach2 = 0
		image_index = 0
		instance_create((x + 10), (y + 10), obj_bumpeffect)
	}
	static bufferslap = 0;
	if key_slap2
	    bufferslap = 0
	else if (bufferslap < 10)
	    bufferslap++	
	if anim_end()
	{
		if key_attack {
		
			state = states.mach2
			sprite_index = spr_player_mach;

		} else if !key_attack && bufferslap >= 8 {
			image_speed = 0.35;
			state = states.normal;
			grav = 0.5;
		} else if !key_attack && bufferslap < 8 {
			sprite_index = spr_faceplant;
			image_index = 0;
			with (instance_create(x, y, obj_jumpdust))
				image_xscale = other.xscale		
		}

	}
	image_speed = 0.35
	if (key_down && grounded && vsp > 0)
	{
		grav = 0.5
		sprite_index = spr_crouchslip
		machhitAnim = 0
		state = states.crouchslide
		movespeed = 15
	}
	if ((!instance_exists(obj_dashcloud2)) && grounded && movespeed > 5)
	{
		with (instance_create(x, y, obj_dashcloud2))
			image_xscale = other.xscale
	}
	exit;
}

