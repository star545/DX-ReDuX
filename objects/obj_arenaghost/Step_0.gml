
if (ds_list_find_index(global.arenaroom, contentID) == -1) && !instance_exists(contentID) && (!ontouch || !place_meeting(x, y, obj_player)) {
	with instance_create(x, y, content) {
		image_xscale = other.image_xscale
        image_yscale = other.image_yscale
        sprite_index = other.sprite_index	
	}
	create_particle(x, y, particle.genericpoofeffect)
	instance_destroy()
}