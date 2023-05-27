if (other.state != states.gotoplayer)
{
	if audio_is_playing(sfx_collecttopping)
		audio_stop_sound(sfx_collecttopping)
	scr_soundeffect(sfx_collecttopping)
	with (other)
		if pizzashield < 4
			pizzashield += 1
			obj_tv.barflash = 1
			obj_tv.barblend = c_white
			obj_badhud.barflash = 1
			obj_badhud.barblend = c_white
	instance_destroy()
}
