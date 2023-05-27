with obj_player1
{
	if !place_meeting(x, y, obj_gravityrect)
		gravmult = 1;
	else if place_meeting(x, y, other)
		gravmult = other.grav;
	
	if gravmult != 0
		yscale = sign(gravmult);
}