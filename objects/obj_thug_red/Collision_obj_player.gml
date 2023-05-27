var player = other.id

if !instance_exists(id)
	exit;
var baddie = id
if (state == states.punch && image_index > 8 && image_index < 12)
	scr_hurtplayer(player)
