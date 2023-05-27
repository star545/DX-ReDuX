event_inherited()
if (state == states.stun)
{
	if (!(scr_solid(x, y)))
		scr_collision()
	else
	{
		x += hsp
		y += vsp
	}
} else if state != states.underground {
	x += hsp
	y += vsp
}
