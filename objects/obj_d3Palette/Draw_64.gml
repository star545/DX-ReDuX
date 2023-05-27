/// @description Insert description here
// You can write your code in this editor
var _cam_x = camera_get_view_x(view_camera[0])
var _cam_y = camera_get_view_y(view_camera[0])
var _mouse_x = (mouse_x - _cam_x)
var _mouse_y = (mouse_y - _cam_y)
draw_set_font(global.font_small)
//draw_set_alpha(image_alpha)
for (var b = 0; b < 3; b++) {
	var bar_width = 300
	var bar_height = 24
	var _sx = 480
	var _sy = 150
	var pad = 50
	var bar_tH = 220 - ((bar_height + (3 * pad)) / 2)
	//var top_x = draw_x - sprite_get_xoffset(spr_palettescrollbar),top_y = draw_y - sprite_get_yoffset(spr_palettescrollbar), bottom_x = draw_x + sprite_get_xoffset(spr_palettescrollbar),bottom_y = draw_y + sprite_get_yoffset(spr_palettescrollbar);
	var _xL = _sx,
	var _xR = _sx + bar_width - 7
	var _yT = bar_tH + bar_height + (b * pad)
	var _yB = bar_tH - 7 + (2 *bar_height) + (b * pad)
	var c = [c_red, c_green, c_blue]
	draw_sprite(spr_palettescrollbar, 0, _sx, bar_tH + (bar_height + (b * pad)))
	draw_rectangle_color(_xL, _yT, _xR, _yB, c_black, c[b], c[b], c_black, 0)
	var _str = ""
	switch b {
		case 0: _str = global.color_array[char][slot_sel][chosen_color].r  break
		case 1: _str = global.color_array[char][slot_sel][chosen_color].g  break
		case 2: _str = global.color_array[char][slot_sel][chosen_color].b  break	
	}
	var _xx = lerp(_xL, _xR, (_str / 255))
	draw_sprite(spr_pal_scrollbar, 0, _xx, lerp(_yT, _yB, 0.5))
	draw_set_color(b = rgb_sel ? c_white : c_gray)
	draw_text(_xR + 100, _yT, _str)
	var check_m = point_in_rectangle(_mouse_x, _mouse_y, _xL - 6, _yT, _xR + 6, _yB) &&  mouse_check_button(mb_left) && active
	if check_m {
		var relative_x = _mouse_x - _xL
		var a = _xR - _xL
		relative_x = clamp(relative_x, 0, a) / (_xR - _xL)
		var set = round(relative_x * 255)
		switch b {
			case 0: global.color_array[char][slot_sel][chosen_color].r = set break
			case 1: global.color_array[char][slot_sel][chosen_color].g = set break
			case 2: global.color_array[char][slot_sel][chosen_color].b = set break
		}
	}
}

var height = max(sprite_get_height(spr_peppalette),sprite_get_height(spr_guspalette),sprite_get_height(spr_noisepalette))
var _pal = get_chardetail("palette",,char)
if !surface_exists(prev_pal)
	surface_create(2, height)
else {
	surface_set_target(prev_pal)	
	draw_clear_alpha(c_white,0)
	pal_swap_draw_palette(_pal,0,0,0)
	pal_swap_draw_palette(_pal, 1,1,0)
	var p = 0
	var arr = global.color_array[char][slot_sel]
	for (var i = 0; i < array_length(arr); i++) {
		var c = make_color_rgb(arr[i].r, arr[i].g, arr[i].b)
		draw_point_color(1, i, c)	
		
	}
	surface_reset_target();	
	var total_height = sprite_get_height(_pal) * 20
	draw_surface_ext(prev_pal, 340, 220 - (total_height / 2), 20, 20, 0, c_white, 1)
	draw_sprite(spr_pal_chosen, 0, 340, 220 - (total_height / 2) + (20 * chosen_color))
	
	
}
draw_set_color(c_white)
draw_sprite_ext(spr_pal_import,0,Import.x,Import.y,1,1,0,c_white,1);
draw_text(Import.x - 100, Import.y, "IMPORT PALETTE")
draw_sprite_ext(spr_pal_export,0,Export.x,Export.y,1,1,0,c_white,1);
draw_text(Export.x - 100, Export.y, "EXPORT PALETTE")
