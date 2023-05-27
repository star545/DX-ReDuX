with (other)
{
	var current_hspd = abs(hsp)
	var _dir = sign(hsp)
	if (x != other.x)
		_dir = sign((x - other.x))
	else _dir = -_dir	
	image_xscale = _dir
	hsp = (_dir * current_hspd)
	vsp = -8
	parried = true
}
if (!collisioned)
	event_user(0)
