

flags.do_once = true;
flags.do_save = true;

condition = function() 
{
	return (place_meeting(x, y, obj_player) && obj_player.state == states.Sjumpland && get_keypieces() >= 35 && get_progress() >= 3);
}

output = function() 
{
	if quick_ini_read_real("BabyPeppino", "event5", 0) == 6 quick_ini_write_real("BabyPeppino", "event5", 7)
}


