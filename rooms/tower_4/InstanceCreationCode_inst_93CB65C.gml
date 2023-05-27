keyid = "w4_2"

keyr = 15
progress = 2

key_spot = instance_random(obj_keypiecespot)
step_event = function() {
	if instance_exists(key_spot) {
		x = key_spot.x 
		y = key_spot.y
	} else { instance_destroy() trace("Gone") }
	
}