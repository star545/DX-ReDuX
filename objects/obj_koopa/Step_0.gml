if !active {
	if bbox_in_camera(view_camera[0]) active = true
	exit;
	
}
if place_meeting_solid(x + hsp, y) {
	if !turn {
		image_xscale *= -1	
		turn = 1	
	}
} else turn = false
if vsp > 12 vsp = 12
hsp = movespeed * image_xscale
scr_collision()
if y > room_height + 32 instance_destroy()