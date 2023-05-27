if fadein && fadealpha == 1 {
	fadein = false
	instance_activate_all()
	scr_playerreset()
	global.exitlevel = 1
	obj_player1.targetDoor = "A"
	if room_exists(tgtRoom)
		scr_room_goto(tgtRoom)
	else {
		scr_room_goto(tower_1)
			
	}
	obj_pause.state = states.unpaused
	obj_pause.pause_alpha = 0
	obj_player1.state = tgtState
	if tgtRoom = rm_levelselect || tgtRoom = Realtitlescreen
		obj_player1.y = -50
	global.levelreset = true
	//obj_player1.state = states.exit_level
}
if !fadein && fadealpha == 0
	instance_destroy()
fadealpha = Approach(fadealpha, fadein, 0.1)