if ds_list_find_index(global.saveroom, id) != -1 {
	for (var i = 0; i < array_length(tiles); i++)
		scr_destroy_tiles(32, tiles[i])
	scr_destroy_nearby_tiles()
	instance_destroy()
	exit;
	
}
if get_keypieces() >= keys && quick_ini_read_real("BabyPeppino", "progress", 0) >= progress {
	bloooc = 1
	blockobj = instance_create(x, y, obj_secretbigblock) 
	blockobj.image_xscale = image_xscale
	blockobj.image_yscale = image_yscale
} else {
	if place_meeting(x, y, obj_keypiece) instance_destroy(instance_place(x, y, obj_keypiece))
	with instance_create(x, y, obj_solid) {
	
	image_xscale = other.image_xscale * 2
	image_yscale = other.image_yscale * 2
	
	}
}
visible = false
//instance_destroy()