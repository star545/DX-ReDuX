function scr_player_mach3()
{
	if (windingAnim < 2000)
		windingAnim++
		
	if place_meeting(x, (y + 1), obj_railparent)
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		railmovespeed = _railinst.movespeed
		raildir = _railinst.dir
	}
	hsp = ((xscale * movespeed) + (railmovespeed * raildir))
	move_v = (key_down - key_up)
	var noise_check = (character == characters.jetpack_noise || jetpackin || sprite_index == spr_playerN_jetpackboost || sprite_index == spr_player_supersidejump || sprite_index == spr_playerN_jetpackslide)
	if noise_check vsp = (move_v * 5)
	if noise_check && grounded && key_up && !place_meeting_collision(x, y - 1) y--
	if grounded
	{	
		if sprite_index == spr_player_sidesuperjumpcancel || sprite_index == spr_playerS_spindash sprite_index = spr_mach4
		if (scr_slope() && hsp != 0 && movespeed > 10)
			scr_player_addslopemomentum(0.1, 0)
	}
	
	var upto = 20, add = 0.025
	if if_char(characters.noise) || character == characters.vigilante {
		upto = 24
		add = 0.1
	}
	if character == characters.pizzelle {
		upto = 24
		add = 0.05
		
	}
	if red_stew > 0 {
		upto += (red_stew / 180)
		add += (red_stew / 2200) 
	}
	if global.arena_perks.staminup {
		add += 0.01
		upto += 5
	}
	
	if global.cheeseburger >= 1 red_stew = (global.cheeseburger * 2)
	
	var collect_pct = global.collect / 10000
	if global.arena_perks.money upto += collect_pct
	upto = round(upto)
	
	if (move == xscale)
	{
		if (grounded || noise_check) {
			if (movespeed < upto)
			{
				if (mach4mode == 0)
					movespeed += add
				else
					movespeed += 0.1
			}
		}
	} else if movespeed > 12
		movespeed -= 0.1
	mach2 = 100
	momemtum = 1
	move = (key_right + key_left)
	move2 = (key_right2 + key_left2)
	
	if (character == characters.peppino) and jetpackin
	{	
		if grounded {
			jetpackin = false
			sprite_index = spr_mach4
		}
		else {
			sprite_index = spr_player_supersidejump
			if (character == characters.peppino && key_jump2)
			{
				scr_soundeffect(sfx_jump)
				scr_soundeffect(sfx_woosh)
				jetpackin = false
				jumpstop = 0
				vsp = -15
				sprite_index = spr_player_sidesuperjumpcancel
				image_index = 0
				with (instance_create(x, y, obj_jumpdust))
					image_xscale = other.xscale
			}
		}
	}
	
	if (fightball == 1 && global.coop == true)
	{
		if (object_index == obj_player1)
		{
			x = obj_player2.x
			y = obj_player2.y
		}
		if (object_index == obj_player2)
		{
			x = obj_player1.x
			y = obj_player1.y
		}
	}
	
	
	if (sprite_index == spr_crazyrun || (movespeed >= 14 && global.arena_perks.blaze))
	{
		if (flamecloud_buffer > 0)
			flamecloud_buffer--
		else
		{
			
			if global.arena_perks.blaze {
				flamecloud_buffer = 3
				with instance_create(x, y, obj_playerflame)
					image_xscale = other.xscale
			} else {
				flamecloud_buffer = 10
				with (instance_create(x, y, obj_dashcloud))
				{
					image_xscale = other.xscale
					sprite_index = spr_flamecloud
				}	
			}
			
		}
	}
	crouchslideAnim = 1
	if ((!key_jump2) && jumpstop == 0 && vsp < 0.5)
	{
		vsp /= 20
		jumpstop = 1
	}
	
	if (fightball == 0)
	{
		if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
			sprite_index = spr_mach4
		if (floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach))
			sprite_index = spr_mach4
		if (sprite_index != spr_player_sidesuperjumpcancel && movespeed > 16 && sprite_index != spr_crazyrun && sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_taunt && sprite_index != spr_player_supersidejump)
		{
			mach4mode = 1
			flash = 1
			sprite_index = spr_crazyrun
			with (create_debris(x, y, spr_slapstar))
			{
				hsp = random_range(-5, 5)
				vsp = random_range(-10, 10)
			}
		}
		else if (movespeed <= 16 && sprite_index == spr_crazyrun)
			sprite_index = spr_mach4
	}
	if (sprite_index == spr_crazyrun && (!instance_exists(crazyruneffectid)))
	{
		with (instance_create(x, y, obj_crazyrunothereffect))
		{
			playerid = other.object_index
			other.crazyruneffectid = id
		}
	}
	if sprite_index = spr_crazyrun image_speed = 0.75
	else image_speed = 0.4
	if key_jump
		input_buffer_jump = 0
	if !noise_check {
		
		if (grounded && vsp > 0) {
		jumpstop = 0
			if sprite_index = spr_player_Sjumpcancel {
				image_index = 0
				sprite_index = spr_rollgetup
			}
		}
		
		if input_buffer_jump < 8 && sprite_index != spr_mach3jump && grounded && move != -xscale
		{
			scr_soundeffect(sfx_jump)
			if (sprite_index != spr_fightball)
			{
				image_index = 0
				sprite_index = spr_mach3jump
			}
			if (character == characters.peppino)
				vsp = -11
			else
				vsp = -13
			vsp += (0.3 * global.floatyfeather)
		}
		
		if !key_attack && fightball == 0 && !launched && sprite_index != spr_dashpadmach && grounded 
		{
			sprite_index = spr_machslidestart
			scr_soundeffect(sfx_break)
			state = states.machslide
			image_index = 0
			launched = 0
		}
		if (move == (-xscale) && grounded && (!launched) && sprite_index != spr_dashpadmach)
		{
			scr_soundeffect(sfx_machslideboost)
			sprite_index = spr_mach3boost
			state = states.machslide
			image_index = 0
		}
		if (key_down && fightball == 0)
		{
			particle_set_scale(particle.jumpdust, xscale, 1)
			create_particle(x, y, particle.jumpdust, 0)
			flash = 0
			state = states.tumble
			image_index = 0
			vsp = 10
			if (!grounded)
				sprite_index = spr_dive
			else {
				sprite_index = spr_machroll
				if (character == characters.vigilante)
					sprite_index = spr_playerV_divekickstart	
			}
				
		}
	
		if (!grounded && (place_meeting_collision(x + hsp, y, Exclude.SLOPES) || place_meeting_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles)) || (grounded && (place_meeting_collision(x + sign(hsp), y - 16, Exclude.SLOPES) || place_meeting_slope(x + sign(hsp), y - 16)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_metalblock) && groundedSlope)
		{
			wallspeed = movespeed
			//if (vsp > 0 && character = characters.peppino && !skateboarding)
				//wallspeed -= vsp
			state = states.climbwall
		}
		scr_dograb()
		if (key_shoot2) scr_shotgunshoot()
		if (key_up && character != characters.vigilante && fightball == 0 && (grounded || character == characters.snick) && sprite_index != spr_dashpadmach && (!(place_meeting(x, y, obj_dashpad))))
		{
			sprite_index = spr_superjumpprep
			state = states.Sjumpprep
			hsp = 0
			image_index = 0
		}
		
		
	}
	
	
	if (scr_solid((x + sign(hsp)), y) && (!(place_meeting((x + sign(hsp)), y, obj_mach3solid))) && (!scr_slope()) && (scr_solid_slope((x + sign(hsp)), y) || place_meeting((x + sign(hsp)), y, obj_solid)) && (!(place_meeting((x + sign(hsp)), y, obj_metalblock))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_climbablewall))) && (grounded || noise_check))
	{
		var _bump = ledge_bump((vsp >= 0 ? 32 : 22))
		if _bump
		{
			shake_cam(20, 40 / room_speed)
			with (obj_baddie)
			{
				if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
				{
					stun = 1
					alarm[0] = 200
					ministun = 0
					vsp = -5
					hsp = 0
				}
			}
			if (!fightball)
			{
				if sprite_index = spr_player_supersidejump {
					sprite_index = spr_player_supersidejumpland
				}
				else
					sprite_index = spr_hitwall
				scr_soundeffect(sfx_groundpound)
				scr_soundeffect(sfx_bumpwall)
				hsp = 0
				flash = 0
				hsp = (-6 * xscale)
				vsp = -6
				mach2 = 0
				image_index = 0
				if sprite_index = spr_player_supersidejumpland {
					state = states.meteorpep
				}
				else
					state = states.bump
				instance_create((x + 10), (y + 10), obj_bumpeffect)
			}
			else
			{
				fightball = 0
				with (obj_player)
				{
					if sprite_index = spr_player_supersidejump {
						sprite_index = spr_player_supersidejumpland
					}
					else
						sprite_index = spr_hitwall
					hsp = 0
					flash = 0
					hsp = (-6 * xscale)
					vsp = -6
					mach2 = 0
					image_index = 0
					if sprite_index = spr_player_supersidejump {
						state = states.meteorpep
					}
					else
						state = states.bump
						scr_soundeffect(sfx_groundpound)
						scr_soundeffect(sfx_bumpwall)
					instance_create((x + 10), (y + 10), obj_bumpeffect)
				}
			}
		}
	}
	if ((!instance_exists(dashcloudid)) && grounded && (!(place_meeting(x, (y + 1), obj_water))))
	{
		with (instance_create(x, y, obj_superdashcloud))
		{
			if (other.fightball == 1)
				instance_create(obj_player.x, obj_player.y, obj_slapstar)
			image_xscale = other.xscale
			other.dashcloudid = id
		}
	}
	if ((!instance_exists(dashcloudid)) && grounded && place_meeting(x, (y + 1), obj_water))
	{
		with (instance_create(x, y, obj_superdashcloud))
		{
			if (other.fightball == 1)
				instance_create(obj_player.x, obj_player.y, obj_slapstar)
			image_xscale = other.xscale
			sprite_index = spr_watereffect
			other.dashcloudid = id
		}
	}
	scr_dotaunt()
	if (!instance_exists(chargeeffectid))
	{
		with (instance_create(x, y, obj_chargeeffect))
		{
			playerid = other.object_index
			other.chargeeffectid = id
		}
	}
	if sprite_index = spr_playerN_jetpackboost && grounded
		sprite_index = spr_playerN_jetpackslide
	else if sprite_index == spr_playerN_jetpackslide && !grounded
		sprite_index = spr_playerN_jetpackboost
	

	exit;
}

