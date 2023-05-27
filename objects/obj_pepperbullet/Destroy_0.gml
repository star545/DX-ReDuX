audio_falloff_set_model(audio_falloff_linear_distance)
scr_soundeffect_at(sfx_collecttopping, x, y, 0, 900, 2000, 1.5, false, 1)
repeat (6)
	create_particle((x + random_range(-25, 25)), (y + random_range(-25, 25)), particle.shotgunimpact, 0)
