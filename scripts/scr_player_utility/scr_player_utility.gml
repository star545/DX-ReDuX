function do_jumpstop(_div = 2) {
	if !key_jump2 && jumpstop == 0 && vsp < 0.5
	{
		vsp /= _div
		jumpstop = 1
	}
	if (grounded && vsp > 0)
		jumpstop = 0	
	
}




function if_char(char = characters.peppino) {
	if obj_player1.isgustavo char = characters.gus
	return char == obj_player1.character
}
function get_char() {
	var char = obj_player1.character
	if obj_player1.isgustavo char = characters.gus
	return char
}


function bump_wall(dir = hsp, y_check = 16, collide_destroyables = false) {
	var collide_shotgun = true
	if object_index == obj_player1 && character == characters.vigilante collide_shotgun = !place_meeting(x + dir, y, obj_shotgunblock)
	return (place_meeting_collision(x + dir, y, Exclude.SLOPES)) 
	&& (!groundedSlope || (place_meeting_collision(x + sign(dir), y - y_check, Exclude.SLOPES) && !place_meeting_slopeSolid(x + dir, y)))
	&& (!place_meeting(x + dir, y, obj_destructibles) || collide_destroyables)
	&& collide_shotgun;	
	
}

function fake_alarm(reset = 3) {
	static timer = reset
	timer--
	
	if timer <= 0 {
		timer = reset
		return true
	}
	return false
	
}

function scr_dotaunt()
{
	if (key_taunt2 or input_finisher_buffer > 0)
	{
		input_finisher_buffer = 0
		if (!finisher)
		{
			if place_meeting(x, y, obj_exitgate) && global.panic && global.combotime > 0 {
				global.collect += 25
				create_collect(x, y, spr_taunteffectcollect)
				
			}
			
			var a = get_chardetail("sfx", "taunt")
			var b = get_chardetail("sfx", "supertaunt")
			var tnt_snd = scr_soundeffect(a[irandom(array_length(a) - 1)])
			if a[0] == sfx_taunt audio_sound_pitch(tnt_snd, random_range(0.95, 1.05))
			taunttimer = 20
			tauntstoredmovespeed = movespeed
			tauntstoredvsp = vsp
			tauntstoredsprite = sprite_index
			tauntstoredstate = state
			state = states.backbreaker
			with obj_pizzakinparent {
				sprite_index = spr_taunt 
				image_index = irandom(image_number - 1)
				instance_create(x, y, obj_baddietaunteffect)
			}
			with obj_geromefollow {
				sprite_index = spr_gerome_taunt
				image_index = irandom(image_number - 1)
				instance_create(x, y, obj_baddietaunteffect)
			}
			if (supercharged && key_up)
			{
				for (var i = 0; i < array_length(a); i++) audio_stop_sound(a[i])
				scr_soundeffect(b[irandom(array_length(b) - 1)])
				global.combotime = 60
				image_index = 0
				sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4)
				with obj_pizzakinparent {
					sprite_index = spr_intro
					image_index = 0
				}
			}
			else
			{
				taunttimer = 20
				sprite_index = spr_taunt
				if super_mario sprite_index = spr_mario_taunt
				image_index = irandom(image_number - 1)
			}
			with (instance_create(x, y, obj_taunteffect))
				player = other.id
		}
	}
}
function scr_dograb() {
	if key_slap2 && character != characters.snick
    {
		if character != characters.vigilante {
			image_index = 0
			suplexdashsnd = scr_soundeffect(sfx_suplexdash)
			var canShmuppercut = grounded && key_up || key_up && !suplexmove && global.attackstyle != 1
			if canShmuppercut && character != characters.snick {
				state = states.punch
				sprite_index = spr_uppercut
				if grounded
					vsp = -14
				else
					vsp = -10
				movespeed = hsp
				particle_set_scale(particle.highjumpcloud2, xscale, 1)
				create_particle(x, y, particle.highjumpcloud2, 0)	
			} else {
		        if character != characters.snick {
					sprite_index = spr_suplexdash
					state = states.handstandjump
				}
		        if (movespeed < 5)
		            movespeed = 5
		        if (global.attackstyle == 1)
		        {
		            if grounded && character != characters.snick
		                sprite_index = spr_player_attackdash
		            else if character != characters.snick
		                sprite_index = spr_player_airattackstart
		        }
		        else if (global.attackstyle == 2) {
			        if character != characters.snick sprite_index = spr_player_lungestart
					else {
						sprite_index = spr_playerS_mach2jump
						image_speed = 0.35
						state = states.mach2
						grav = 0.5
						}
					if movespeed < 8
						movespeed = 8
					if sprite_index == spr_player_lungestart vsp = 0
					else grav = 0.4
					movespeed = Approach(movespeed, 13, 0.4)
				}
				
			}
			suplexmove = 1
			flash = 1	
		} else {
			if !grounded {
				sprite_index = spr_playerV_airrevolver
				image_index = 0
				vsp = -5
				state = states.revolver
				with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
				{
					is_solid = 0
					pierce = 1
					image_xscale = other.xscale
				}
				scr_soundeffect(sfx_killingblow)
			} else { 
				if (move == 0)
					movespeed = 0
				sprite_index = spr_playerV_revolverstart
				image_index = 0
				state = states.revolver	
				
				
			}
			
			
		}
		
		
    }	
}
function anim_end(frame = (image_number - 1), input = floor(image_index)) {
	return input >= frame
}

function player_in_range(xrange = 80, yrange = 100) {
	var player = instance_nearest(x, y, obj_player)
	return point_in_rectangle(player.x, player.y, x - xrange, y - yrange, x + xrange, y + yrange)	
}
