function scr_player_tumble()
{
	if place_meeting(x, (y + 1), obj_railparent)
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		railmovespeed = _railinst.movespeed
		raildir = _railinst.dir
	}
	if grounded && scr_slope() && sprite_index != spr_tumblestart
		scr_player_addslopemomentum(0.25, 1)
	if grounded && !groundedSlope && sprite_index = spr_crouchslip && character == characters.pizzelle
		movespeed -= 0.2
	hsp = ((xscale * movespeed) + (railmovespeed * raildir))
	move = (key_right + key_left)
	mask_index = spr_crouchmask
	if (sprite_index == spr_tumblestart)
		movespeed = 6
	if hsp != 0
		xscale = sign(hsp)
	if ((!grounded) && (sprite_index == spr_machroll or sprite_index == spr_mach2jump or sprite_index == spr_player_backslide or sprite_index == spr_player_backslideland || sprite_index == spr_playerV_divekickstart))
	{
		vsp = 10
		sprite_index = spr_dive
	}
	if (grounded && sprite_index == spr_dive)
	{
		sprite_index = spr_machroll
		image_index = 0
	}
	if (sprite_index == spr_dive && key_jump)
	{
		if (character == characters.peppino) {
			sprite_index = spr_bombdrop1
		}
		else {
			sprite_index = spr_bodyslamstart
		}
		image_index = 0
		state = states.freefall
		vsp = -6
	}
	if (movespeed <= 2 && !scr_slope() && sprite_index != spr_player_breakdance)
		state = states.normal
	if ((!scr_slope()) && sprite_index == spr_tumblestart && floor(image_index) < 11)
		image_index = 11
	if (sprite_index == spr_mach2jump && grounded)
	{
		image_index = 0
		sprite_index = spr_machroll
	}
	if (sprite_index == spr_crouchslip && (!grounded))
		sprite_index = spr_player_jumpdive2
	if (sprite_index == spr_player_Sjumpcancelland && floor(image_index) == (image_number - 1))
		sprite_index = spr_player_Sjumpcancelslide
	if (sprite_index == spr_player_jumpdive2 && grounded)
		sprite_index = spr_crouchslip

	if anim_end() && sprite_index == spr_player_machroll {
		sprite_index = spr_player_backslideland
		image_index = 0
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_backslideland)
		sprite_index = spr_player_backslide
	if (sprite_index == spr_player_Sjumpcancel && grounded)
		sprite_index = spr_player_Sjumpcancelland
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_Sjumpcancelland)
		sprite_index = spr_player_Sjumpcancelslide
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_breakdance)
	{
		particle_set_scale(particle.jumpdust, xscale, 1)
		create_particle(x, y, particle.jumpdust, 0)
		movespeed = 12
		sprite_index = spr_breakdancesuper
	}
	if (sprite_index == spr_tumblestart && floor(image_index) == (image_number - 1))
	{
		sprite_index = spr_tumble
		movespeed = 14
	}
	if bump_wall(sign(hsp), 24) {
		hsp = 0
		movespeed = 0
		
		if sprite_index != spr_tumble {
			scr_soundeffect(sfx_bumpwall)
			state = states.bump
			image_index = 0
			sprite_index = spr_wallsplat
			image_index = 0
		} else {
			scr_soundeffect(sfx_bumpwall)
			vsp = -4
			hsp = (-3 * xscale)
			state = states.bump
			sprite_index = spr_tumbleend
			image_index = 0	
			
		}
		
		
	}
	if key_jump
		input_buffer_jump = 0
	if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 2
		jumpstop = 1
	}
	if (grounded && vsp > 0 && (!(place_meeting(x, y, obj_bigcheese))))
		jumpstop = 0
	if (input_buffer_jump < 8 && grounded && hsp != 0 && sprite_index == spr_tumble)
	{
		with (instance_create(x, y, obj_highjumpcloud2))
			image_xscale = other.xscale
		vsp = -11
		image_index = 0
	}
	if (crouchslipbuffer > 0)
		crouchslipbuffer--
	if sprite_index != spr_tumble && sprite_index != spr_tumblestart && grounded && !key_down && !place_meeting_collision(x, y - 16) && !place_meeting_collision(x, y - 32) && crouchslipbuffer <= 0 && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_destructibles) {
		with (instance_create(x, y, obj_jumpdust))
			image_xscale = other.xscale
		state = states.mach2
		image_index = 0
		sprite_index = spr_rollgetup
		if character == characters.jetpack_noise {

			sprite_index = spr_playerN_pogostart
			image_index = 0
			state = states.pogo
			pogospeed = movespeed
	
			
		}	
		if movespeed < 6 {
			state = states.normal
			sprite_index = spr_idle	
		}
		
	}
	if anim_end() && sprite_index == spr_playerV_divekickstart sprite_index = spr_playerV_divekick
	/*
	if ((!key_down) && key_attack && grounded && sprite_index != spr_tumble && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))) && sprite_index != spr_player_breakdance)
	{
		if (crouchslipbuffer == 0)
		{
			with (instance_create(x, y, obj_jumpdust))
				image_xscale = other.xscale
			if (movespeed >= 12)
				state = states.mach3
			else
				state = states.mach2
			image_index = 0
			sprite_index = spr_rollgetup
		}
	}
	if ((!key_down) && (!key_attack) && grounded && sprite_index != spr_tumble && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))) && sprite_index != spr_player_breakdance)
	{
		if (crouchslipbuffer == 0)
		{
			if (movespeed > 6)
			{
				state = states.machslide
				sprite_index = spr_machslidestart
				image_index = 0
			}
			else
				state = states.normal
		}
	}
	*/
	if (sprite_index == spr_player_Sjumpcancelslide or sprite_index == spr_breakdancesuper or sprite_index == spr_machroll or sprite_index == spr_tumble or sprite_index == spr_tumblestart or sprite_index == spr_machroll || sprite_index == spr_mach2jump)
		image_speed = (abs(movespeed) / 15)
	else if (floor(image_index) == (image_number - 1) && sprite_index == spr_mach2jump)
		image_speed = 0
	else if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_Sjumpcancel)
		image_speed = 0
	else
		image_speed = 0.35
	if ((!instance_exists(dashcloudid)) && grounded)
	{
		with (instance_create(x, y, obj_dashcloud))
		{
			image_xscale = other.xscale
			other.dashcloudid = id
		}
	}
	exit;
}

