function scr_enemy_grabbed()
{
	//var cur_play = asset_get_index(concat("obj_player", grabbedby))
	var my_list = grabbedby.local_grab_list
	var set_to_normal = function() {
		var my_list = grabbedby.local_grab_list
		var cur_pos = ds_list_find_index(my_list, id)
		if cur_pos != -1 ds_list_delete(my_list, cur_pos)
		state = states.stun
		stunned = 200
	}
	depth = 0
	var xPos = 0
	var f = obj_player1
	var player = obj_player1
	image_xscale = (-f.xscale)
	stunned = 200
	var cur_pos = ds_list_find_index(my_list, id)
	if (cur_pos > 0) f = ds_list_find_value(my_list, ds_list_find_index(my_list, id) - 1)
	if (cur_pos == -1) set_to_normal()
	if ((player.state != states.grab && player.state != states.tacklecharge) && player.state != states.grabbing && player.state != states.slam && player.state != states.handstandjump && player.state != states.finishingblow &&  player.state != states.superslam) set_to_normal()
		
	//f.baddiegrabbedID = id
	// Normal Grab anim Pos
	if player.state == states.grabbing || player.state == states.grab || player.state == states.tacklecharge || player.state == states.slam || player.state == states.handstandjump {
		var _y = clamp((player.image_index - 1) * 10, 0, 40)
		x = player.x
		if (player.sprite_index != player.spr_haulingstart) y = f.y - 40
		else y = f.y - _y
		
		if player.sprite_index == player.spr_swingding {
			xPos = player.xscale * (cos(player.image_index - 1) * 50)
			x = (player.x + xPos)
			if (cur_pos > 0) y = f.y - 40
			else y = f.y
			if floor(player.image_index) >= 1 && floor(player.image_index) <= 3 depth = -8
		
			
		}
	}
	if player.state == states.finishingblow {
		x = player.x + (player.xscale * 60)
		if (cur_pos > 0) y = f.y - 40
		else y = f.y	
		
	}
	
	if (player.state == states.superslam)
	{
		if (player.character == characters.peppino)
		{
			if (player.sprite_index != player.spr_piledriverland)
			{	
				xPos = player.xscale * (cos(player.image_index) * 10)
				x = (f.x + xPos)
				if (cur_pos > 0) y = f.y - 40
				else y = f.y
				if floor(player.image_index) >= 5 && floor(player.image_index) <= 7 depth = -8
			}
			else
			{
				x = (player.x + (player.xscale * 10))
				if (cur_pos > 0) y = f.y - 40
				else y = f.y
			}
		}
		else
		{
			depth = -7
			x = player.x
			y = f.y - 40
		}
	}
	if player.sprite_index == player.spr_piledriverland && floor(player.image_index) >= player.image_number - 1 {
		lag = 5
		hitLag = lag
		hitX = x
		hitY = y
		player.hitLag = lag
		player.hitX = player.x
		player.hitY = player.y
		instance_create(player.x, player.y, obj_parryeffect)
		alarm[3] = 3
		if (elitehit > 0)
			elitehit--
		mach3destroy = 1
		kill_throw = 1
		state = states.hit
		image_xscale = (-player.xscale)
		repeat (6) create_baddiedebris()
		shake_cam(3)
		with (player)
		{
			if (state != states.chainsaw)
			{
				tauntstoredmovespeed = movespeed
				tauntstoredhsp = hsp
				tauntstoredsprite = sprite_index
				tauntstoredstate = state
				tauntstoredvsp = vsp
			}
			state = states.chainsaw
			other.hithsp = ((-other.image_xscale) * 8)
			other.hitvsp = -11
		}	
		if cur_pos > 0 {
			hithsp += random_range(-5, 5)	
			hitvsp += random_range(-5, 2)	
		}
		if cur_pos != -1 ds_list_delete(my_list, cur_pos)
		
	}
	/*
	if (f.state == states.grabbing or f.state == states.grab or f.state == states.throwing or f.state == states.slam or f.state == states.tacklecharge)
	{
		var _xxx = clamp(f.image_index * 10, 0, 40)
			
		x = f.x
		if (f.sprite_index != f.spr_haulingstart) y = (f.y - 40)
		else y = f.y - _xxx
		image_xscale = (-f.xscale)
	}
	// Set to stun
		
	with (f)
	{
		suplexhavetomash = (other.hp - 1)
		move = (key_left2 + key_right2)
		if (!((state == states.grab or state == states.chainsaw or state == states.pummel or state == states.finishingblow or state == states.grabbing or state == states.throwing or state == states.slam or state == states.tacklecharge or state == states.punch or state == states.superslam or state == states.backkick or state == states.uppunch or state == states.shoulder)))
		{
			other.x = x
			other.y = y
			other.state = states.stun
			other.image_index = 0
		}
	}
	*/
	hsp = 0
	/*
	if (f.state == states.punch or f.state == states.parry)
	{
		alarm[3] = 3
		global.hit += 1
		if (other.object_index == obj_pizzaball)
			global.golfhit += 1
		instance_create((x + (f.xscale * 30)), y, obj_bumpeffect)
		alarm[1] = 5
		thrown = true
		x = f.x
		vsp = 0
		y = f.y
		state = states.stun
		hsp = ((-image_xscale) * 25)
		grav = 0
		global.combotime = 60
		if (!important)
			global.style += (5 + global.combo)
		repeat (2) create_baddiedebris()
		flash = 1
		with (obj_camera)
		{
			shake_mag = 3
			shake_mag_acc = (3 / room_speed)
		}
	}
	*/
	/*
	if (f.state == states.finishingblow)
	{
		if (floor(f.image_index) < 1 && f.sprite_index == f.spr_swingdingend)
		{
			x = (f.x + (f.xscale * 60))
			y = f.y
		}
		else if (floor(f.image_index) < 4)
		{
			x = (f.x + (f.xscale * 60))
			y = f.y
		}
		check_grabbed_solid(f)
	}
		
	if (f.state == states.superslam or (f.state == states.chainsaw && sprite_index == spr_player_piledriver))
	{
		if (f.character == characters.peppino)
		{
			if (f.sprite_index != f.spr_piledriverland)
			{	
				var xPos = f.xscale * (cos(f.image_index) * 10)
		
				depth = 0
				x = (f.x + xPos)
				y = f.y
					
				check_grabbed_solid(f)
			}
			else
			{
				x = (f.x + (f.xscale * 10))
				y = f.y
				check_grabbed_solid(f)
			}
		}
		else
		{
			depth = -7
			x = f.x
			y = (f.y - 40)
		}
	}
	
	if (f.sprite_index == f.spr_piledriverland && floor(f.image_index) == (f.image_number - 1))
	{
		lag = 5
		hitLag = lag
		hitX = x
		hitY = y
		player.hitLag = lag
		player.hitX = player.x
		player.hitY = player.y
		instance_create(player.x, player.y, obj_parryeffect)
		alarm[3] = 3
		if (elitehit > 0)
			elitehit--
		mach3destroy = 1
		state = states.hit
		image_xscale = (-player.xscale)
		repeat (6) create_baddiedebris()
		with (obj_camera)
		{
			shake_mag = 3
			shake_mag_acc = (3 / room_speed)
		}
		with (player)
		{
			if (state != states.chainsaw)
			{
				tauntstoredmovespeed = movespeed
				tauntstoredsprite = sprite_index
				tauntstoredstate = state
				tauntstoredvsp = vsp
			}
			state = states.chainsaw
			other.hithsp = ((-other.image_xscale) * 8)
			other.hitvsp = -11
		}
	}
	/*
	if (f.state == states.grab && f.sprite_index == f.spr_swingding)
	{
		xPos = f.xscale * (cos(f.image_index - 1) * 50)
		
		depth = 0
		x = (f.x + xPos)
		y = f.y
					
		check_grabbed_solid(f)
	}
	if (state != states.grabbed or f.state != states.grab)
	{
		check_grabbed_solid(f)
		if (state == states.hit)
		{
			hitX = x
			hitY = y
		}
	}
	*/
	if (player.state != states.grab && player.state != states.tacklecharge && player.state != states.handstandjump)
	check_grabbed_solid(player)
	sprite_index = stunfallspr
	image_speed = 0.35
	depth += cur_pos
	exit;
}

function scr_enemy_grabbedTEST() {
	var f = obj_player1
	image_xscale = -f.xscale
	stunned = 200
	
	sprite_index = stunfallspr
	image_speed = 0.35
	exit;
	
}










function check_grabbed_solid(argument0)
{
	if instakilled
		exit;
	var col_line = collision_line(x, y, argument0.x, argument0.y, obj_solid, false, true)
	if !place_meeting(x, y, obj_destructibles) && (place_meeting_collision(x, y) || col_line != -4)
	{
		var _dist = abs((x - obj_player.x))
		x = argument0.x
		y = argument0.y
		if !place_meeting_solid(x + argument0.xscale, y)
		{
			var i = 0
			while !place_meeting_solid(x + argument0.xscale, y)
			{
				x += argument0.xscale
				i++
				if (i > _dist)
					break
				else
					continue
			}
			if place_meeting_solid(x + argument0.xscale, y)
			{
				i = 0
				while !place_meeting_solid(x, y)
				{
					x -= argument0.xscale
					i++
					if (i > _dist)
						break
					else
						continue
				}
			}
		}
		y -= slope_check_up(x, y)
	}
	exit;
}
