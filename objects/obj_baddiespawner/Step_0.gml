if (!instance_exists(baddieid))
	refresh--
if (refresh <= 0)
{
	image_speed = 0.35
	if (floor(image_index) == 5)
	{
		with (instance_create(x, (y - 20), content))
		{
			if (other.platformid != -4)
				platformid = other.platformid
			image_xscale = other.image_xscale
			state = states.stun
			stunned = 50
			vsp = -5
			if variable_instance_exists(id, "elite") && !elite && other.make_elite elite = true
			if object_index == obj_kentukykenny unforce_elite = 1
			other.baddieid = id
			important = 1
			if (object_index == obj_pizzagoblinbomb)
				countdown = other.countdown
		}
		refresh = 100
	}
}
scr_collision()
