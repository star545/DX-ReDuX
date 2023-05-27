with (instance_create(x, y, obj_shakeanddie))
	sprite_index = other.sprite_index
audio_falloff_set_model(audio_falloff_linear_distance)

scr_soundeffect_at(sfx_explosion, x, y, 0, 900, 2000, 1.5, false, 1)
scr_soundeffect_at(sfx_groundpound, x, y, 0, 200, 650, 1.5, false, 1)
