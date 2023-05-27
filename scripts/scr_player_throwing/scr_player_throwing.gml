function scr_player_throwing()
{
	hsp = (-xscale * movespeed)
	movespeed = Approach(movespeed, 0, 0.15)
	if anim_end() image_index = 6
	if hsp == 0 state = states.normal
}
