if global.panic && instance_id_get(obj_escapecollectbigspawned) != instance_id {
	instance_create(x, y, obj_escapecollectbigspawned)
	instance_destroy(self)
}
if (place_meeting(x, y, obj_destructibles) or place_meeting(x, y, obj_secretmetalblock))
	depth = 102
else
	depth = 2
