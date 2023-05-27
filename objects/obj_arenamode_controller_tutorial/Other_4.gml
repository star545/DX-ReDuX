if room == strongcold_arena && ds_exists(global.arena_box_list, ds_type_list) {
	
	var count = instance_number(obj_present_arena)
	for (var i = 0; i < count; i++) {
		var inst = instance_find(obj_present_arena, i)	
		if instance_exists(inst) && !in_ds_list(inst, global.arena_box_list)
			ds_list_add(global.arena_box_list, inst)
		
	}
	
	
}