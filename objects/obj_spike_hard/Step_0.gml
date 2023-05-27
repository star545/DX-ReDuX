if cooldown > 0 && obj_player.state != states.hurt	 cooldown--
with (obj_player)
{
	if (place_meeting((x + 1), y, other) or place_meeting((x - 1), y, other) or place_meeting(x, (y + 1), other) or place_meeting(x, (y - 1), other))
	{
		with other event_user(0)
	}
}
