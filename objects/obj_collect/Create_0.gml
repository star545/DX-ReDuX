if (room == rm_editor)
	exit;
global.collected = 0
global.collectsound = 0
var a = get_chardetail("collect")
sprite_index = a[irandom(array_length(a) - 1)]
image_speed = 0.35
depth = 11
gotowardsplayer = 0
movespeed = 5
arena = 0
if global.panic {
	instance_create(x, y, obj_escapecollect)
	instance_destroy(self)
}