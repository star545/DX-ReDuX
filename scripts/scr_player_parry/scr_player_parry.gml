function scr_player_parry()
{
	if (image_index > (image_number - 1))
	{
		state = states.normal
		if tauntstoredisgustavo
			state = states.ratmount
	}
	if (!audio_is_playing(sfx_parry))
		scr_soundeffect(sfx_parry)
	hsp = ((-xscale) * movespeed)
	image_speed = 0.5
	if (movespeed > 0)
		movespeed -= 0.5
	var _grabbedby = 1
	if (object_index == obj_player2)
		_grabbedby = 2
	if (parry_count > 0)
	{
		parry_count--
		var parry_threshold = 96
		with obj_pizzacutter2 if distance_to_object(other) < parry_threshold instance_destroy()
		with obj_fakepeppino {
			if (distance_to_object(other) < parry_threshold && state == states.normal) {
				state = states.timesup
				appeartimer = 400
			    image_speed = 0.35
			    image_index = 0
			    sprite_index = spr_pepclone_death
			    ds_queue_clear(followqueue)	
			}
			
		}
		
		with (obj_baddie)
		{
			if (distance_to_object(other) < parry_threshold && state != states.hit && state != states.grabbed && state != states.stun && parryable && (!((state == states.stun && thrown == true))))
			{
				notification_push(notification_type.unknown_value1, [id, object_index, room])
				obj_player1.xscale = (-image_xscale)
				grabbedby = _grabbedby
				elitehit = 0
				hp = 0
				kill_throw = 1
				lunge_throw = 1
				thrown = 1
				linethrown = 1
				var lag = 5
				hitLag = lag
				hitX = x
				hitY = y 
				if (!important)
				{
					global.combotime = 60
					global.heattime = 60
				}
				obj_player1.hitLag = lag
				obj_player1.hitX = obj_player1.x
				obj_player1.hitY = obj_player1.y
				mach3destroy = 1
				instance_create(x, y, obj_parryeffect)
				alarm[3] = 1
				state = states.hit
				image_xscale = (-obj_player1.xscale)
				repeat (6) create_baddiedebris()
				shake_cam(3)
				stunned = 100
				hithsp = -image_xscale * 25
				//other.hsp = ((-other.image_xscale) * 25)
			}
		}
		with (obj_pizzaface)
		{
			var _dir = sign(other.x - x)
			if (distance_to_object(other) < parry_threshold && state != states.hit && state != states.grabbed && state != states.stun && global.cheat_pizzagooch && parryable && (!((state == states.stun && thrown == true))))
			{
				//notification_push(notification_type.unknown_value1, [id, object_index, room])
				//var _dir = face_obj(other)
				if _dir != 0 xscale = (-_dir)
				grabbedby = _grabbedby
				//elitehit = 0
				//hp = 0
				//kill_throw = 1
				//lunge_throw = 1
				//thrown = 1
				//linethrown = 1
				fake_thrown = 1
				var lag = 5
				hitLag = lag
				hitX = x
				hitY = y 
				if (!important)
				{
					global.combotime = 60
					global.heattime = 60
				}
				//obj_player1.hitLag = lag
				//obj_player1.hitX = obj_player1.x
				//obj_player1.hitY = obj_player1.y
				//mach3destroy = 1
				instance_create(x, y, obj_parryeffect)
				alarm[3] = 1
				state = states.hit
				image_xscale = (-obj_player1.xscale)
				repeat (6) create_baddiedebris()
				shake_cam(3)
				stunned = 100
				hithsp = -image_xscale * 6
				hitvsp = -6
				//other.hsp = ((-other.image_xscale) * 25)
			}
		}
	}
}
