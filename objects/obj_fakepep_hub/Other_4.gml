with obj_player1 {
	var from_elevator = place_meeting(x, y, obj_hubelevator)
	var from_quickwarp = place_meeting(x, y, obj_door) && instance_place(x, y, obj_door).targetRoom == tower_quickwarp
	if !from_elevator && !from_quickwarp instance_destroy(other.id, false)
	
}

if quick_ini_read_real("BabyPeppino", "event1", 0) == 0 instance_destroy(id, false)
if chance(50) instance_destroy(id, false)
if get_keyname("w5_2") == true instance_destroy(id, false)
if quick_ini_read_real("BabyPeppino", "event1", 0) != world instance_destroy(id, false)