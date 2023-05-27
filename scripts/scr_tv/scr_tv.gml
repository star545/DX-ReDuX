function tv_set_idle()
{
	with (obj_tv)
	{
		state = states.normal
		sprite_index = tv_idle
		saved_tv_spr = tv_idle
		expressionsprite = -4
	}
}

function tv_reset()
{
	with (obj_tv)
	{
		state = states.normal
		sprite_index = spr_tv_idle
		ds_list_clear(tvprompts_list)
	}
}

function tv_create_prompt(text, prompt_type, sprite, scroll_speed)
{
	return [text, prompt_type, sprite, scroll_speed];
}

function tv_push_prompt(text, prompt_type, sprite, scroll_speed)
{
	with (obj_tv)
	{
		var b = [text, prompt_type, sprite, scroll_speed]
		
		var play = false
		switch prompt_type
		{
			case tvprompt.normal:
				play = true
				ds_list_insert(tvprompts_list, 0, b)
				break
			
			case tvprompt.trigger:
				var placed = false
				for(var i = 0; i < ds_list_size(tvprompts_list); i++)
				{
					var b2 = ds_list_find_value(tvprompts_list, i)
					if (b2[1] == tvprompt.transfo)
					{
						if (i == 0)
							play = true
						ds_list_insert(tvprompts_list, i, b)
						placed = true
						break
					}
				}
				if (!placed)
					ds_list_add(tvprompts_list, b)
				break
			
			case tvprompt.transfo:
				ds_list_add(tvprompts_list, b)
				break
		}
		if play
			state = states.normal
	}
}

function tv_push_prompt_array(array)
{
	for (var i = 0; i < array_length(array); i++)
	{
		with (obj_tv)
		{
			var b = array[i]
			tv_push_prompt(b[0], b[1], b[2], b[3])
		}
	}
}

function tv_push_prompt_once(prompt, save_entry)
{
	with (obj_tv)
	{
		if (special_prompts == -4)
			return false;
		
		var b = ds_map_find_value(special_prompts, save_entry)
		if is_undefined(b)
			return false;
		
		if (b != 1)
		{
			tv_push_prompt(prompt[0], prompt[1], prompt[2], prompt[3])
			ds_map_set(special_prompts, save_entry, 1)
			ini_open_from_string(obj_savesystem.ini_str)
			ini_write_real("Prompts", save_entry, 1)
			obj_savesystem.ini_str = ini_close()
			return true;
		}
		return false;
	}
}

function tv_default_condition()
{
	return place_meeting(x, y, obj_player);
}

function tv_do_expression(spr, buffer = 60, overwrite = true)
{
	with (obj_tv)
	{
		if (expressionsprite != spr && overwrite && spr != tv_idle)
		{
			state = states.tv_whitenoise
			expressionsprite = spr
			//saved_tv_spr = -4
			draw_static = true
			//trace("TO WHITE NOISE")
			state = states.tv_whitenoise
			static_index = 0
			if expressionsprite == tv_hurt && obj_player1.isgustavo expressionsprite = spr_tv_hurtG
			if expressionsprite == tv_collect && obj_player1.isgustavo expressionsprite = spr_tv_happyG
			expressionbuffer = buffer
		}
	}
}

function scr_controlprompt(prompt = "No prompt set", save = prompt)
{
	var time = string_length(prompt) * 15
	time = clamp(time, 60, 450)
	var type = 0
	if (save == -4) type = 1
	if (save == -1) type = 2
	with obj_tv {
		if type != 2 {
			if !in_ds_list(save, global.saveroom) || type == 1 {
				controlprompt = concat("[spr_promptfont]", prompt)
				prompt_timer = 120
				ds_list_add(global.saveroom, save)
			}
		} else {
			controlprompt = concat("[spr_promptfont]", prompt)
			prompt_timer = 2
			
		}
	}
	return
}
