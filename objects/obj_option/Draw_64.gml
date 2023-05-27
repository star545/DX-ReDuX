
	draw_rectangle_color(0, 0, 960, 540, c_black, c_black, c_black, c_black, 0)
draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
var pad = 48
var option_length = array_length(options)
var _h = string_height("A")
var total_height = (pad) * option_length
for (var i = 0; i < array_length(options); i++) {
	var cur_option = options[i]	
	var name = cur_option.title
	var op_selected = cur_option.selected
	var input = cur_option.suboptions
	if is_array(input)
		name += concat(" - ", input[op_selected].title)
	var _w = string_width(name) / 2
	var c = c_gray
	var yy = (270 - (total_height / 2) + (pad * i))
	yy = (270 - (total_height / 2) + (pad * i))
	if (array_selected == i)
	{
		c = c_white
		//draw_sprite(spr_cursor, cursor_index, (xx - 48 - _w), (yy + (cursor_sprite_height / 2)))
	}
	draw_text_color(480, yy, name, c, c, c, c, 1)
	var tgt = 0
	txt_y = Approach(txt_y, tgt, 0.5)
	
	
}

/*
var _os = optionselected
var _os_fs = optionsaved_fullscreen
draw_text_colour(480, 50, "FULLSCREEN", c_white, c_white, c_white, c_white, (_os == 0 ? 1 : 0.5))
draw_text_colour(380, 100, "ON", c_white, c_white, c_white, c_white, (_os_fs == 0 ? 1 : 0.5))
draw_text_colour(580, 100, "OFF", c_white, c_white, c_white, c_white, (_os_fs == 1 ? 1 : 0.5))
var _os_rs = optionsaved_resolution
draw_text_colour(480, 180, "RESOLUTION", c_white, c_white, c_white, c_white, (_os == 1 ? 1 : 0.5))
draw_text_colour(300, 230, concat(480, "X", 270), c_white, c_white, c_white, c_white, (_os_rs == 0 ? 1 : 0.5))
draw_text_colour(480, 230, concat(960, "X", 540), c_white, c_white, c_white, c_white, (_os_rs == 1 ? 1 : 0.5))
draw_text_colour(680, 230, concat(1920, "X", 1080), c_white, c_white, c_white, c_white, (_os_rs == 2 ? 1 : 0.5))
draw_text_colour(480, 295, "KEY CONFIG", c_white, c_white, c_white, c_white, (_os == 2 ? 1 : 0.5))
draw_text_colour(480, 345, "AUDIO CONFIG", c_white, c_white, c_white, c_white, (_os == 3 ? 1 : 0.5))
var _os_vb = optionsaved_vibration
draw_text_colour(480, 410, "CONTROLLER VIBRATION", c_white, c_white, c_white, c_white, (_os == 4 ? 1 : 0.5))
draw_text_colour(380, 460, "ON", c_white, c_white, c_white, c_white, (_os_vb == 0 ? 1 : 0.5))
draw_text_colour(580, 460, "OFF", c_white, c_white, c_white, c_white, (_os_vb == 1 ? 1 : 0.5))
