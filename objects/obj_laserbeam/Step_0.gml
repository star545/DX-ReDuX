if !instance_exists(baddieID) || (baddieID.state != states.rage) || (width_scale == 0 && state == 2) {
	instance_destroy()
	exit;
}

if state = 0 {
	orb_scale += 0.25
	if orb_scale >= 40 {
		state = 1
		alarm[1] = 90	
	}
}
else if state == 1 {
	width_scale = Approach(width_scale, (1 + random_range(-0.2, 0.2)), 0.1)
	if collision_line(x, y, tgtx, tgty, obj_player, 0, 0) != -4 || player_in_range(30, 30)
		scr_hurtplayer(obj_player1)
	var set_list = collision_line_list(x, y, tgtx, tgty, obj_baddie, 0, 0, list, 0)
	if set_list > 0
		for (var i = 0; i < set_list; ++i;)
	    {
			var baddie = ds_list_find_value(list, i)
	        instance_destroy(baddie);
	    }
}
else if state == 2 
	width_scale = Approach(width_scale, 0, 0.1)

	
if state != 2
	if fade_effect > 0 
		fade_effect--
	else {
		fade_effect = irandom_range(2, 6)
		with instance_create(x + random_range(-60, 60), y + random_range(-60, 60), obj_laser_orb)
			orbID = other.id
		
	}