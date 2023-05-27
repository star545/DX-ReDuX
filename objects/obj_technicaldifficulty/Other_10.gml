with (obj_player) { 
	x = roomstartx
	y = roomstarty
	visible = true
	if (state == states.ghostpossess)
	{	
		state = states.ghost
		sprite_index = spr_ghostidle
	} 


	if (!isgustavo)
		state = states.normal
	else
		state = states.ratmount
	visible = true


	hsp = 0
	vsp = 0
	with (obj_ghostfollow)
	{
		x = xstart
		y = ystart
	}
}