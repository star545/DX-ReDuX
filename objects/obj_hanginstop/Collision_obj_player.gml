with (obj_player) {
	grav = 0
	if state == states.hangin {
		scr_soundeffect(sfx_woosh)
		sprite_index = spr_player_hang
		vsp = -10
		if (movespeed < 14)
			{
				movespeed = 14
				hsp = (xscale * movespeed)
			}
		state = states.mach2
	}
}