function scr_player_bossdefeat()
{
	hsp = (xscale * movespeed)
	if grounded
		movespeed = Approach(movespeed, 0, 0.5)
	if anim_end() {
		if sprite_index == spr_player_outofpizza1 {
			sprite_index = spr_player_outofpizza2
			image_index = 0
		}
		if sprite_index == spr_player_outofpizza3 {
			sprite_index = spr_player_outofpizza4
			image_index = 0
			dead_timer = 120
			//instance_create(camx - 300, obj_player1.y, obj_taxi_cutscenedead)
			//with obj_arenamode_controller alarm[4] = 60
		}
		
	}
	if sprite_index = spr_player_outofpizza4 {
		dead_timer--
		if dead_timer <= 0 {
			scr_playerreset()
			var rm = Realtitlescreen
			if !(room == Realtitlescreen || room == rm_levelselect)
				rm = rm_levelselect
			if obj_player1.backtohubroom != -4
				rm = obj_player1.backtohubroom
			global.exitlevel = 1
			global.levelreset = 1
			targetDoor = "A"
			if room_exists(rm)
				scr_room_goto(rm)
			else {
				scr_room_goto(tower_1)
			
			}
			obj_player1.state = states.actor
			instance_create(x, y, obj_fakeFade)		
			}
		
	}
	if (grounded && vsp > -1 && sprite_index != spr_player_outofpizza3 && sprite_index != spr_player_outofpizza4)
	{

		//vsp = -6
		movespeed = Approach(movespeed, 0, 3)
		sprite_index = spr_player_outofpizza3
		image_index = 0
		instance_create(x, (y + 43), obj_bangeffect)
		
	}

	if bump_wall(xscale)
	{
		if (sprite_index == spr_slipbanan1)
			movespeed = Approach(movespeed, 0, 3)
		//sprite_index = spr_rockethitwall
		instance_create((x + 30), y, obj_bangeffect)
		xscale *= -1
		scr_sleep(1)
	}
	
	exit;
}

