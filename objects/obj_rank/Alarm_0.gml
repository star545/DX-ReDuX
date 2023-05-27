var exit_cutscene = global.leveltosave = "exit"
scr_playerreset()
global.levelcomplete = 1
global.exitlevel = 1
with (obj_player)
{
	targetDoor = "A"
	if exit_cutscene room = credits
	else if room_exists(backtohubroom) room = backtohubroom
	
	else room = tower_entrancehall
	global.exit_cutscene = 0
	instance_create(x, y, obj_fakeFade)
	x = -100
	y = -100
	state = states.titlescreen
	image_blend = c_white
}
