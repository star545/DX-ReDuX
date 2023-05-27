function state_player_normal()
{
	mach2 = 0
	move = (key_left + key_right)
	//skateboarding = 0
	momemtum = 0
	jumpstop = 0
	if (dir != xscale)
	{
		dir = xscale
		movespeed = 2
		facehurt = 0
	}
	if key_taunt2
	{
		input_finisher_buffer = 60
		input_attack_buffer = 0
		input_up_buffer = 0
		input_down_buffer = 0
	}
	if key_up
		breakdance_speed = Approach(breakdance_speed, 0.6, 0.005)
	else
		breakdance_speed = 0.25
	if (breakdance_speed >= 0.5)
	{
		if (!instance_exists(obj_beatbox))
		{
			instance_create(x, y, obj_genericpoofeffect)
			with (instance_create(x, y, obj_beatbox))
				vsp = -11
		}
		notecreate--
	}
	if (notecreate <= 0)
	{
		instance_create((x + random_range(-70, 70)), (y + random_range(-70, 70)), obj_notes)
		notecreate = 10
	}
	if place_meeting(x, (y + 1), obj_railparent)
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		railmovespeed = _railinst.movespeed
		raildir = _railinst.dir
		railmomentum = 1
	}
	hsp = ((move * movespeed) + (railmovespeed * raildir))
	if (move != 0)
	{
		xscale = move
		if (movespeed < 8)
			movespeed += 0.5
		else if (floor(movespeed) == 8)
			movespeed = 6
		if (movespeed < 3 && move != 0)
			image_speed = 0.35
		else if (movespeed > 3 && movespeed < 6)
			image_speed = 0.45
		else
			image_speed = 0.6
		if ((!machslideAnim) && (!landAnim) && (!shotgunAnim))
		{
			machslideAnim = 0
			idle = 0
			facehurt = 0
			if shoot
				sprite_index = spr_pistolwalk
			else if mort
				sprite_index = spr_player_mortwalk
			else if key_up
				sprite_index = spr_breakdance
			else if (global.fill <= 0)
				sprite_index = spr_hurtwalk
			else if get_heat_player() == 3
				sprite_index = spr_ragemove	
			else if get_heat_player() == 2
				sprite_index = spr_3hpwalk
			else
				sprite_index = spr_move
		}
		if (scr_solid((x + sign(hsp)), y) && (!(scr_solid_slope((x + sign(hsp)), y))) && xscale == move && (!(place_meeting(x, (y + 1), obj_slope))))
			movespeed = 0
		if ((!steppy) && (floor(image_index == 3) or floor(image_index) == 8))
		{
			create_particle(x, (y + 43), particle.cloudeffect, 0)
			steppy = 1
		}
		if (floor(image_index) != 3 && floor(image_index) != 8)
			steppy = 0
	}
	else
	{
		if (sprite_index == spr_breakdance)
			image_speed = breakdance_speed
		else
			image_speed = 0.35
		movespeed = 0
		if ((!machslideAnim) && (!landAnim) && (!shotgunAnim))
		{
			if (idle < 400 && (!key_up))
				idle++
			if (idle >= 150 && (!key_up))
			{
				if (sprite_index != spr_idle && floor(image_index) == (image_number - 1))
				{
					facehurt = 0
					idle = 0
				}
				if (sprite_index != spr_idle1 && sprite_index != spr_idle2 && sprite_index != spr_idle3 && sprite_index != spr_idle4 && sprite_index != spr_idle5 && sprite_index != spr_idle6)
				{
					idleanim = random_range(0, 100)
					image_index = 0
					if (idleanim <= 16)
						sprite_index = spr_idle1
					else if (idleanim > 16 && idleanim <= 32)
						sprite_index = spr_idle2
					else if (idleanim > 32 && idleanim <= 48)
						sprite_index = spr_idle3
					else if (idleanim > 48 && idleanim <= 64)
						sprite_index = spr_idle4
					else if (idleanim > 64 && idleanim <= 80)
						sprite_index = spr_idle5
					else
						sprite_index = spr_idle6
				}
			}
			else if (!facehurt)
			{
				if (windingAnim < 1800 or angry or global.playerhealth == 1 or shoot)
				{
					start_running = 1
					movespeed = 0
					if shoot
						sprite_index = spr_player_pistolidle
					else if mort
						sprite_index = spr_player_mortidle
					else if key_up
						sprite_index = spr_breakdance
					else if global.fill <= 0
						sprite_index = spr_hurtidle
					else if global.panic
						sprite_index = spr_panic
					else if get_heat_player() == 3
						sprite_index = spr_rageidle
					else if get_heat_player() == 2
						sprite_index = spr_3hpidle
					else
						sprite_index = spr_idle
				}
				else
				{
					idle = 0
					windingAnim--
					sprite_index = spr_winding
					if key_up
						sprite_index = spr_breakdance
				}
			}
			else
			{
				windingAnim = 0
				sprite_index = spr_facehurt
				if key_up
					sprite_index = spr_breakdance
			}
		}
	}
	if (movespeed > 8)
		movespeed -= 0.1
	if landAnim
	{
		if (sprite_index == spr_player_mortland)
		{
			if (floor(image_index) == (image_number - 1))
			{
				landAnim = 0
				sprite_index = spr_player_mortidle
				image_index = 0
			}
		}
		else if (!shotgunAnim)
		{
			if (move == 0)
			{
				movespeed = 0
				sprite_index = spr_land
				if (floor(image_index) == (image_number - 1))
					landAnim = 0
			}
			else
			{
				sprite_index = spr_land2
				if (floor(image_index) == (image_number - 1))
				{
					landAnim = 0
					sprite_index = spr_move
					image_index = 0
				}
			}
		}
		else
		{
			sprite_index = spr_shotgunland
			if (floor(image_index) == (image_number - 1))
			{
				landAnim = 0
				sprite_index = spr_shotgunidle
				if (move != 0)
					sprite_index = spr_shotgunwalk
				image_index = 0
			}
		}
	}
	else if (shotgunAnim && sprite_index != spr_shotgunshoot && (!machslideAnim))
		sprite_index = (move == 0 ? spr_shotgunidle : spr_shotgunwalk)
	if machslideAnim
		sprite_index = spr_machslideend
	if (floor(image_index) == (image_number - 1))
	{
		switch sprite_index
		{
			case spr_machslideend:
				machslideAnim = 0
				sprite_index = spr_idle
				if shotgunAnim
					sprite_index = spr_shotgunidle
				break
			case spr_playerV_revolverend:
				sprite_index = spr_idle
				break
			case spr_shotgunshoot:
				sprite_index = spr_shotgunidle
				break
		}
	}
	if grounded
	{
		if ((key_jump or (input_buffer_jump < 8 && (!key_attack) && vsp > 0)) && (!key_down))
		{
			scr_soundeffect(sfx_jump)
			if (sprite_index != spr_shotgunshoot)
			{
				sprite_index = spr_jump
				if shotgunAnim
					sprite_index = spr_shotgunjump
				image_index = 0
			}
			particle_set_scale(particle.highjumpcloud2, xscale, 1)
			create_particle(x, y, particle.highjumpcloud2, 0)
			vsp = -11
			if global.arena_perks.flight vsp = -16
			state = states.jump
			jumpAnim = 1
			jumpstop = 0
			if place_meeting(x, (y + 1), obj_railparent)
				railmomentum = 1
			freefallstart = 0
		}
		if (key_down or (grounded && vsp > 0 && place_meeting_solid(x, y)))
		{
			if if_char(characters.pizzelle) && groundedSlope {
				movespeed = 6;
				xscale = -(slope_direction());
				state = states.tumble;
				sprite_index = spr_tumblestart
				//scr_sound(sfx_tumble1);	
			} else {
				state = states.crouch
				landAnim = 0
				crouchAnim = 1
				image_index = 0
				idle = 0
			}
		}
	}
	else if (!key_jump)
	{
		if (sprite_index != spr_shotgunshoot)
		{
			if (!shotgunAnim)
				sprite_index = spr_fall
			else
				sprite_index = spr_shotgunfall
			image_index = 0
			jumpAnim = 0
		}
		else
			jumpAnim = 1
		state = states.jump
	}
	if (sprite_index == spr_breakdance && breakdance_speed > 0.4)
	{
		if ((!instance_exists(dashcloudid)) && grounded)
		{
			with (instance_create((x + 25), y, obj_dashcloud))
			{
				image_xscale = other.xscale
				other.dashcloudid = id
			}
		}
		if ((!instance_exists(dashcloudid)) && grounded)
		{
			with (instance_create((x - 25), y, obj_dashcloud))
			{
				image_xscale = (-other.xscale)
				other.dashcloudid = id
			}
		}
	}
	if (key_shoot2)
		scr_shotgunshoot()
	scr_dograb()
	switch character
	{
		default:
			if (key_attack && state != states.handstandjump && !place_meeting_collision(x + xscale, y, Exclude.SLOPES) && (character != characters.vigilante || !place_meeting_collision(x, y - 16)))
			{
				sprite_index = spr_mach1
				image_index = 0
				state = states.mach2
				if character = characters.pizzelle
					state = states.mach1
				if (movespeed < 6)
					movespeed = 6
			}

			break
		case characters.jetpack_noise:
			if (pogochargeactive or pizzapepper > 0)
			{
				if key_attack2
				{
					hsp = 0
					vsp = 0
					image_index = 0
					pogochargeactive = 0
					scr_soundeffect(sfx_noisewoah)
					state = states.Sjump 
					sprite_index = spr_sjumpcancel_start
					if key_up { 
						state = states.Sjumpprep
						sprite_index = spr_superjumpprep
						
					}
				}
			}
			else if (key_attack && (!key_slap2))
			{
				sprite_index = spr_playerN_pogostart
				image_index = 0
				state = states.pogo
			}
			break
	}


	scr_dotaunt()
	if (sprite_index == spr_shotgunshoot)
	{
		landAnim = 0
		machslideAnim = 0
		image_speed = 0.45
	}
	exit;
}

