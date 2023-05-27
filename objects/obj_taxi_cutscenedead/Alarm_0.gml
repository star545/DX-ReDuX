with obj_player {
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
instance_destroy()