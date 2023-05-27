if (!instance_exists(obj_keyconfig))
{
	if (((-obj_player.key_left2) or keyboard_check_pressed(vk_left)) && optionselected > 0)
	{
		optionselected -= 1
		scr_soundeffect(sfx_step)
	}
	if ((obj_player.key_right2 or keyboard_check_pressed(vk_right)) && optionselected < 1)
	{
		optionselected += 1
		scr_soundeffect(sfx_step)
	}
}
if (optionselected == 1 && (obj_player.key_jump or keyboard_check_pressed(vk_return)))
{
	file_delete("saveData.ini")
	//file_delete(obj_savesystem.ini_str)
	file_delete(concat("saves\\",get_savefile_ini()))
	file_delete("saves\\saveData1.ini")
	scr_initinput()
	scr_soundeffect(sfx_breakblock1)
	ini_open("saveData.ini")
	gamesave_async_load()
	obj_mainmenuselect.selected = 0
	instance_destroy()
}
if (obj_player.key_slap2 or keyboard_check_pressed(vk_escape) or (optionselected == 0 && (obj_player.key_jump or keyboard_check_pressed(vk_return))))
{
	scr_soundeffect(sfx_enemyprojectile)
	obj_mainmenuselect.selected = 0
	instance_destroy()
}
