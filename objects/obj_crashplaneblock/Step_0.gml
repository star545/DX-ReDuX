if (place_meeting(x, (y + 1), obj_player) && (!instance_exists(obj_crashingplane))) {
	parallax_change_hspeed("Backgrounds_still1", -0.5)
	parallax_change_vspeed("Backgrounds_still1", 2)
}
