image_speed = 0.5


audio_falloff_set_model(audio_falloff_linear_distance)
scr_soundeffect_at(sfx_explosion, x, y, 0, 900, 2000, 1.5, false, 1)
if bbox_in_camera(view_camera[0], 32)
	shake_cam(4)

