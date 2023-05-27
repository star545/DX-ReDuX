/// @description Back to Levels
scr_playerreset()
global.levelcomplete = 1
global.exitlevel = 1
with (obj_player)
{
	targetDoor = "A"
	if room_exists(backtohubroom)
	room = backtohubroom
	else 
		room = rm_levelselect
	instance_create(x, y, obj_fakeFade)
	x = -100
	y = -100
	state = states.titlescreen
	image_blend = c_white
}
