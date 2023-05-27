state++
if (state == 1)
{
	if oktoberfest scr_soundeffect(sfx_scream10)
	else if threedee scr_soundeffect(sfx_jumpscare)
	else scr_soundeffect(sfx_scream1, sfx_scream7, sfx_scream4)
	if !threedee alarm[0] = 100
}
else if (state == 2)
	alarm[1] = 30
