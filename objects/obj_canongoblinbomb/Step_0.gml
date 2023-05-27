hsp = (image_xscale * movespeed)
var a = elite && distance_to_object(obj_player1) < 50
if place_meeting((x + hsp), y + vsp, obj_solid) || a
{
	//instance_create(x, y, obj_canonexplosion)
	instance_destroy()
}
if (place_meeting((x + 1), y, obj_bombblock) or place_meeting((x - 1), y, obj_bombblock) or place_meeting(x, (y - 1), obj_bombblock) or place_meeting(x, (y + 1), obj_bombblock))
	instance_destroy()
scr_collision()
