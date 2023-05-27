function quick_ini_read_real(argument0, argument1, argument2, argument3 = get_savefile_ini())
{
	ini_open_from_string(obj_savesystem.ini_str)
	var b = ini_read_real(argument0, argument1, argument2)
	ini_close()
	return b;
}

function get_keypieces() {
	return ds_map_size(global.pizzaboy_quest)	
}

function get_keyname(name) {
	return global.pizzaboy_quest[? name]	
}
function get_progress() {
	return quick_ini_read_real("BabyPeppino", "progress", 0)		
}