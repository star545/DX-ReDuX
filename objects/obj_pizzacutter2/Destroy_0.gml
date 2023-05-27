with instance_place(x, y, obj_pizzacutter1) {
	alarm[0] = 180	
}
create_particle(x, y, particle.genericpoofeffect)
with (instance_create(x, y, obj_sausageman_dead))
{
	angle = other.image_angle
	sprite_index = other.sprite_index
	spr_palette = pal_default
	vsp = -6
	hsp = (sign((x - obj_player.x)) * random_range(5, 9))
	paletteselect = 0
	usepalette = 0
	
}