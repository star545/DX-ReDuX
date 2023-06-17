function scr_player_Sjump()
{
	if (punch_afterimage > 0)
		punch_afterimage--
	else
	{
		punch_afterimage = 5
		create_mach3effect(x, y, sprite_index, image_index, xscale)
	}
	//static sjump_time = 0
	//if prevstate != states.Sjump sjump_time = 0
	
	move = (key_right + key_left)
	hsp = 0
	mach2 = 0
	jumpAnim = 1
	dashAnim = 1
	landAnim = 0
	moveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 0
	machhitAnim = 0
	if sprite_index == spr_superjump || sprite_index == spr_superspringplayer || sprite_index == spr_player_ratmountwalljump {
		vsp = sjumpvsp
		with create_afterimage(x, y, sprite_index, image_index)
		if !instance_exists(obj_crazyrunothereffect) with instance_create(x, y, obj_crazyrunothereffect) image_angle = 90
	}
	sjump_time++
	if !nerfed_sjump
	sjumpvsp -= 0.1
	else 
	if character != characters.snick sjumpvsp += 0.5
	if character == characters.snick && nerfed_sjump sjumpvsp += 0.3
	if (sprite_index == spr_player_supersidejump)
	{
		if (a < 25)
			a++
		hsp = (xscale * a)
		vsp = 0
	}
	if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))))
	{
		pizzapepper = 0
		a = 0
		if (sprite_index == spr_player_supersidejump)
			sprite_index = spr_player_supersidejumpland
		if (sprite_index == spr_superjump or sprite_index == spr_superspringplayer)
			sprite_index = spr_superjumpland
		shake_cam(10, 30 / room_speed)
		with (obj_baddie)
		{
			if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
			{
				image_index = 0
				if grounded
					vsp = -7
			}
		}
		scr_soundeffect(sfx_groundpound)
		image_index = 0
		state = states.Sjumpland
		machhitAnim = 0
	}
	else if ((key_slap2 || key_attack2) && sprite_index != spr_superspringplayer && sprite_index != spr_sjumpcancel_start && sprite_index != spr_player_ratmountwalljump)
	{
		if (move != 0)
			xscale = move
		image_index = 0
		sprite_index = spr_sjumpcancel_start
		if (if_char(characters.noise)) || (global.sjumpstyle == 1) {
			vsp = -5
			movespeed = 12
		
			flash = true;
			jumpstop = true
			image_index = 0
			sprite_index = spr_mach4
			state = states.mach3
			with (instance_create(x, y, obj_crazyruneffect))
				image_xscale = other.xscale	
			
		}
	}
	if (sprite_index == spr_sjumpcancel_start)
	{
		vsp = 0
        if global.sjumpstyle == 2 hsp = 0
        if character = characters.jetpack_noise hsp = 0
        if (move != 0)
            xscale = move
        if (floor(image_index) == (image_number - 1))
        {
            vsp = -5
            jumpstop = true;
            movespeed = 12
            if character == characters.noise || character == characters.jetpack_noise || global.sjumpstyle == 1 || global.sjumpstyle == 2 {
                jetpackin = true
                movespeed = 15
                if launch {
                    launch = 0
                    launched = true
                    launch_buffer = 40
                }
            }
            image_index = 0
            sprite_index = spr_sjumpcancel
            if global.sjumpstyle == 2
                sprite_index = spr_player_supersidejump
			if if_char(characters.pizzelle) || if_char(characters.snick) movespeed = savedmvsp
            state = states.mach3
            with (instance_create(x, y, obj_crazyruneffect))
                image_xscale = other.xscale
		}
	} 
	else if (sprite_index == spr_sjumpcancel_start && global.sjumpstyle == 2) {
		vsp = 0
		if global.sjumpstyle == 2 hsp = 0
		if character = characters.jetpack_noise hsp = 0
		if (move != 0)
			xscale = move
		if (floor(image_index) == (image_number - 1))
		{
			vsp = -5
			jumpstop = true;
			movespeed = 12
			if character == characters.noise || character == characters.jetpack_noise || global.sjumpstyle == 1 || global.sjumpstyle == 2 {
				jetpackin = true
				movespeed = 15
				if launch {
					launch = 0
					launched = true
					launch_buffer = 40
				}
			}
			image_index = 0
			if global.sjumpstyle == 0
				sprite_index = spr_sjumpcancel
			state = states.mach3
			with (instance_create(x, y, obj_crazyruneffect))
				image_xscale = other.xscale
        }
    }
	if sjumpvsp >= -2 && sprite_index != spr_sjumpcancel_start && sprite_index != spr_sjumpcancel {
		state = states.jump
		sprite_index = spr_machfreefall
		jumpstop = true
		jumpAnim = true
	}
	
	if (global.sjumpstyle == 2 && key_jump2 && sprite_index != spr_superspringplayer)
	{
		scr_soundeffect(sfx_jump)
		scr_soundeffect(sfx_woosh)
		jumpstop = 0
		vsp = -15
		state = states.jump
		sprite_index = spr_player_mach2jump
		image_index = 0
		with (instance_create(x, y, obj_jumpdust))
			image_xscale = other.xscale
	}
	
	if (character == characters.jetpack_noise && key_jump2 && sprite_index != spr_superspringplayer)
	{
		scr_soundeffect(sfx_jump)
		scr_soundeffect(sfx_woosh)
		jumpstop = 0
		vsp = -15
		state = states.jump
		sprite_index = spr_playerN_noisebombspinjump
		image_index = 0
		with (instance_create(x, y, obj_jumpdust))
			image_xscale = other.xscale
	}
	if (character == characters.jetpack_noise && sprite_index != spr_sjumpcancel_start && sprite_index != spr_superspringplayer	)
	{
		if (move == 1)
			hsp = 3
		if (move == -1)
			hsp = -3
	}
	
	if (global.sjumpstyle == 2 && sprite_index != spr_sjumpcancel_start && sprite_index != spr_superspringplayer	)
	{
		if (move == 1)
			hsp = 3
		if (move == -1)
			hsp = -3
	}
	
	image_speed = 0.5
	//scr_collision()
	exit;
}

