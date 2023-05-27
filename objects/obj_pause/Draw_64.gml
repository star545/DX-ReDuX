var _cam_x = camera_get_view_x(view_camera[0])
var _cam_y = camera_get_view_y(view_camera[0])
var _mouse_x = (mouse_x - _cam_x)
var _mouse_y = (mouse_y - _cam_y)
var tgt = 0
if state != states.unpaused && !fadeout
	tgt = 1
pause_alpha = Approach(pause_alpha, tgt, 0.1)	

#region Pause Screenshot
/*
if buffer_exists(surf_buffer) && (state == states.paused || pause_alpha >= 0.3) {
	if !surface_exists(pause_surf) pause_surf = surface_create(960, 540)
	buffer_set_surface(surf_buffer, pause_surf, 0)	
		
	
	//gpu_set_colorwriteenable(true, true, true, true);
}
*/
#endregion
if !surface_exists(real_pause_surf) {
	real_pause_surf = surface_create(960, 540)
	surface_set_target(real_pause_surf)
	draw_clear_alpha(c_black, 0)
	surface_reset_target()	
} else if state != states.unpaused {
	surface_set_target(real_pause_surf)	
	
		draw_clear_alpha(c_black, 0)
		draw_set_alpha(1)
		
		draw_set_alpha(0.6)
		draw_rectangle_color(0, 0, 960, 540, c_black, c_black, c_black, c_black, 0)
		draw_set_alpha(1)

		draw_set_font(global.bigfont)
		draw_set_halign(fa_center)
		draw_set_valign(fa_top)
		
		#region Draw  Normal Pages
		/*
		var cur_option = pages[selected_page].options[pages[selected_page].selected]
		var op_selected = cur_option.selected
		var input = cur_option.suboptions
		var is_simple_function = !is_array(input)
		*/
	
		for (var i = 0; i < array_length(pages); i++) {
			var cur_page = pages[i]
			var pad = 48
			var page_x = cur_page.set_x
			var page_y = cur_page.set_y
			var page_selected = cur_page.selected
			var page_options = cur_page.options
			//var current_pages_option = pages[selected_page].options[pages[selected_page].selected]
			if page_options != -4 {
				var option_length = array_length(page_options)
				var height = option_length * pad
				for (var c = 0; c < option_length; c++) {
					var cur_option = page_options[c]	
					var name = cur_option.title
					var color = cur_option.color
					var selected_suboption = cur_option.selected
					var suboption = cur_option.suboptions
					if is_array(suboption)
						name += concat(": ", suboption[selected_suboption].title)
					var str_leng = string_width(name)
					var xx = 480 + page_x - lerp_x
					var yy = (270 - (height / 2) + (pad * c)) + page_y - lerp_y
					var _c = color
					if page_selected == c {
						if _c == c_maroon _c = c_red
						else if _c == c_green _c = c_lime
						else _c = c_white
						if i == selected_page {
							angel_tgty = yy// + lerp_y
							angel_tgtx = xx - (str_leng / 2) - 75// + lerp_x
						}
					}
					 
					draw_text_color(xx, yy, name, _c, _c, _c, _c, 1)
				}
			}
			draw_text(480 + page_x - lerp_x, 40 + page_y - lerp_y, cur_page.title)
		}
		#endregion
		if selected_page == 3 || selected_page == 4 { angel_tgtx = -100 angel_tgty = -100 }
		angel_x = (lerp(angel_x, round(angel_tgtx), 0.04))// - lerp_x
		angel_y = (lerp(angel_y, round(angel_tgty), 0.04))// - lerp_y
		
		#region  Audio Bars
		var _h = string_height("A")
		var inbetween_pad = 20
		
		var padding = 120
		var bar_height = 25
		var bar_width = 576
		var bar_details = [
		["MASTER", "option_master_volume"],
		["MUSIC", "option_music_volume"],
		["SOUND", "option_sfx_volume"],
		]
		var total_height = (_h + inbetween_pad + bar_height) * 3
		var scrollBar_relative = (_mouse_x - (480 - (bar_width / 2))) / bar_width
		for (var a = 0; a < 3; a++) {
			var p = (270 - total_height / 2) + padding * a
			var _xL = (480 - (bar_width / 2)) + 1000 - lerp_x 
			var _xR = (480 + (bar_width / 2)) + 1000 - lerp_x 
			var _yT = p + 1000 - lerp_y
			var _yB = p + bar_height + 1000 - lerp_y
			draw_text(480 + 1000 - lerp_x, _yT - _h - inbetween_pad, concat(bar_details[a, 0], ": ", floor(100 * variable_global_get(bar_details[a, 1]))))
			draw_healthbar(_xL, _yT, _xR, _yB, audio_levels[a], c_black, c_white, c_white, 0, true, true)
			var audio_rectangle = point_in_rectangle(_mouse_x, _mouse_y, _xL - 16,  _yT - 16, _xR + 16, _yB + 16)
			
			if audio_rectangle && mouse_check_button(mb_left) && selected_page == 3 {
				if a == 2 && !audio_is_playing(sfx_enemyprojectile)
					scr_soundeffect(sfx_enemyprojectile)
				var val = clamp(round(scrollBar_relative * 100), 0, 100)
				audio_levels[a] = val
				variable_global_set(bar_details[a, 1], val / 100)
				set_audio_config()
				//trace(concat("AUDIO ", a, " : ", audio_levels[a]))
			}
		}
		#endregion
		
		#region Custom Palettes
		var _char = char_options[selected_char]
		var _spr = saved_char > 0 ? _char.sel_spr : _char.idle_spr
		
		var a = (100 - abs(char_offset_x) - abs(char_offset_y)) / 100
		var player_posx = char_options[selected_char].sel_pal == 0 ? 200 : 480
		var player_posy = char_options[selected_char].sel_pal == 0 ? 150 : 220
		var arr = [
		[-2, 0],
		[2, 0],
		[0, -2],
		[0, 2],
		]
		for (var g = 0; g < 4; g++) {
		//	draw_sprite_ext_flash(_spr, char_index, player_posx + 1000 - lerp_x + char_offset_x + arr[g, 0], 270 - 1050 - lerp_y + char_offset_y+ arr[g, 1], 2, 2, 0, c_white, a)
		}
		
		scr_draw_outline_ext(_spr, char_index, player_posx + 1000 - lerp_x + char_offset_x, player_posy - 1000 - lerp_y + char_offset_y, 2, 2, 0, c_white, a, 2)
		shader_set(global.Pal_Shader)
		if (instance_exists(obj_d3Palette) && surface_exists(obj_d3Palette.prev_pal) && char_options[selected_char].sel_pal == 0) pal_swap_set(obj_d3Palette.prev_pal, 1, 1)
		else pal_swap_set(_char.pal_spr, _char.sel_pal)
		
		draw_sprite_ext(_spr, char_index, player_posx + 1000 - lerp_x + char_offset_x, player_posy - 1000 - lerp_y + char_offset_y, 2, 2, 0, c_white, a)
		if char_options[selected_char].sel_pal == 0
		draw_sprite_ext(_char.tv_spr, tv_index, player_posx + 1000 - lerp_x + char_offset_x, player_posy + 250 - 1000 - lerp_y + char_offset_y, 1, 1, 0, c_white, a)
		if saved_char == 0 char_index += 0.35
		if char_index >= sprite_get_number(_spr) char_index = frac(char_index)
		tv_index += 0.35
		if tv_index >= sprite_get_number(_char.tv_spr) tv_index = frac(tv_index)
		angel_index += 0.35
		if angel_index >= sprite_get_number(spr_pizzaangel) angel_index = frac(angel_index)
		
		shader_reset()	
		draw_set_font(global.bigfont)
		draw_set_halign(fa_center)
		var textTop = _char.pal_details[_char.sel_pal][0]
		var textBot = _char.pal_details[_char.sel_pal][1]
		var current_custom = 0
		with obj_d3Palette current_custom = slot_sel + 1
		
		if textTop = "CUSTOM : NOT EDITING" textTop = concat("CUSTOM SLOT ", current_custom, " : NOT EDITING")
		if custom_paletting {
			
			textTop = concat("CUSTOM SLOT ", current_custom)
			textBot = custom_pal_text[pal_text]
			
		}
		draw_sprite(spr_pizzaangel, angel_index, angel_x, angel_y)
		draw_text(480 + random_range(-1, 1) + 1000 - lerp_x, 270 - 900 - lerp_y, string_upper(textTop))
		draw_set_font(global.font_small)
		draw_text_scribble(480 + 1000 - lerp_x, 270 - 850 - lerp_y, textBot)
		#endregion
		
		#region Toppins
		xx = 480
		yy = 470
		pad = 40
		var length = array_length(toppin_sprite)
		var total_length = pad * length
		for (i = 0; i < length; i++)
			draw_sprite_ext(toppin_sprite[i], toppin_index[i], (xx + (pad * i) - (total_length / 2) - lerp_x), yy - lerp_y, 1, 1, 0, c_white, (toppin_has[i] ? 1 : 0.5))
		#endregion	
		
		#region Misc Text
		draw_set_font(global.bigfont)
		var tgtTxt = 120
		if txt_out > 0 tgtTxt = 0
		txt_y = Approach(txt_y, tgtTxt, 5)
			
		draw_text(480, 500 + txt_y, txt)	
		
		var combob = concat(combo_names[global.attackstyle, global.sidemove])
		draw_text(480 + 2000 - lerp_x, 80 - lerp_y, combob)
		draw_text(480 + 2000 - lerp_x, 80 + 1000 - lerp_y, "CHEATS DISABLE RANKS")
		draw_text_scribble(170 - lerp_x, 400 - lerp_y, concat("[spr_font_combo][c_white][fa_left][fa_center]",string(get_keypieces()), "/35"))
		#endregion
		
	surface_reset_target()	

	
}
gpu_set_blendenable(false)
if sprite_exists(pausespr) && (state == states.paused || pause_alpha >= 0.3) 
	draw_sprite(pausespr, 0, 0, 0)
gpu_set_blendenable(true)
if surface_exists(real_pause_surf) && state != states.unpaused 
	draw_surface_ext(real_pause_surf, 0, 0, 1, 1, 0, c_white, pause_alpha)
