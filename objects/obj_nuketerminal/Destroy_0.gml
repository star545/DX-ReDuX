if (ds_list_find_index(global.baddieroom, id) == -1)
{
	instance_create_unique(0, 0, obj_wartimer)
	with (obj_wartimer)
	{
		fill += time_in_frames(0, 30)
	}
	for (var i = 0; i < sprite_get_number(spr_warterminal_debris); i++)
	{
		with (create_debris(x, y, spr_warterminal_debris))
			image_index = i
	}
	tile_layer_delete_at(1, x, y)
	tile_layer_delete_at(1, (x + 32), y)
	tile_layer_delete_at(1, (x + 32), (y + 32))
	tile_layer_delete_at(1, x, (y + 32))
	if (audio_is_playing(sfx_breakblock1) or audio_is_playing(sfx_breakblock2))
	{
		audio_stop_sound(sfx_breakblock1)
		audio_stop_sound(sfx_breakblock2)
	}
	scr_soundeffect(sfx_breakblock1, sfx_breakblock2)
	ds_list_add(global.baddieroom, id)
}
