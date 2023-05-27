with obj_player {
	if place_meeting(x, y + 1, other) && grounded && other.state == states.normal {
		other.state = states.grabbing
		other.squeeze = 30
	}
}
if state == states.grabbing {
	squeeze--
	if squeeze <= 0
	{
		if place_meeting(x, y - 1, obj_player1)
			with obj_player1
				scr_technicaldifficulties()
		state = states.grabbed		
		squeeze = 30
		
	}
	
}
if state = states.grabbed {
	squeeze--
	if place_meeting(x, y - 1, obj_player1)
		scr_hurtplayer(obj_player1)
	if squeeze <= 0
	{
		
		state = states.normal	
		squeeze = 30
		
	}
	
	
}