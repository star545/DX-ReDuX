image_speed = 0.35
image_xscale = playerid.xscale
x = playerid.x
y = playerid.y
if (get_heat_player() < 2 or playerid.state != states.normal)
	instance_destroy()
