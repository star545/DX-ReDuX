var cam = new camera_get_position_struct(view_camera[0])
if (timer > 0)
	timer--
else
{
	timer = timer_max
	if (comboscore > 0)
	{
		if (combominus <= 1)
			combominus = 1
		comboscore -= round(combominus)
		if (comboscore < 0)
			comboscore = 0
		var a = get_chardetail("collect")
		create_collect(x + cam.cam_x, y + cam.cam_y, choose(a[irandom(array_length(a) - 1)]));
	}
	else if (alarm[1] == -1)
		alarm[1] = 50
}
title_index += 0.35
if (title_index >= 2)
	title_index = frac(title_index)
if (room == rank_room or room == timesuproom)
	instance_destroy()
