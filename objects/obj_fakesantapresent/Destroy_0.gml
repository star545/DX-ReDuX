if spawn
{
	with (instance_create(x, y, content))
	{
		santaID = other.baddieID
		arenaID = other.arena ? 1 : -4
		important = true
		switch object_index
		{
			case obj_spike:
				fake = 1
				y -= 32
				break
			
			default:
				if place_meeting_collision(x, y)
				{
					var old_y = y
					while place_meeting_collision(x, y)
					{
						y--
						if (abs((old_y - y)) > room_height)
						{
							y = old_y
							break
						}
						else
							continue
					}
				}
				break
		}
	}
}
