/// @description Draw TextBox
if bubble_spr != noone
	draw_sprite_ext(bubble_spr, bubble_index, x, y - 20, 1, 1, 0, c_white, 0.75)

var cur_msg = text_array[message_pos]
var cur_txt = cur_msg[0]
draw_set_font(global.font_small)
if active {
	var start_x = x - 200
	var end_x = x + 170
	var _sx = start_x
	//var total_height = string_height_ext(cur_txt, 400, 0)
	var _sy = y - 200
	draw_set_color(c_black)
	
	var txt = scribble(cur_txt).wrap(400)
	txt.draw(start_x, _sy, typer)
		
}
	