/// @description Restart Level

var roomname = room_get_name(room)
	var rm = -4
	rm = global.leveltorestart
	if (rm != -4 && rm != -1)
	{
		ds_list_clear(global.saveroom)
		ds_list_clear(global.baddieroom)
		instance_activate_all()
		var a = global.death_mode
		var leveltosave = global.leveltosave 
		var leveltorestart = global.leveltorestart
		global.levelreset = 0
		scr_playerreset()
		global.levelreset = 1
		if a { global.death_mode = 1 global.laps = 3 instance_create_unique(x,y, obj_deathmode) }
		if leveltosave != -4 global.leveltosave = leveltosave
		global.leveltorestart = leveltorestart
		state = states.unpaused
		pause_alpha = 0
		obj_player1.targetDoor = "A"
		obj_player1.targetRoom = global.leveltorestart
		if instance_exists(obj_player2)
			obj_player2.targetDoor = "A"
		scr_room_goto(rm)
		instance_create(x, y, obj_fakeFade)
	}
	else
		scr_soundeffect(sfx_enemyprojectile)



