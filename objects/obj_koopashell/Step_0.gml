invtime--
if place_meeting_solid(x + hsp, y) {
	if !turn {
		image_xscale *= -1	
		turn = 1	
	}
} else turn = false
if vsp > 12 vsp = 12
if state == 1 hsp = movespeed * image_xscale
else hsp = 0
scr_collision()
if y > room_height + 32 instance_destroy()