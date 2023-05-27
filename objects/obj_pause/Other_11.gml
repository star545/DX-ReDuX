/// @description Exit Level


	fadein = false
	instance_activate_all()
	var save_arena = false
	if instance_exists(obj_arenamode_controller) && obj_arenamode_controller.player_hp > 0 && !instance_exists(obj_pizzaface) save_arena = true
	trace(global.leveltosave, save_arena)
	scr_flush_texgroups(global.textures_saved)
	if save_arena {
		scr_savescore(global.leveltosave)
		gamesave_async_save()	
	}
	
	global.resetlevel = 0
	scr_playerreset()
	var rm = Realtitlescreen
	if obj_player1.backtohubroom != -4
		rm = obj_player1.backtohubroom
	global.exitlevel = 1
	global.levelreset = 1
	obj_player1.targetDoor = "A"
	if room_exists(rm)
		scr_room_goto(rm)
	else {
		scr_room_goto(tower_1)
			
	}
	obj_pause.state = states.unpaused
	obj_pause.pause_alpha = 0
	obj_player1.state = states.actor
	instance_create(x, y, obj_fakeFade)


/*
if (room == hub_room1 or room == characterselect or room == cowboytask or room == Titlescreen or room == Scootertransition or room == rm_levelselect or string_copy(room_get_name(room), 1, 3) == "hub")
{
	pause = 0
	instance_activate_all()
	room = Realtitlescreen
	with (obj_player1)
	{
		character = "P"
		scr_characterspr()
	}
	scr_playerreset()
	obj_player1.state = states.titlescreen
	obj_player2.state = states.titlescreen
	obj_player1.targetDoor = "A"
	if instance_exists(obj_player2)
		obj_player2.targetDoor = "A"
	global.cowboyhat = 0
	global.coop = false
}
else 
{
	pause = 0
	instance_activate_all()
	scr_playerreset()
	global.levelreset = 1
	obj_player1.targetDoor = "D"
	//obj_player1.state = states.exit_level;
	if instance_exists(obj_player2)
		obj_player2.targetDoor = "D"
	room = rm_levelselect
	alarm[0] = 2
}



