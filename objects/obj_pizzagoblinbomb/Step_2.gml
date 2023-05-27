if state == states.grabbed {
	grounded = false
	x = playerid.x
	y = (playerid.y - 40)
	image_xscale = playerid.xscale
	if (playerid.state != states.bombgrab && playerid.state != states.superslam)
		state = states.normal
	if (playerid.state == states.superslam)
	{
		if playerid.grounded
			instance_destroy()
	}	
}