with (obj_teleporter)
{
	if (trigger == other.trigger && start == 0)
	{
		repeat (8)
		{
			with (instance_create((x + random_range(50, -50)), (y + random_range(50, -50)), obj_cloudeffect))
				sprite_index = spr_teleporteffect
		}
	}
}
with (obj_pizzaball)
{
	scr_soundeffect(sfx_teleporter2)
	visible = true
	if place_meeting(x, y, obj_solid)
		y--
}