function state_pepperman_normal()
{
	pepperman_grab_reset()
	move = (key_left + key_right)
	if (move != 0 && move == sign(xscale) && movespeed < pepperman_maxhsp_normal)
		movespeed += pepperman_accel
	else if (move != 0 && move != sign(xscale) && movespeed > 0)
		movespeed -= pepperman_deccel
	else if (move == 0)
		movespeed -= pepperman_deccel
	if (floor(movespeed) == pepperman_maxhsp_normal)
		movespeed = pepperman_maxhsp_normal
	if (movespeed > pepperman_maxhsp_normal)
		movespeed -= 0.3
	else if (movespeed < 0)
		movespeed = 0
	if (move != 0 && movespeed == 0)
		xscale = move
	hsp = (xscale * movespeed)
	if (sprite_index != spr_pepperman_throw)
	{
		if (hsp != 0)
			sprite_index = spr_move
		else
			sprite_index = spr_idle
	}
	if ((input_buffer_jump < 8 or key_jump) && grounded && vsp > 0)
	{
		scr_soundeffect(sfx_jump)
		sprite_index = spr_jump
		image_index = 0
		vsp = (-pepperman_jumpspeed)
		state = states.jump
		with (instance_create(x, (y - 5), obj_highjumpcloud2))
			image_xscale = other.xscale
	}
	if ((!grounded) && (!key_jump))
	{
		state = states.jump
		sprite_index = spr_fall
	}
	if (key_attack && ((!(place_meeting((x + xscale), y, obj_solid))) or place_meeting((x + xscale), y, obj_destructibles)) && pepperman_grabID == noone && sprite_index != spr_pepperman_throw)
	{
		if (move != 0)
			xscale = move
		state = states.shoulderbash
		sprite_index = spr_pepperman_shoulderstart
		image_index = 0
		scr_soundeffect(sfx_suplexdash)
	}
	if (sprite_index == spr_pepperman_throw && floor(image_index) == (image_number - 1))
		sprite_index = spr_pepperman_idle
	if (move != 0 && (floor(image_index) == 4 or floor(image_index) == 11) && steppy == 0 && character != "V")
	{
		instance_create(x, (y + 38), obj_cloudeffect)
		steppy = 1
	}
	if (move != 0 && floor(image_index) != 4 && floor(image_index) != 11)
		steppy = 0
	exit;
}

function pepperman_grab_reset()
{
	if (pepperman_grabID != noone)
	{
		if (!instance_exists(pepperman_grabID))
			pepperman_grabID = -4
	}
	exit;
}

function scr_player_normal()
{
	state_player_normal()
	exit;
}
