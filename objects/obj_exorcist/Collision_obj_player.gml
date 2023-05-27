if !instance_exists(obj_cross) {
	instance_create(obj_player.x, obj_player.y, obj_cross)
}
if instance_exists(obj_cross)
{
	if sprite_index == spr_exorcist_idle
	{
		with (obj_cross)
		{
			scr_soundeffect_3d(sfx_priest)
			scr_soundeffect(sfx_knightsword)
			alarm[0] = 240
			alarm[1] = alarm[0] - 60
			alpha = 1
		}
	}
}
if sprite_index == spr_exorcist_idle
{
	sprite_index = spr_exorcist_pray
	alarm[0] = 120
}

