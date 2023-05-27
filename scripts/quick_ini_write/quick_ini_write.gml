function quick_ini_write_real(argument0, argument1, argument2, argument3 = get_savefile_ini())
{
	with (obj_savesystem)
	{
		ini_open_from_string(ini_str)
		ini_write_real(argument0, argument1, argument2)
		ini_str = ini_close()
	}
	gamesave_async_save()
	exit;
}

