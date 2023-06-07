function scr_player_punch()
{
	var _breakdance = (sprite_index == spr_player_breakdancestart || sprite_index == spr_player_breakdanceloop || sprite_index == spr_player_breakdancesuper || sprite_index == spr_player_buttattack || sprite_index == spr_player_buttattackend || sprite_index == spr_player_buttattackstart)
	if (sprite_index == spr_uppercut or sprite_index == spr_uppercutend)
	{
		move = (key_left + key_right)
		landAnim = 1
		jumpstop = 0
		image_speed = 0.4
		hsp = movespeed
		if (move != 0)
		{
			dir = move
			if (move == -1 && movespeed > -4)
				movespeed -= 0.5
			else if (move == 1 && movespeed < 6) 
				movespeed += 0.5			
		}
		if place_meeting_solid(x + sign(movespeed), y) movespeed = 0
		if (floor(image_index) == (image_number - 1) && sprite_index == spr_uppercut)
			sprite_index = spr_uppercutend
		if (grounded && vsp > 0)
		{
			if (hsp != 0)
			{
				dir = sign(hsp)
				xscale = dir
			}
			movespeed = abs(movespeed)
			state = states.normal
		}
		if (punch_afterimage > 0)
			punch_afterimage--
		else
		{
			punch_afterimage = 5
			create_mach3effect(x, y, sprite_index, image_index, xscale)
		}
		if (global.sidemove == 2 || character == characters.jetpack_noise || character == characters.noise) && !shotgunAnim && !mortGun && key_shoot2 scr_shotgunshoot()
		if global.attackstyle != 2 && character != characters.jetpack_noise && character != characters.noise {
			if move != 0 xscale = move	
			scr_dograb()
			
		}
	}
	else if _breakdance {
		move = (key_left + key_right)
		hsp = (xscale * movespeed)
		if anim_end() {
			if sprite_index == spr_player_breakdancestart sprite_index = spr_player_breakdanceloop
			if sprite_index == spr_player_buttattackstart sprite_index = spr_player_buttattack
		}
		if (movespeed <= 0 && (sprite_index == spr_player_breakdancesuper || sprite_index == spr_player_buttattackend))
            state = states.normal
        if (movespeed > 0 && (sprite_index == spr_player_breakdancesuper || sprite_index == spr_player_buttattackend))
            movespeed -= 0.25	
		if key_down && (sprite_index == spr_player_breakdanceloop || sprite_index == spr_player_breakdancestart) {
			image_index = 0
		    sprite_index = spr_player_breakdancesuper
		    movespeed = 8
			if move != 0 xscale = move
			movespeed = 10
			breakdance = 0
			
		}
		/*if key_up {
			state = states.punch
			sprite_index = spr_player_breakdanceuppercut
			
			vsp = -14
			movespeed = hsp
			particle_set_scale(particle.highjumpcloud2, xscale, 1)
			create_particle(x, y, particle.highjumpcloud2, 0)	
			
		}
		*/
        if (grounded && sprite_index == spr_player_buttattack)
            sprite_index = spr_player_buttattackend

		if bump_wall(sign(hsp))
		{
			if sprite_index == spr_player_breakdancesuper
				xscale *= -1
			else if sprite_index = spr_player_buttattack || sprite_index = spr_player_buttattackstart || sprite_index = spr_player_buttattackend
			{
				vsp = -4
				sprite_index = spr_player_kungfujump
				image_index = 0
				state = states.punch
				movespeed = -6
			} else {
				var _bump = ledge_bump((vsp >= 0 ? 32 : 22))
				if _bump
				{
					state = states.bump
					image_index = 0
					sprite_index = spr_wallsplat
				}
			}
		}	
		if key_shoot2 {
			if sprite_index == spr_player_breakdanceloop || sprite_index == spr_player_breakdancestart {
				image_index = 0
		        sprite_index = spr_player_buttattackstart
		        movespeed = 14
		        vsp = -5	
				breakdance = 0
			}
			else if sprite_index == spr_player_breakdancesuper
				movespeed = 10
		}
		
		
		if (sprite_index == spr_player_breakdancesuper)
            image_speed = (movespeed / 24)
        else
            image_speed = 0.4	
		
		if breakdance > 0
			breakdance--
		else if (sprite_index == spr_player_breakdanceloop || key_attack2) {
			state = states.mach2
			if move != 0
				xscale = move
	        movespeed = abs(hsp)
			sprite_index = spr_mach1
		}
		if (punch_afterimage > 0)
			punch_afterimage--
		else
		{
			punch_afterimage = 5

			create_mach3effect(x, y, sprite_index, image_index, xscale)
		}
		
		
	}
	else
	{
		
				move = (key_left + key_right)
				landAnim = 1
				jumpstop = 0
				image_speed = 0.4
				if (breakdance > 0)
					breakdance--
				if (move != 0)
				{
					if (move != xscale && movespeed > -6)
					{
						if (sprite_index != spr_player_kungfujump)
							movespeed -= 1.1
						else
							movespeed -= 0.2
					}
					else if (move == xscale && movespeed < 6) {
						if (sprite_index != spr_player_kungfujump)
							movespeed += 1.7
						else
							movespeed += 0.5
					}
						
				}
				hsp = (xscale * movespeed)
				var _kungfuground = (sprite_index == spr_player_kungfu1 or sprite_index == spr_player_kungfu2 or sprite_index == spr_player_kungfu3 or sprite_index == spr_shotgunsuplexdash)
				var _kungfuair = (sprite_index == spr_player_kungfuair1transition || sprite_index == spr_player_kungfuair1 || sprite_index == spr_player_kungfuair2transition || sprite_index == spr_player_kungfuair2 || sprite_index == spr_player_kungfuair3transition || sprite_index == spr_player_kungfuair3) 
				var _Sjumpcancel = (sprite_index == spr_player_Sjumpcancel or sprite_index == spr_player_Sjumpcancelland or sprite_index == spr_player_Sjumpcancelslide)
				//if (_kungfuground && image_index > 7 && (!key_attack) && movespeed > 0)
				//	movespeed -= 0.5
				if _kungfuground && (!grounded || key_jump) {
					jumpstop = 0
					sprite_index = choose(spr_player_kungfuair1transition, spr_player_kungfuair2transition, spr_player_kungfuair3transition)
					image_index = 0
					if key_jump && grounded vsp = -11
					if move != 0 xscale = move
					
						
				}
					
				if (floor(image_index) == (image_number - 1))
				{
					switch sprite_index
					{
						case spr_player_kungfu1:
						case spr_player_kungfu2:
						case spr_player_kungfu3:
						case spr_shotgunsuplexdash:
							state = states.mach2
	                        movespeed = abs(hsp)
							sprite_index = spr_mach
							break
						case spr_player_kungfuair1transition:
							sprite_index = spr_player_kungfuair1
							break
						case spr_player_kungfuair2transition:
							sprite_index = spr_player_kungfuair2
							break
						case spr_player_kungfuair3transition:
							sprite_index = spr_player_kungfuair3
							break
						case spr_player_Sjumpcancelland:
							sprite_index = spr_player_Sjumpcancelslide
							break
					}

				}
				if ((!_kungfuground) && (!_Sjumpcancel))
				{
					if (grounded && vsp > 0)
					{
                        state = states.mach2
                        movespeed = abs(hsp)
						sprite_index = spr_mach
					}
					if _kungfuair {
						if kungfu_buffer > 0 {
							kungfu_buffer--	
							// var mv = key_down - key_up
							// vsp = mv * 7
							
						}
						
					}
				}
				if _Sjumpcancel
				{
					if (grounded && vsp > 0)
					{
                        state = states.mach2
                        movespeed = abs(hsp)
						sprite_index = spr_mach
					}
					if (sprite_index == spr_player_Sjumpcancelslide)
						image_speed = (abs(movespeed) / 15)
				}
				if (sprite_index != spr_player_kungfujump && bump_wall(xscale))
				{
					if key_attack2 {
						vsp = -4
						sprite_index = spr_player_kungfujump
						image_index = 0
						state = states.punch
						movespeed = -6
					}
					else state = states.mach3
				}
				if (punch_afterimage > 0)
					punch_afterimage--
				else
				{
					punch_afterimage = 5
	
					create_mach3effect(x, y, sprite_index, image_index, xscale)
				}
				if ((!instance_exists(obj_dashcloud2)) && grounded && movespeed > 5)
				{
					with (instance_create(x, y, obj_dashcloud2))
						image_xscale = other.xscale
				}
	

	}
	exit;
}

