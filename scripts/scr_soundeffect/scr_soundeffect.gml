function scr_soundeffect()
{
	var snd = argument[irandom((argument_count - 1))]
	var snd_id = audio_play_sound(snd, 1, false)
	sfx_gain(snd_id)
	return snd_id
}
function scr_soundeffect_loop()
{
	var snd = argument[irandom((argument_count - 1))]
	var snd_id = audio_play_sound(snd, 1, true)
	sfx_gain(snd_id)
	return snd_id
	
}

function sfx_gain(argument0)
{
	audio_sound_gain(argument0, (audio_sound_get_gain(argument0) * global.option_sfx_volume), 0)
	exit;
}

function scr_soundeffect_at(index, _x, _y, _z, falloff_ref, falloff_max, falloff_factor, loop, priority)
{
	var snd_id = audio_play_sound_at(index, _x, _y, _z, falloff_ref, falloff_max, falloff_factor, loop, priority)
	audio_sound_gain(snd_id, (audio_sound_get_gain(snd_id) * global.option_sfx_volume), 0)
	exit;
}

function scr_soundeffect_3d(index) {
	audio_falloff_set_model(audio_falloff_linear_distance)	
	var snd_id = audio_play_sound_at(index, x, y, 0, 900, 1500, 1, 0, 1)
	sfx_gain(snd_id)
	return snd_id
	
}