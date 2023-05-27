function scr_player_backbreaker()
{
	mach2 = 0
	if (sprite_index != spr_player_machfreefall)
	{
		hsp = 0
		movespeed = 0
	}
	else
		hsp = (xscale * movespeed)
	move = (key_right2 + key_left2)
	landAnim = 0
	if (sprite_index == spr_player_machfreefall && place_meeting(x, (y + 1), obj_solid))
	{
		state = states.machslide
		sprite_index = spr_player_crouchslide
	}
	var supertaunt = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4)
	if sprite_index == spr_player_taunt {
		if image_index == 6 supertaunt = spr_supertaunt1	
		if image_index == 7 supertaunt = spr_supertaunt2	
		if image_index == 9 supertaunt = spr_supertaunt3
		if image_index == 5 supertaunt = spr_supertaunt4
	} else if sprite_index == spr_playerN_taunt {
		if image_index == 0 supertaunt = spr_supertaunt1	
		if image_index == 1 supertaunt = spr_supertaunt2	
		if image_index == 2 supertaunt = spr_supertaunt3
		if image_index == 5 supertaunt = spr_supertaunt4
	} else if sprite_index == spr_pizzelle_taunt {
		supertaunt = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3)
		if image_index == 6 supertaunt = spr_supertaunt1	
		if image_index == 7 supertaunt = spr_supertaunt2	
		if image_index == 5 supertaunt = spr_supertaunt3
	}
	
	
	if (sprite_index == spr_taunt or sprite_index == spr_supertaunt1 or sprite_index == spr_mario_taunt || sprite_index == spr_supertaunt2 or sprite_index == spr_supertaunt3 or sprite_index == spr_supertaunt4 or sprite_index == spr_player_ratmounttaunt || sprite_index == spr_lonegustavo_gunk)
	{
		if ((!instance_exists(parry_inst)) && taunttimer > parry_max)
		{
			parry_inst = instance_create(x, y, obj_parryhitbox)
			var _playerid = 1
			if (object_index == obj_player2)
				_playerid = 2
			with (parry_inst)
			{
				player_id = _playerid
				image_xscale = other.xscale
			}
		}
		if (sprite_index == spr_taunt || sprite_index == spr_mario_taunt) && taunttimer >= 5 && supercharged && key_up {
			var a = get_chardetail("sfx", "taunt")
			var b = get_chardetail("sfx", "supertaunt")
			for (var i = 0; i < array_length(a); i++) audio_stop_sound(a[i])
			scr_soundeffect(b[irandom(array_length(b) - 1)])
			image_index = 0;
			global.combotime = 60
			sprite_index = supertaunt;
			with obj_pizzakinparent {
				sprite_index = spr_intro
				image_index = 0
			}
		
		}	
		if (taunttimer < taunt_to_parry_max)
		{
			if instance_exists(parry_inst)
			{
				instance_destroy(parry_inst)
				parry_inst = noone
			}
		}
		if (supercharged == 1 && (sprite_index == spr_supertaunt1 or sprite_index == spr_supertaunt2 or sprite_index == spr_supertaunt3 or sprite_index == spr_supertaunt4) && (!instance_exists(obj_tauntaftereffectspawner)))
		{
			instance_create(x, y, obj_tauntaftereffectspawner)
			var c = 0
			var lag = 40
			with (obj_baddie)
			{
				if point_in_camera(x, y, view_camera[0]) && object_index != obj_bigcheese
				{
					hp = -99
					elitehit = -99
					state = states.hit
					hitX = x
					hitY = y
					mach3destroy = 1
					hitLag = lag
					//invincible = true
					invtime = lag
					if destroyable
						c++
					instance_create(x, y, obj_parryeffect)
					alarm[3] = 3
					repeat (6) create_baddiedebris()
					shake_cam(3)
				}
			}
			shake_cam(10, 30 / room_speed)
			supercharge = 0
			supercharged = 0
		}
		taunttimer--
		vsp = 0
	}
	if (floor(image_index) == (image_number - 1) && (sprite_index == spr_supertaunt1 or sprite_index == spr_supertaunt2 or sprite_index == spr_supertaunt3 or sprite_index == spr_supertaunt4))
	{
		movespeed = tauntstoredmovespeed
		vsp = tauntstoredvsp
		sprite_index = tauntstoredsprite
		state = tauntstoredstate
		supercharge = 0
		supercharged = 0
		if instance_exists(parry_inst)
		{
			instance_destroy(parry_inst)
			parry_inst = noone
		}
		if (is_array(global.hasfarmer) && global.hasfarmer[farmerpos])
			scr_change_farmers()
	}
	if ((sprite_index == spr_taunt or sprite_index == spr_player_ratmounttaunt || sprite_index == spr_mario_taunt || sprite_index == spr_lonegustavo_gunk) && taunttimer == 0)
	{
		movespeed = tauntstoredmovespeed
		vsp = tauntstoredvsp
		sprite_index = tauntstoredsprite
		state = tauntstoredstate
		if instance_exists(parry_inst)
		{
			instance_destroy(parry_inst)
			parry_inst = -4
		}
		if (is_array(global.hasfarmer) && global.hasfarmer[farmerpos])
			scr_change_farmers()
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_eatspaghetti)
		state = states.normal
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_throw)
		state = states.normal
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_Timesup && place_meeting(x, y, obj_exitgate))
		state = states.normal
	if (floor(image_index) == (image_number - 1) && (sprite_index == spr_player_levelcomplete or sprite_index == spr_playerN_victory))
		state = states.normal
	if (key_jump && sprite_index == spr_player_phoneidle)
	{
		global.panic = true
		sprite_index = spr_bossintro
		image_index = 0
		with (instance_create(x, y, obj_debris))
		{
			image_index = 0
			sprite_index = spr_phonedebris
		}
	}
	if (global.miniboss == true && sprite_index == spr_bossintro && floor(image_index) == (image_number - 1))
		state = states.normal
	image_speed = 0.4
	exit;
}

