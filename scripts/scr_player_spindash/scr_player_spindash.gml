
function scr_player_spindash(){
	if (punch_afterimage > 0)
		punch_afterimage--
	else
	{
		punch_afterimage = 5
		create_afterimage(x, y, sprite_index, image_index)
	}
	move = (key_right + -key_left)
	if grounded { // Spindash
		// wow i cant believe it! First custom stata..
		//ok ay so time to do this i guess
		sprite_index = spr_playerS_spindash
		image_speed = 0.35
		vsp = 0
		if !audio_is_playing(sfx_spincharge) scr_soundeffect_3d(sfx_spincharge)
		// setting sprite index and image speed
		if animation_end() { // check if animation done
			audio_stop_sound(sfx_spincharge)
			scr_soundeffect_3d(sfx_spinrelease)
			vsp = -5
			if (movespeed) <= (8) movespeed = (10 * move)
			movespeed += (2 * move)
			state = states.mach3
			sprite_index = spr_playerS_crazyrun
		}
	}
	else { // Thok
		scr_soundeffect_3d(sfx_firemouthdash)
		audio_stop_sound(sfx_spincharge)
		vsp = -5
		if (movespeed) <= (4) movespeed = (8.6 * move)
		movespeed += (2.5 * move)
		state = states.mach2
		sprite_index = spr_playerS_spindash
	}
}