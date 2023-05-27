with instance_create(x, y, obj_machalleffect) {
	if string_contains(sprite_get_name(other.sprite_index), "diag") sprite_index = spr_mortfirediag_die
	else sprite_index = spr_mortfire_die
	image_xscale = other.image_xscale
	image_yscale = other.image_yscale
	image_angle = other.image_angle
	
}