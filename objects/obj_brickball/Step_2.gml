if obj_player1.state != states.chainsaw {
	scr_collision()
	if place_meeting_collision(x, y) instance_destroy()
	image_speed = 0.5	
}
else {
	image_speed = 0
	
}
