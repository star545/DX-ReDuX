if (other.state != states.chainsaw && other.state != states.grabbed && other.state != states.hit && other.state != states.gotoplayer)
	instance_destroy()
	if irandom_range(0, 7) == 0
		instance_create(x, y, obj_pizzacoin)