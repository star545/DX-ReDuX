function scr_shotgunshoot()
{
	scr_getinput()
	if character == characters.vigilante {
		if !instance_exists(dynamite_inst) {
			if (move == 0 && abs(hsp) < 6)
				movespeed = 0
			state = states.dynamite
			sprite_index = spr_playerV_dynamitethrow
			image_index = 0
			with (instance_create(x, y, obj_dynamite))
			{
				image_xscale = other.xscale
				movespeed = abs(other.hsp)
				if movespeed < 6 movespeed = 6
				vsp = -6
				other.dynamite_inst = id
				playerid = other.id
			}
		}
		
		
	}
	else if shotgunAnim
    {
        scr_soundeffect(sfx_killingblow)
        with (instance_create(x, y, obj_pistoleffect))
            image_xscale = other.xscale
        with (instance_create(x, y, obj_pistoleffect)) {
            image_xscale = other.xscale
			sprite_index = spr_shotgun_shot
		}
        sprite_index = spr_shotgunshoot
        if (!grounded)
            vsp = -4
		raildir = -xscale
		railmovespeed = abs(hsp) + 4
		if state == states.normal || state == states.jump  {
			movespeed = 2
			hsp = 2
			railmovespeed = 6
		}
		
		
        state = states.shotgunshoot
        jumpAnim = 1
        image_index = 0
        with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
        {
            image_xscale = other.xscale
            shotgun = 1
        }
        with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
        {
            image_xscale = other.xscale
            spdh = 4
            shotgun = 1
        }
        with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
        {
            image_xscale = other.xscale
            spdh = 2
            shotgun = 1
        }
		 with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunhitbox)) {
			create_particle(x, y, particle.genericpoofeffect)
            image_xscale = other.xscale
		 }

        with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
        {
            image_xscale = other.xscale
            spdh = -4
            shotgun = 1
        }
        with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
        {
            image_xscale = other.xscale
            spdh = -2
            shotgun = 1
        }
    }
	else if mortGun {
		state = states.mortshoot
		sprite_index = spr_mortthrow
		image_index = 0
	}
    else if global.sidemove == 0
    {
		var mv = key_down - key_up
        scr_soundeffect(sfx_suplexdash)
        if (movespeed < 9)
            movespeed = 9
		movespeed += 1
		kungfu_buffer = 5
		//if mv != 0 && global.arena_perks.final == 2 vsp = mv * 5
        state = states.punch
        image_index = 0
        if grounded
            sprite_index = choose(spr_player_kungfu1, spr_player_kungfu2, spr_player_kungfu3)
        else
            sprite_index = choose(spr_player_kungfuair1transition, spr_player_kungfuair2transition, spr_player_kungfuair3transition)
    }
	else if global.sidemove == 1 {
		if key_up && global.bullet > 0 {
			if (!is_hub() || global.panic) && !global.cheat_infammo {
				if global.ammobox >= 1 && !chance((global.ammobox * 5)) global.bullet--
				else if global.ammobox <= 0 global.bullet--
			}
			if character != characters.noise && character != characters.jetpack_noise {
				image_index = 0
				sprite_index = spr_player_pistolshot
				state = states.shotgunshoot
				if true == true {
					with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
			        {
			            image_xscale = other.xscale
			            shotgun = 1
			        }
			        with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
			        {
			            image_xscale = other.xscale
			            spdh = 4
			            shotgun = 1
			        }
			        with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
			        {
			            image_xscale = other.xscale
			            spdh = 2
			            shotgun = 1
			        }
					 with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunhitbox)) {
						create_particle(x, y, particle.genericpoofeffect)
			            image_xscale = other.xscale
					 }

			        with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
			        {
			            image_xscale = other.xscale
			            spdh = -4
			            shotgun = 1
			        }
			        with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
			        {
			            image_xscale = other.xscale
			            spdh = -2
			            shotgun = 1
			        }
				} else {
					with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
			        {
			            image_xscale = other.xscale
						sprite_index = spr_peppinobullet
			            spdh = 2
			            pistol = 1
			        }
				}
			}
			else {
				image_index = 0
				sprite_index = spr_playerN_noisebombkick
				state = states.shotgunshoot
				with (instance_create(x, y, obj_playerbomb))
					{
						kick = 1
						movespeed = 15
						image_xscale = other.xscale
					}
			}
		}
		else if global.fuel > 0 {
			if !grounded {
				state = states.chainsawpogo
				movespeed = hsp
				sprite_index = spr_player_chainsawspin
			} else if global.fuel > 0 {
				if (!is_hub() || global.panic) && !global.cheat_infammo {
					if global.ammobox >= 1 && !chance((global.ammobox * 5)) global.fuel--
					else global.ammobox = 0 global.fuel--
				}
				scr_soundeffect(sfx_suplexdash)
		        if (movespeed < 9)
		            movespeed = 9
				state = states.chainsawbump
				image_index = 0
				sprite_index = spr_player_chainsawdashstart
			}
		}
	}
	else if global.sidemove == 2 {
		if key_down {
		} else {
			scr_soundeffect(sfx_breakdance)	
			movespeed = 9
			if move != 0 
				xscale = move
			state = states.punch
			sprite_index = spr_player_breakdancestart
		    with (instance_create(x, y, obj_dashcloud2))
		        image_xscale = other.xscale
			breakdance = 35
			image_index = 0	
		}
	}
    return;
}

