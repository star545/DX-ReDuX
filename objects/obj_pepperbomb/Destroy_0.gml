if destroy
{
	with (instance_create(x, y, obj_canonexplosion))
		rat = other.grabbable
	repeat (3) {
		instance_create(x + random_range(-64, 64), y + random_range(-48, 48), obj_pepperbullet)
	}
}
