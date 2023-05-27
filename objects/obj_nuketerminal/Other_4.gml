if global.death_mode instance_destroy(id, false)
if (ds_list_find_index(global.baddieroom, id) != -1)
	instance_destroy()
