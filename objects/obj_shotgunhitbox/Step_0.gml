
with (instance_place(x, y, obj_shotgunblock))
	instance_destroy()

with (instance_place(x, y, obj_destructibles))
{
	if (object_index != obj_onewaybigblock)
		instance_destroy()
}
