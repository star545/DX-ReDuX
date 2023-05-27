var a = instance_place(x, y, par_doortrig)
if a == -4 a = instance_nearest(x, y, par_doortrig)
if targetDoor = "null" targetDoor = a.doorID

if place_meeting(x, y, obj_player)
	visited = 1

