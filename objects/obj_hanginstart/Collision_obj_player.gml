with (obj_player) {
	if state != states.hangin {
		state = states.hangin
		sprite_index = spr_player_hangslide
		y = other.y
		storedvsp = 0
		vsp = 0
		image_xscale = other.image_xscale
		hsp = clamp(movespeed, 12, 30) * other.image_xscale
		image_xscale = other.image_xscale
		scr_soundeffect(sfx_woosh)
	}
}