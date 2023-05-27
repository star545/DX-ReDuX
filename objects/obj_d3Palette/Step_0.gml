char = obj_pause.selected_char
var _cam_x = camera_get_view_x(view_camera[0])
var _cam_y = camera_get_view_y(view_camera[0])
var _mouse_x = (mouse_x - _cam_x)
var _mouse_y = (mouse_y - _cam_y)
with obj_pause {
	if char_options[selected_char].sel_pal == 0 other.visible = true
	else other.visible = false
	if custom_paletting other.image_alpha = 1
	else other.image_alpha = 0.6
	if selected_page != 4
		instance_destroy(other)

}
if active {
	scr_getinput()
	var move_h = key_left + key_right
	var move_v = key_down2 - key_up2
	var changing = key_jump2
	move_h_delay = Approach(move_h_delay, 0, 1)
	move_v_delay = Approach(move_v_delay, 0, 1)
	if move_h != 0 {
		if changing {
			if move_h_delay = 0 {
				switch rgb_sel {
					case 0: 
						global.color_array[char][slot_sel][chosen_color].r += move_h 
						global.color_array[char][slot_sel][chosen_color].r = clamp(global.color_array[char][slot_sel][chosen_color].r, 0, 255)
					break
					case 1: 
						global.color_array[char][slot_sel][chosen_color].g += move_h 
						global.color_array[char][slot_sel][chosen_color].g = clamp(global.color_array[char][slot_sel][chosen_color].g, 0, 255)
					break
					case 2: 
						global.color_array[char][slot_sel][chosen_color].b += move_h 
						global.color_array[char][slot_sel][chosen_color].b = clamp(global.color_array[char][slot_sel][chosen_color].b, 0, 255)
					break

				}
				move_h_delay = 4
			}
			
		} else {
			if move_h_delay == 0 {
				slot_sel += move_h
				if slot_sel = array_length(global.color_array[char]) {
					with obj_pause {
						char_options[selected_char].sel_pal = 1	
						custom_paletting = false
					}
					active = false
					
				}
				slot_sel = clamp(slot_sel, 0, array_length(global.color_array[char]) - 1)
				move_h_delay = 30
				with obj_pause char_offset_x = move_h * 100
				
			}
			
		}
		
	} else 
		move_h_delay = 0
		
	if move_v != 0 {
		if changing {
			rgb_sel += move_v
			rgb_sel = clamp(rgb_sel, 0, 2)
			move_v_delay = 3
			
		} else {
			chosen_color += move_v
			var l = array_length(global.color_array[char][slot_sel]) - 1
			chosen_color = clamp(chosen_color, 0, l)
			move_v_delay = 30
		}
		
	} else 
		move_v_delay = 0
		
	if mouse_check_button_pressed(mb_left)
	{
	    if point_in_rectangle(_mouse_x,_mouse_y,Import.x - 28,Import.y - 25,Import.x + 28,Import.y + 28)
		{
			Import.active = true;
			if Import.active
			event_user(0);
		}
	    if point_in_rectangle(_mouse_x,_mouse_y,Export.x - 28,Export.y - 25,Export.x + 28,Export.y + 28)
		{
			Export.active = true;
			if Export.active
			event_user(1);
		}
	}	
		
	
	
}