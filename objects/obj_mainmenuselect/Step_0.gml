if instance_exists(obj_option) || instance_exists(obj_keyconfig) || instance_exists(obj_erasegame)
	exit;

scr_getinput()
if key_right2 {
	image_index = 0
	sprite_index = anim_to_right[optionselected]
	if optionselected != 2
		optionselected++
	else
		optionselected = 0
	scr_soundeffect(sfx_step)
}	
if -key_left2 {
	image_index = 0
	sprite_index = anim_to_left[optionselected]
	if optionselected != 0
		optionselected--
	else
		optionselected = 2
	scr_soundeffect(sfx_step)
}	
if (key_jump || keyboard_check_pressed(vk_enter))
	alarm[optionselected] = 5
if instance_exists(obj_fadeout)
	{
		with obj_player
			image_index = 0
	}	
if anim_end() {
	switch sprite_index {
		case spr_title_erase_to_start:
		case spr_title_options_to_start:
			sprite_index = spr_title_startgame
			break;
		case spr_title_erase_to_options:
		case spr_title_start_to_options:
			sprite_index = spr_title_options
			break;
		case spr_title_options_to_erase:
		case spr_title_start_to_erase:
			sprite_index = spr_title_erase
			break;
	}		
}		