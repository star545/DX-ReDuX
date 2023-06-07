if txt_out > 0 txt_out--
audio_sound_gain(musicID, gain * global.option_music_volume, 0)	

if (state = states.unpaused) {	
	if global.lowpassEffect.bypass == false global.lowpassEffect.bypass = true
	alarm[2] = 300
	if sprite_exists(pausespr) sprite_delete(pausespr)
	gain = Approach(gain, 0, 0.1)
	#region Set to Pause
	if obj_player.key_start {
		var _cutscenehandler = 0
		if instance_exists(obj_johnhitstun) _cutscenehandler = 1
		with (obj_cutscene_handler) if (!loop) _cutscenehandler = 1
		with (obj_secretportal) if touched _cutscenehandler = 1
		if instance_exists(obj_fadeout) _cutscenehandler = 1
		with (obj_secretportalstart) if sprite_index = spr_secretportal_spawnopen _cutscenehandler = 1
		if instance_exists(obj_exitfadeout) || instance_exists(obj_technicaldifficulty) || instance_exists(obj_jumpscare) _cutscenehandler = true	
		if obj_player1.state == states.bossdefeat _cutscenehandler = true
		var _gate = obj_startgate
		if instance_exists(obj_arcademachinesmip)
			var _gate = obj_arcademachinesmip
		with _gate {
			if state == states.options || can_proceed _cutscenehandler = true	
			
		}
		if (obj_savesystem.state == 0 && (!_cutscenehandler) && room != SPOOK && room != rank_room && room != Realtitlescreen && room != timesuproom && room != credits)
		{
			selected = 0
			state = states.paused
			selected_page = 0
			lerp_x = 0
			lerp_y = 0
			pages[0].selected = 0
			global.lowpassEffect.bypass = false
			//pause_sprite = sprite_create_from_surface(application_surface, 0, 0, 960, 540, 0, 0, 0, 0)
			
			if !surface_exists(pause_surf) 
				pause_surf = surface_create(960, 540)
			if surface_exists(pause_surf)	{
				surface_set_target(pause_surf)
				draw_clear_alpha(c_black, 0)
				with obj_parallax {
					if visible
					event_perform(ev_draw, ev_draw)
				}
				
				draw_surface(application_surface, 0, 0)

				
				with obj_tv {
					if visible
					event_perform(ev_draw, ev_gui)
				}
				with obj_arenamode_controller {
					if visible
					event_perform(ev_draw, ev_gui)
				}
				with obj_camera {
					if visible
					event_perform(ev_draw, ev_gui)
				}
				with obj_wartimer {
					if visible
					event_perform(ev_draw, ev_gui)
				}
				
				
				surface_reset_target()
			}
			/*
			if !buffer_exists(surf_buffer) surf_buffer = buffer_create(960 * 540 * 4, buffer_fixed, 1);
			if buffer_exists(surf_buffer) buffer_get_surface(surf_buffer, pause_surf, 0)*/
			if sprite_exists(pausespr) sprite_delete(pausespr)
			pausespr = sprite_create_from_surface(pause_surf, 0, 0, 960, 540, 0, 0, 0, 0)
			surface_free(pause_surf)
			
			
			
			
			audio_pause_all()
			audio_resume_sound(obj_music.secret ? global.secretmusic : global.music)
			instance_deactivate_all(true)
			instance_activate_object(obj_pause)
			instance_activate_object(obj_inputAssigner)
		}
	}
	#endregion
}
#region Unpause Fade
if fadeout = true && pause_alpha <= 0.3 && state != states.unpaused {
	instance_activate_all()
	scr_deactivate_escape()
	alarm[1] = 1
	audio_resume_all()	
	state = states.unpaused
	selected_page = 0
	audio_stop_sound(musicID)
	fadeout = false
	global.lowpassEffect.bypass = true
	audio_resume_sound(obj_music.secret ? global.secretmusic : global.music)
	audio_pause_sound(obj_music.secret ? global.music : global.secretmusic)
	
}

