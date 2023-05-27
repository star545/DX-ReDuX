if other.state == states.ghost {
	other.ghost_pepper++
	instance_destroy()
	if audio_is_playing(sfx_collecttopping)
		audio_stop_sound(sfx_collecttopping)
	scr_soundeffect(sfx_collecttopping)
	global.combotime += 10
	global.combotime = clamp(global.combotime, 0, 60)
}