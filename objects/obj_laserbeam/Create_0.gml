dir = point_direction(x, y, obj_player1.x, obj_player1.y + 25)
var nextx = lengthdir_x(5, dir)
var nexty = lengthdir_y(5, dir)
var _x = 0
var _y = 0
while (collision_line(x, y, x + _x, y + _y, obj_solid, false, false) == -4) {
	_x += nextx
	_y += nexty
	if y + _y >= room_height
		break;
}

tgtx = x + _x
tgty = y + _y
dir = point_direction(x, y, tgtx, tgty)
length_scale = (distance_between_points(x, y, tgtx, tgty) / sprite_get_width(sprite_index))
//alarm[0] = 120
width_scale = 0
state = 0
list = ds_list_create()
fade_effect = 0

orb_scale = 0