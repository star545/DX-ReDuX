if ds_list_find_index(global.saveroom, id) == -1
{
	scr_soundeffect(sfx_killingblow)
	ds_list_add(global.saveroom, id)
	scr_sleep(30)
	instance_create(x, y, obj_bangeffect)
	with (instance_create(x, y, obj_sausageman_dead))
	{
		if (obj_player1.state != states.firemouth)
			sprite_index = spr_clerkdead
		else
			sprite_index = spr_clerkburnt
		
	
	}
}
