player = instance_nearest(x, y, obj_player)
var dir = point_direction(x, y, player.x, player.y)
tgtx = x + lengthdir_x(50, dir)
tgty = y + lengthdir_y(50, dir)
state = states.normal
alarm[0] = 30