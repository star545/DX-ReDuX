function scr_player_mach1()
{
	image_speed = 0.5
	landAnim = 0
	machhitAnim = 0
	crouchslideAnim = 1
	dir = xscale
	move = (key_left + key_right)
	if bump_wall(xscale,,true)
	{
		mach2 = 0
		state = states.normal
		movespeed = 0
	}
	if (!(place_meeting(x, (y + 1), obj_railparent)))
		hsp = (xscale * movespeed)
	else
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		hsp = ((xscale * movespeed) + (_railinst.movespeed * _railinst.dir))
	}
	if (xscale != move && move != 0)
	{
		sprite_index = spr_mach1
		image_index = 0
		momemtum = 0
		mach2 = 0
		movespeed = 6
		xscale = move
	}
	if grounded
	{
		if (movespeed <= 8)
			movespeed += 0.075
		if (movespeed >= 8)
		{
			state = states.mach2
			particle_set_scale(particle.jumpdust, xscale, 1)
			create_particle(x, y, particle.jumpdust, 0)
		}
		if (vsp > 0)
			jumpstop = 0
		if (!instance_exists(dashcloudid))
		{
			with (instance_create(x, y, obj_dashcloud))
			{
				image_xscale = other.xscale
				other.dashcloudid = id
			}
		}
		if (sprite_index != spr_mach1 && vsp > 0)
		{
			sprite_index = spr_mach1
			image_index = 0
		}
		if key_jump
		{
			scr_soundeffect(sfx_jump)
			sprite_index = spr_airdash1
			image_index = 0
			dir = xscale
			momemtum = 1
			vsp = -11
			jumpAnim = 1
		}
	}
	else if (sprite_index != spr_airdash1)
		sprite_index = spr_airdash2
	if (sprite_index == spr_airdash1 && floor(image_index) == (image_number - 1))
		sprite_index = spr_airdash2
	if (!key_attack)
	{
		state = states.normal
		image_index = 0
	}
	if ((!key_jump2) && (!jumpstop) && vsp < 0.5)
	{
		vsp /= 20
		jumpstop = 1
	}
	if bump_wall(xscale,,true)
	{
		movespeed = 0
		state = states.normal
	}
	switch character
	{
		case "V":
			if key_slap2
			{
				scr_soundeffect(sfx_killingblow)
				sprite_index = spr_playerV_airrevolver
				image_index = 0
				vsp = -5
				state = states.revolver
				with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
				{
					is_solid = 0
					image_xscale = other.xscale
				}
			}
			if (key_shoot2 && (!instance_exists(dynamite_inst)))
			{
				image_index = 0
				sprite_index = spr_playerV_dynamitethrow
				vsp = -5
				state = states.dynamite
				with (instance_create(x, y, obj_dynamite))
				{
					image_xscale = other.xscale
					movespeed = (other.movespeed + 4)
					vsp = -6
					other.dynamite_inst = id
					playerid = other.id
				}
			}
			break
	}

	if (key_down && (!grounded))
	{
		if (!shotgunAnim)
		{
			sprite_index = spr_bodyslamstart
			image_index = 0
			state = states.freefallprep
			vsp = -5
		}
		else
		{
			sprite_index = spr_player_shotgunjump1
			image_index = 0
			state = states.freefallprep
			vsp = -5
			with (instance_create((x + (xscale * 30)), (y + 60), obj_shotgunbullet))
			{
				sprite_index = spr_bullet_sdown
				spdh = -10
				spd = 0
			}
			with (instance_create((x + (xscale * 30)), (y + 60), obj_shotgunbullet))
			{
				sprite_index = spr_bullet_sdown
				spdh = -10
				spd = 5
			}
			with (instance_create((x + (xscale * 30)), (y + 60), obj_shotgunbullet))
			{
				sprite_index = spr_bullet_sdown
				spdh = -10
				spd = -5
			}
		}
	}
	scr_dotaunt()
	exit;
}

function scr_pizelle_mach1() {
	dir = xscale
	move = (key_left + key_right)
	landAnim = 0
	if scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles)
	{
		mach2 = 0
		state = states.normal
		movespeed = 0
	}
	if (movespeed <= 8)
		movespeed += 0.5;
	machhitAnim = 0
	crouchslideAnim = 1
	if ((!place_meeting(x, (y + 1), obj_railh)) && (!place_meeting(x, (y + 1), obj_railh2)))
		hsp = (xscale * movespeed)
	else if place_meeting(x, (y + 1), obj_railh)
		hsp = ((xscale * movespeed) - 5)
	else if place_meeting(x, (y + 1), obj_railh2)
		hsp = ((xscale * movespeed) + 5)
	if (grounded && xscale == 1 && move == -1)
	{
		momemtum = 0
		mach2 = 0
		movespeed = 0
		image_index = 0
		xscale = -1
	}
	if (grounded && xscale == -1 && move == 1)
	{
		momemtum = 0
		mach2 = 0
		movespeed = 0
		image_index = 0
		xscale = 1
	}
	if grounded
	{
		if (mach2 < 35)
			mach2++
		if (mach2 >= 35)
		{
			//charged = 0;
			movespeed = 10;
			state = states.mach2
			instance_create(x, y, obj_jumpdust)
		}
	}
	sprite_index = spr_mach1
	if (!grounded)
	{
		sprite_index = spr_airdash1
		momemtum = 1
		state = states.jump
		jumpAnim = 0
		image_index = 0
	}
	if ((!key_attack) && grounded)
	{
		state = states.normal
		image_index = 0
		mach2 = 0
	}
	if key_down
	{
			with (instance_create(x, y, obj_jumpdust))
				image_xscale = other.xscale
			movespeed = 12
			crouchslipbuffer = 25
			grav = 0.5
			sprite_index = spr_crouchslip
			image_index = 0
			machhitAnim = 0
			state = states.tumble
	}
	image_speed = 0.45
	if (key_jump && grounded && key_attack)
	{
		scr_soundeffect(sfx_jump)
		sprite_index = spr_airdash1
		dir = xscale
		momemtum = 1
		vsp = -11
		movespeed += 2
		state = states.jump
		jumpAnim = 1
		image_index = 0
	}
	/*
	if (key_slap2 && (!key_down) && suplexmove == 0 && shotgunAnim == 0 && global.cane != 1)
	{
		scr_soundeffect(sound_suplex1)
		instance_create(x, y, obj_slaphitbox);
		suplexmove = 1;
		vsp = 0;
		instance_create(x, y, obj_jumpdust);
		image_index = 0;
		sprite_index = spr_suplexdash;
		state = states.handstandjump;
	}			
	*/
	if ((!instance_exists(obj_dashcloud)) && grounded)
		instance_create(x, y, obj_dashcloud)
	scr_dotaunt()
	/*if key_shoot2
	{
		vsp = -4
		sprite_index = spr_player_pistolair
		state = states.pistol
		image_index = 0
		shoot = 1
	}*/
	scr_dograb()		
	
}
