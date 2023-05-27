function declare_particle(part_index, part_sprite, img_speed, part_depth)
{
	ds_map_set(global.part_map, part_index, part_type_create())
	ds_map_set(global.part_depth, part_index, part_depth)
	
	var p = ds_map_find_value(global.part_map, part_index)
	part_type_sprite(p, part_sprite, 1, 1, 0)
	
	var t = sprite_get_number(part_sprite)
	var s = img_speed
	var spd = t / s
	part_type_life(p, spd, spd)
	
	return p;
}

function particle_set_scale(part, xscale, yscale)
{
	part_type_scale(ds_map_find_value(global.part_map, part), xscale, yscale)
	exit;
}

function create_baddiedebris(_x = x, _y = y, spr = choose(spr_slapstar, spr_baddiegibs)) {
	var q = create_debris(_x, _y, spr)
	q.hsp = random_range(-5, 5)
	q.vsp = random_range(-10, 10)
	return q;
}

function create_debris(_x, _y, sprite, _animated = false)
{
	var q = 
	{
		x: _x,
		y: _y,
		sprite_index: sprite,
		image_number: sprite_get_number(sprite),
		image_index: irandom((image_number - 1)),
		image_angle: random_range(1, 270),
		image_speed: 0.35,
		sprw: sprite_get_width(sprite),
		sprh: sprite_get_height(sprite),
		hsp: random_range(-4, 4),
		vsp: random_range(-4, 0),
		alpha: 1,
		grav: 0.4,
		type: debris.normal,
		animated: _animated,
		destroyonanimation: 0,
		slowdown: 0 ,
		spr_palette: pal_default,
		paletteselect: 0,
	}
	if !global.option_performance
	ds_list_add(global.debris_list, q)
	return q;
}

function create_heatpuff(_x, _y)
{
	var q = create_debris(_x, _y, spr_heatpuff, 1)
	q.grav = 0
	q.hsp = 0
	q.vsp = irandom_range(-4, -1)
	q.destroyonanimation = 1
	return q;
}
function create_fire_effect(_x, _y, _spr, _speed = 0.3, animated = false)
{
	var angle = irandom(360)
	var q = create_debris(_x, _y, _spr, animated)
	q.grav = 0
	q.hsp = lengthdir_x(irandom_range(10, 15), angle)
	q.vsp = lengthdir_y(irandom_range(10, 15), angle)
	q.type = debris.fade
	q.slowdown = _speed
	q.image_angle = angle
	return q;
}

function create_collect(_x, _y, sprite)
{
	_x -= camera_get_view_x(view_camera[0])
	_y -= camera_get_view_y(view_camera[0])
	var q = 
	{
		x: _x,
		y: _y,
		sprite_index: sprite,
		image_index: 0,
		image_number: sprite_get_number(sprite),
		hsp: 0,
		vsp: 0
	}
	if !global.option_performance	
	ds_list_add(global.collect_list, q)
	return q;
}

function create_particle(x, y, part, random_offset = 0)
{
	var _depth = ds_map_find_value(global.part_depth, part)
	if is_undefined(_depth)
		_depth = object_get_depth(object_index)
	
	part_system_depth(global.particle_system, _depth)
	part_emitter_region(global.particle_system, global.part_emitter, (x - random_offset), (x + random_offset), (y - random_offset), (y + random_offset), 0, 0)
	part_emitter_burst(global.particle_system, global.part_emitter, ds_map_find_value(global.part_map, part), 1)
}

function create_destroyable_debris(_x, _y, _spr, _range, _animated = false) {
	var q = create_debris(_x + random_range(_range, 0), _y + random_range(_range, 0), _spr, _animated)
	with q {
		hsp = random_range(-5, 5)
		vsp = random_range(-10, 10)
		image_speed = 0.35	
	}
	return q;
	
}

function create_still_debris(_x, _y, _spr, _range) {
	var q = create_debris(_x + random_range(_range, 0), _y + random_range(_range, 0), _spr, 1)
	with q {
		hsp = 0
		vsp = 0
		image_speed = 0.35	
	}
	return q;
	
}