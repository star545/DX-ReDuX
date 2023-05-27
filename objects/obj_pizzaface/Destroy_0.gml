with (instance_create(x, y, obj_shakeanddie)) {
	sprite_index = spr_pizzaface_dead
	depth = -300	
	if room == rank_room {
		x = clamp(x, 100, 860)
		y = clamp(y, 100, 440)
	}
}
audio_falloff_set_model(audio_falloff_linear_distance)
global.fill += time_in_frames(0, 10)
if instance_exists(obj_arenamode_controller) { 
	obj_arenamode_controller.time += 1000
	obj_arenamode_controller.dead = false
}
scr_soundeffect_at(sfx_explosion, x, y, 0, 900, 2000, 1.5, false, 1)
scr_soundeffect_at(sfx_groundpound, x, y, 0, 200, 650, 1.5, false, 1)
