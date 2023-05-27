if (place_meeting(x, y, obj_player) && image_speed == 0)
{
	audio_falloff_set_model(audio_falloff_linear_distance)
	scr_soundeffect_at(sfx_mine, x, y, 0, 200, 650, 1.5, false, 1)
	image_speed = 0.35
}
if (floor(image_index) == (image_number - 1))
	instance_destroy()
