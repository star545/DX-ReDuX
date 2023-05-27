if (ds_list_find_index(global.saveroom, id) == -1)
{
	repeat (2)
	{
		with (create_debris((x + random_range(0, sprite_width)), (y + random_range(0, sprite_height)), particlespr))
		{
			hsp = random_range(-5, 5)
			vsp = random_range(-10, 10)
			image_speed = 0.35
		}
	}
	with (instance_create((x + random_range(0, sprite_width)), (y + random_range(0, sprite_height)), obj_parryeffect))
	{
		sprite_index = spr_deadjohnsmoke
		image_speed = 0.35
	}
	if (audio_is_playing(sfx_breakblock1) or audio_is_playing(sfx_breakblock2))
	{
		audio_stop_sound(sfx_breakblock1)
		audio_stop_sound(sfx_breakblock2)
	}
	scr_soundeffect(sfx_breakblock1, sfx_breakblock2)
	ds_list_add(global.saveroom, id)
}
/*
#region SPAWN OBJ_CUTOFF

if place_meeting(x + 1, y, obj_solid)
	instance_create(x + 32, y, obj_cutoffV)
	
if place_meeting(x - 1, y, obj_solid)
	with instance_create(x - 32, y, obj_cutoffV)
		image_xscale = -1
		
if place_meeting(x, y + 1, obj_solid)
	instance_create(x, y + 32, obj_cutoffH)
if place_meeting(x, y - 1, obj_solid)
	with instance_create(x, y - 32, obj_cutoffV)
		image_yscale = -1

#endregion
*/

for (var i = 0; i < array_length(tiles); i++)
	scr_destroy_tiles(32, tiles[i])
scr_destroy_nearby_tiles()
