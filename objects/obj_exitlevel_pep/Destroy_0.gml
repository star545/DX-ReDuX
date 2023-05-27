with obj_player1 {
	y = backtohubstarty
	while (place_meeting_collision(x, y))
		y--
	state = states.normal
		

	sprite_index = spr_bodyslamland


	image_index = 0
	jumpAnim = 1
	jumpstop = 0
	visible = true
		
}