function scr_state_mach3() {
	if if_char(characters.jetpack_noise)
		scr_jetpack_mach3()
	else 
		scr_player_mach3()
	
}


function scr_jetpack_mach3() {
	//grounded = false
	grav = 0
	hsp = xscale * movespeed
	move = key_right + key_left
	move2 = key_down - key_up
	var upto = 24, add = 0.1
	if global.arena_perks.staminup {
		add += 0.01
		upto += 5
	}
	var collect_pct = global.collect / 10000
	if global.arena_perks.money upto += round(collect_pct)	
	scr_player_addslopemomentum(0.2, 0)
	movespeed = Approach(movespeed, move == xscale ? 24 : 12, 0.1)
	vsp = 0
	if key_up vsp = -3
	if key_down vsp = 3

	
	if (movespeed > 16 && sprite_index != spr_crazyrun && sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_taunt)
	{
		mach4mode = 1
		flash = 1
		sprite_index = spr_crazyrun
		with (create_debris(x, y, spr_slapstar))
		{
			hsp = random_range(-5, 5)
			vsp = random_range(-10, 10)
		}
	}
	else if (movespeed <= 16 && sprite_index == spr_crazyrun)
		sprite_index = spr_playerN_jetpackboost
	if key_jump2 && !fightball
	{
		scr_soundeffect(sfx_jump)
		scr_soundeffect(sfx_woosh)
		jumpstop = false
		vsp = -15
		state = states.jump
		sprite_index = spr_playerN_noisebombspinjump
		image_index = 0
		with instance_create(x,y,obj_jumpdust)
			image_xscale = other.xscale
	}	
	if key_down && !fightball && !place_meeting(x,y,obj_dashpad) && grounded
	{
		with instance_create(x, y, obj_jumpdust)
			image_xscale = other.xscale
				
		flash = false
		sprite_index = spr_playerN_jetpackslide
		state = states.machroll
	}
	
	if sprite_index = spr_crazyrun image_speed = 0.75
	else image_speed = 0.4

	if bump_wall(sign(hsp), 24) && !place_meeting(x + hsp, y, obj_metalblock)
	{
		sprite_index = spr_hitwall
		scr_soundeffect(sfx_groundpound)
		scr_soundeffect(sfx_bumpwall)
				
		shake_cam(20, 40 / room_speed)

		hsp = 0
		image_speed = 0.35

		with obj_baddie
		{
			if point_in_camera(x, y, view_camera[0])
			{
				stun = true
				alarm[0] = 200
				ministun = false
				vsp = -5
				hsp = 0
			}
		}

		flash = false

		state = states.bump
		hsp = 2.5 * -xscale
		vsp = -3
		mach2 = 0
		image_index = 0
		instance_create(x + 10 * xscale, y + 10, obj_bumpeffect)
	}
	if key_taunt2 scr_dotaunt()
	if grounded && key_up y -= 5
	// Effects
	if (!instance_exists(chargeeffectid))
	{
		with (instance_create(x, y, obj_chargeeffect))
		{
			playerid = other.object_index
			other.chargeeffectid = id
		}
	}
	
	if ((!instance_exists(dashcloudid)) && grounded && (!(place_meeting(x, (y + 1), obj_water))))
	{
		with (instance_create(x, y, obj_superdashcloud))
		{
			if (other.fightball == 1)
				instance_create(obj_player.x, obj_player.y, obj_slapstar)
			image_xscale = other.xscale
			other.dashcloudid = id
		}
	}
	if ((!instance_exists(dashcloudid)) && grounded && place_meeting(x, (y + 1), obj_water))
	{
		with (instance_create(x, y, obj_superdashcloud))
		{
			if (other.fightball == 1)
				instance_create(obj_player.x, obj_player.y, obj_slapstar)
			image_xscale = other.xscale
			sprite_index = spr_watereffect
			other.dashcloudid = id
		}
	}
	if (sprite_index == spr_crazyrun && (!instance_exists(crazyruneffectid)))
	{
		with (instance_create(x, y, obj_crazyrunothereffect))
		{
			playerid = other.object_index
			other.crazyruneffectid = id
		}
	}
	
	if (sprite_index == spr_crazyrun || (movespeed >= 14 && global.arena_perks.blaze))
	{
		if (flamecloud_buffer > 0)
			flamecloud_buffer--
		else
		{
			
			if global.arena_perks.blaze {
				flamecloud_buffer = 3
				with instance_create(x, y, obj_playerflame)
					image_xscale = other.xscale
			} else {
				flamecloud_buffer = 10
				with (instance_create(x, y, obj_dashcloud))
				{
					image_xscale = other.xscale
					sprite_index = spr_flamecloud
				}	
			}
			
		}
	}
	if key_attack2 && !fightball
	{
		sprite_index = spr_playerN_pogostart
		image_index = 0
		state = states.pogo
		pogospeed = movespeed
	}
	
	
}