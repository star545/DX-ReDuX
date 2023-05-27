if (ds_list_find_index(global.saveroom, id) == -1)
{
	ds_list_add(global.saveroom, id)
	if (object_index == obj_escapecollectbig)
		ds_list_add(global.escaperoom, id)
}
scr_ghostcollectible()
if instance_exists(obj_arenamode_controller) && !arena {
	if (ds_list_find_index(global.arenaroom, id) == -1)
		ds_list_add(global.arenaroom, id)
	with instance_create(xstart, ystart, obj_arenaghost) {
		contentID = other.id
		//ontouch = true
		content = other.object_index
		image_xscale = other.image_xscale
        image_yscale = other.image_yscale
        sprite_index = other.sprite_index
		
	}	
	
}