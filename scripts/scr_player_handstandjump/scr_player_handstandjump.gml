function scr_player_handstandjump()
{	
	if (sprite_index == spr_player_slapdash || sprite_index == spr_player_slaprun1) && (animation_end() || grounded) state = states.mach2
	
	if sprite_index == spr_playerN_spinstart && animation_end() sprite_index = spr_playerN_spin
	if sprite_index == spr_playerN_spin && animation_end() state = states.mach2
	if sprite_index == spr_playerN_spinend && animation_end() state = states.mach2
	
	
	
	if character != characters.snick {
		landAnim = 0
		hsp = (xscale * movespeed)
		move = (key_left + key_right)
		momemtum = 1
		dir = xscale
		var lunge = sprite_index == spr_player_lunge || sprite_index = spr_player_lungestart
		if !lunge {
			if movespeed < 10
				movespeed += 0.5
		}
		else {
			if sprite_index == spr_player_lungestart vsp = 0
			else grav = 0.4
			movespeed = Approach(movespeed, 13, 0.4)
		
		}


		var attackdash = global.attackstyle == 1 ? spr_player_attackdash : spr_suplexdash 
		var airattackdash = global.attackstyle == 1 ? spr_player_airattack : spr_suplexdashjump
		var airattackdashstart = global.attackstyle == 1 ? spr_player_airattackstart : spr_suplexdashjumpstart
		if (sprite_index == spr_player_lungestart && anim_end())
			sprite_index = spr_player_lunge
	
		if (global.attackstyle == 2)
			vsp = 0
		if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
		{
			vsp /= 20
			jumpstop = 1
		}
		if ((key_jump && (!key_down) && (grounded || global.attackstyle == 2)) || (global.attackstyle == 2 && sprite_index == spr_player_lunge && anim_end()))
	    {
	        jumpstop = 0
			if character = characters.pizzelle movespeed = 10
	        image_index = 0
	        if key_jump2
	            vsp = -11
			if global.arena_perks.flight vsp = -15	
	        if (global.attackstyle == 1)
	            if character != characters.snick {
					sprite_index = airattackdashstart
					if (character == characters.noise || character == characters.jetpack_noise) && (sprite_index != spr_playerN_spinstart || sprite_index != spr_playerN_spin) {
						sprite_index = spr_playerN_spinstart
						scr_soundeffect_3d(sfx_Nspin)
						movespeed = movecap(movespeed, 10)
					}
				}
	        else
	        {
	            state = states.mach2
	            sprite_index = spr_player_longjump
				if character != characters.peppino sprite_index = spr_mach2jump
				if character == characters.jetpack_noise {
					sprite_index = spr_playerN_pogostart
					image_index = 0
					state = states.pogo
					pogospeed = movespeed		
				}
	        }
	    }
		if (sprite_index == attackdash && (!grounded))
		{
			image_index = 0
			if character != characters.snick sprite_index = airattackdashstart
				if character == characters.noise || character == characters.jetpack_noise {
						sprite_index = spr_playerN_spinstart
						scr_soundeffect_3d(sfx_Nspin)
						
						movespeed = movecap(movespeed, 10)
					}
		}
		if (grounded && sprite_index == airattackdash && global.attackstyle != 2)
		{
			if (global.attackstyle != 3)
			{
				state = states.normal
				if (move == -xscale)
					movespeed = 2
			}
			else
			{	
				if character != characters.snick {
					sprite_index = attackdash
					image_index = (image_number - 6)
				}
			}
		}
		if (grounded && sprite_index == airattackdash && key_attack && global.attackstyle != 2)
			state = states.mach2
		if (floor(image_index) == (image_number - 1) && sprite_index == attackdash) {
			state = states.normal
		
		}
		if (floor(image_index) == (image_number - 1) && sprite_index == airattackdashstart)
			sprite_index = airattackdash
		if (floor(image_index) == (image_number - 1) && key_attack && (sprite_index == attackdash || sprite_index == spr_player_slapdash || sprite_index == spr_player_slaprun1))
		{
			image_speed = 0.35
			state = states.mach2
			grav = 0.5
		}
		if (key_down && (grounded || global.attackstyle == 2))
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
		mask_index = spr_player_mask
		if bump_wall(hsp) {
			if !grounded {
			
				wallspeed = movespeed
				if wallspeed < 6 wallspeed = 6
				state = states.climbwall
				grabclimbbuffer = 10
			
			
			} else {
				var _ledge = ledge_bump(vsp >= 0 ? 32 : 22)
				if _ledge {
					jumpstop = 1
					state = states.jump
					vsp = -4
					sprite_index = spr_suplexbump
					instance_create((x + (xscale * 10)), (y + 10), obj_bumpeffect)
				}
			
			}
		
		}
	
		/*
		if (((!grounded) && (place_meeting((x + hsp), y, obj_solid) or scr_solid_slope((x + hsp), y)) && (!(place_meeting((x + hsp), y, obj_destructibles)))) or (grounded && (place_meeting((x + sign(hsp)), (y - 16), obj_solid) or scr_solid_slope((x + sign(hsp)), (y - 16))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && scr_slope()))
		{
		
		}
		if ((grounded or (!key_attack)) && scr_solid((x + xscale), y) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) or scr_solid_slope((x + sign(hsp)), y)))
		{
		
		}
		*/
		if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 5)
		{
			with (instance_create(x, y, obj_slidecloud))
				image_xscale = other.xscale
		}
		image_speed = 0.35
		if (state != states.bump && move != xscale && move != 0)
		{
			image_index = 0
			if (!grounded)
			{
				sprite_index = spr_suplexcancel
				jumpAnim = 1
				grav = 0.5
				state = states.jump
			}
			else
			{
				trace("LOL")
				state = states.normal
				movespeed = 2
				grav = 0.5
			}
		}
		if key_slap2 && if_char(characters.pizzelle) {
			sprite_index = spr_faceplant;
			image_index = 0;
			image_speed = 0.2;
			if if_char(characters.peppino) {
				sprite_index = spr_player_charge
				image_speed = 0.35;
			}
			state = states.faceplant;		
			movespeed += 3
		    with (instance_create(x, y, obj_jumpdust))
		        image_xscale = other.xscale;
		
		}
		if key_slap2 && (if_char(characters.noise) || if_char(characters.jetpack_noise)) {
			movespeed = movecap(movespeed, 10)
			if sprite_index != spr_playerN_spinstart && sprite_index != spr_playerN_spin {
				movespeed += 3
				sprite_index = spr_playerN_spinstart;		
				state = states.handstandjump
			}
		    with (instance_create(x, y, obj_jumpdust))
		        image_xscale = other.xscale;
		
		}
		
		if state != states.handstandjump && !ds_list_empty(local_grab_list) {
			state = states.grab
			sprite_index = spr_haulingstart
		}
	
		if key_attack && !fightball && if_char(characters.jetpack_noise)
		{
			sprite_index = spr_playerN_pogostart
			image_index = 0
			state = states.pogo
			pogospeed = movespeed
		}
	}
}
