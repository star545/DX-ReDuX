var a = instance_place(x, y, par_doortrig)
if !instance_exists(a) a = instance_nearest(x, y, par_doortrig)
if instance_exists(a) targetDoor = a.doorID
if place_meeting(x, y, obj_player)
	visited = 1
