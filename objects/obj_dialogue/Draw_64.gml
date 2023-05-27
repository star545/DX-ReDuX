

draw_set_font(font_console)
draw_set_halign(fa_left)
draw_set_color(c_white)
//draw_set_alpha = image_alpha
var curMsg = global.dialogmsg[current_message]
var dialogLength = array_length(global.dialogmsg)
var _text = curMsg[0]
var _textLength = string_length(_text)
var _portrait = curMsg[1]
var _sound = curMsg[2]
var _func = curMsg[3]
var hasImage = _portrait != -4

if !surface_exists(surface)
	surface = surface_create(760, 100)
else {	
	surface_set_target(surface)
	draw_sprite_tiled_ext(is_pizzaboyroom() || _portrait == spr_pizzaboyportrait ? spr_pizzaboydialog : bg_dialog, -1, ax++, ay++, 1, 1, c_white, 0.5)
	surface_reset_target()
	draw_surface(surface, 100, 400 + yoffset)
	draw_sprite(spr_border, 0, 100, 400 + yoffset)
}

var _textX = 110
var _textY = 415 + yoffset

if hasImage {
	draw_sprite_ext(_portrait, -1, 100, 450 + yoffset, 1, 1, 0, c_white, 1)
	_textX = 210	
}
var _wrapX = 760 - _textX - 10
if !hasImage _wrapX += 100


var txt = scribble(_text).wrap(_wrapX)
txt.draw(_textX, _textY, typer)
var _xoffset = 0, _yoffset = 0
