with (other)
{
	var current_hspd = abs(hsp)
	var _dir = sign(hsp)
	if (x != other.x)
		_dir = sign((x - other.x))
	image_xscale = _dir
	hsp = (_dir * current_hspd)
	parried = true
}
if (!collisioned)
	event_user(0)
