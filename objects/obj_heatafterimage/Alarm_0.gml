x = obj_player1.x
y = obj_player1.y
if get_heat_player() < 2
{
	visible = false
	is_visible = 0
}
else
{
	visible = obj_player1.visible
	is_visible = 1
}
if (place_meeting(x, y, obj_secretportal) or place_meeting(x, y, obj_secretportalstart))
	visible = false
if (room == rank_room)
	visible = false
if (get_heat_player() == 2)
	alpha = 0.25
if (get_heat_player() == 3)
	alpha = 0.5
Vspeed = random_range(-1, 1)
Hspeed = random_range(-1, 1)
alarm[0] = 10
visible = false