#endregion
if (state != states.unpaused && !fadeout)
{
	if global.lowpassEffect.bypass == true global.lowpassEffect.bypass = false
	gain = Approach(gain, 1, 0.003)
	
	scr_getinput()
	#region Variable INIT
	var cur_page = pages[selected_page]
	var cur_options = pages[selected_page].options
	var tgtX = cur_page.set_x
	var tgtY = cur_page.set_y
	var move_h = key_left2 + key_right2
	var move_v = key_down2 - key_up2
	lerp_x = lerp(lerp_x, tgtX, 0.15)
	lerp_y = lerp(lerp_y, tgtY, 0.15)
	
	#endregion
	
	
	//for (var p = 0; p < array_length(pages)
	
	
	
	#region test
	
	if is_array(cur_options) {
		var cur_options_length = array_length(cur_options) - 1		
		if move_v != 0 {
			var prev_page = pages[selected_page].selected
			pages[selected_page].selected += move_v	
			pages[selected_page].selected = clamp(pages[selected_page].selected, 0, cur_options_length)
			if pages[selected_page].selected != prev_page {
				scr_soundeffect(sfx_step)
			}
		}
		
		
	var cur_option = pages[selected_page].options[pages[selected_page].selected]
	var op_selected = cur_option.selected
	var input = cur_option.suboptions

	var is_simple_function = !is_array(input)
	var total_suboption_length = 0
	if !is_simple_function {
		total_suboption_length = array_length(input) - 1
		if move_h != 0 {
			var prev_suboption = cur_option.selected 
			cur_option.selected += move_h
			cur_option.selected = clamp(cur_option.selected, 0, total_suboption_length)
			if cur_option.selected != prev_suboption {
				scr_soundeffect(sfx_step)
				cur_option.color = c_maroon
				
				
			}
			/*
			var prev_suboption = pages[selected_page].options[pages[selected_page].selected].selected
			pages[selected_page].options[pages[selected_page].selected].selected += move_h
			pages[selected_page].options[pages[selected_page].selected].selected = clamp(pages[selected_page].options[pages[selected_page].selected].selected, 0, total_suboption_length)
			if pages[selected_page].options[pages[selected_page].selected].selected != prev_suboption {
				scr_soundeffect(sfx_step)
				pages[selected_page].options[pages[selected_page].selected].color = c_maroon
			}
			*/
		}
	}
	
	if key_jump {
		
		scr_soundeffect(sfx_enemyprojectile)
		if is_simple_function 
			input()
		else {
			input[op_selected].func()	
			cur_option.color = c_gray
		}
		key_jump = false;
	}
	
	#endregion
		
	}
	if key_slap2 {
		if selected_page > 1
			selected_page = 1
		else
			selected_page = 0
		
	}
	#region Custom Palettes
	char_offset_x = lerp(char_offset_x, 0, 0.25)
	char_offset_y = lerp(char_offset_y, 0, 0.25)
	if selected_page = 4 {
		if !instance_exists(obj_d3Palette) instance_create(x, y, obj_d3Palette)
		if !custom_paletting {
			if move_v != 0 && char_options[selected_char].sel_pal != 0 {
				selected_char += move_v
				selected_char = clamp(selected_char, 0, array_length(char_options) - 1)
				char_offset_y = move_v * 100
			
			}
			var _sel_pal = char_options[selected_char].sel_pal
			if selected_char != characters.gus select_gus = 0
			if move_h != 0 {
				if _sel_pal != 0 {
					char_options[selected_char].sel_pal += move_h
					char_options[selected_char].sel_pal = clamp(char_options[selected_char].sel_pal, 0, array_length(char_options[selected_char].pal_details) - 1)
					char_offset_x = move_h * 100
				} 
				
				
				//char_options[selected_char].pal_details = _sel_pal
			}
			if char_options[selected_char].sel_pal == 0 {
				
				custom_paletting = true
				with obj_d3Palette active = true
				
			}	
		} else with obj_d3Palette active = true
		saved_char = Approach(saved_char, 0, 1)
		if key_jump {
			var saved_custom_slot = 0
			with obj_d3Palette saved_custom_slot = slot_sel
			saved_char = 20
			var _spr = char_options[selected_char].sel_spr
			char_index = irandom(sprite_get_number(_spr) - 1)
			instance_activate_object(obj_player)
			instance_activate_object(obj_tv)
			with obj_player1 {
				if other.selected_char != characters.gus { 
					character = other.selected_char
					custom_slot = saved_custom_slot
					paletteselect = other.char_options[other.selected_char].sel_pal
					other.select_gus = 0
				} else {
					paletteselectGus = other.char_options[other.selected_char].sel_pal
					other.select_gus++
					/* if other.select_gus >= 3 { 
						character = characters.gus
						global.mach_color1 = get_chardetail("machcolor1")
						global.mach_color2 = get_chardetail("machcolor2")
						isgustavo = true 
							
						txt_out = 240
						txt_y = 0
						txt = "PLAYING AS GUSTAVO"
					*/}
				if other.selected_char == characters.noise && other.char_options[other.selected_char].sel_pal == 8 bo_noise = true
				else bo_noise = false
				var a = get_chardetail("sfx", "taunt")
				scr_soundeffect(a[irandom(array_length(a) - 1)])
				scr_characterspr()
				scr_tvsprites()
				if scr_transformationcheck() {
					state = states.normal	
				}
			}
			instance_deactivate_object(obj_player)
			instance_deactivate_object(obj_tv)
		}
	}
	#endregion

	
	
	cursor_index += 0.35
	if (cursor_index > cursor_sprite_number)
	{
		var p = (cursor_index - floor(cursor_index))
		cursor_index = p
	}
	for (var i = 0; i < array_length(toppin_sprite); i++)
	{
		toppin_index[i] += 0.35
		if (toppin_index[i] > toppin_number[i])
		{
			var t = toppin_index[i]
			p = (t - floor(t))
			toppin_index[i] = p
		}
	}
	toppin_has[0] = global.shroomfollow
	toppin_has[1] = global.cheesefollow
	toppin_has[2] = global.tomatofollow
	toppin_has[3] = global.sausagefollow
	toppin_has[4] = global.pineapplefollow
}
