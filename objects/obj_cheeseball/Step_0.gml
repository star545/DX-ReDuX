if ((x + hsp) == xprevious)
	stop_buffer--
else
	stop_buffer = 8
hsp = (image_xscale * movespeed)
if (grounded && vsp > 0)
{
	audio_falloff_set_model(audio_falloff_linear_distance)
	scr_soundeffect_at(sfx_cheeseland, x, y, 0, 300, 900, 1.5, false, 1)
	bouncedestroy -= 1
	bouncevsp += 1
	vsp = bouncevsp
	movespeed -= 1
	repeat (2)
	{
		if bbox_in_camera(view_camera[0], 10)
			create_debris((x + random_range(-8, 8)), (y + 43), spr_cheesechunk)
	}
}
if (((!scr_slope()) && instance_place((x + sign(hsp)), y, obj_solid)) or bouncedestroy == 0)
{
	repeat (8)
	{
		if bbox_in_camera(view_camera[0], 10)
			create_debris((x + random_range(-8, 8)), (y + random_range(-8, 8)), spr_cheesechunk)
	}
	instance_destroy()
}
scr_collision()

	#region CHEESY BALL SOUNDS
	
	
	if (!audio_is_playing(sfx_cheeseballroll) && grounded)
	{
		scr_soundeffect_3d(sfx_cheeseballroll)
	}
	else if (audio_is_playing(sfx_cheeseballroll) && !grounded)
	{
		audio_stop_sound(sfx_cheeseballroll)
	}
	
	
	#endregion