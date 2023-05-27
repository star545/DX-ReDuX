var ix = (camera_get_view_width(view_camera[0]) / obj_camera.original_cam_width)
var iy = (camera_get_view_height(view_camera[0]) / obj_camera.original_cam_height)
for (var i = 0; i < array_length(backgrounds); i++)
{
	var n = backgrounds[i]
	var lay_id = layer_background_get_id(layer_get_id(n))
	layer_background_xscale(lay_id, ix)
	layer_background_yscale(lay_id, iy)
}

var _cam_y = camera_get_view_y(view_camera[0])
var camera = new camera_get_position_struct(view_camera[0])
var _cam_width  = camera_get_view_width(view_camera[0]);
var _cam_height = camera_get_view_height(view_camera[0]);
var centercamx = camera.cam_x + (_cam_width / 2)
var centercamy = _cam_y + (_cam_height / 2)
var room_size_normal = room_width / 3 
var cam_x = clamp(obj_player1.x mod room_size_normal, 0, room_size_normal) 
var cam_addition = global.arena_scroll * room_size_normal

// Normal Parallax
var arr = [0.18, 0.19, 0.2]
var i = 0, _l = 0, _varx = 0, _vary = 0
for (i = 0; i < array_length(arr); i++) {
	_l = concat("Backgrounds_", i + 1)
	_varx = variable_instance_get(id, concat("bg_", i + 1, "xoffset"))
	_vary = variable_instance_get(id, concat("bg_", i + 1, "yoffset"))
	var _xx = cam_x * arr[i]
	layer_x(_l, _varx + _xx + cam_addition)
	layer_y(_l, _vary + (_cam_y * arr[i]))	
}
/*
// Horizontal Still Parallax
arr = [0.12, 0.15, 0.175, 0.20]
for (i = 0; i < array_length(arr); i++) {
	_l = concat("Backgrounds_stillH", i + 1)
	_varx = variable_instance_get(id, concat("bg_stillH", i + 1, "xoffset"))
	_vary = variable_instance_get(id, concat("bg_stillH", i + 1, "yoffset"))
	layer_x(_l, _varx + (camera.cam_x * arr[i]))
	layer_y(_l, _vary + (_cam_y - parallax_clamp_bg(_cam_y, arr[i], _l, true)))	
	//var a = 
}


if sprite_details != -4 {
for (i = 0; i < array_length(sprite_details); i++) {
	var _ass = sprite_details[i]
	var _px = (centercamx - _ass._x) * 0.15
	var _py = (centercamy - _ass._y) * 0.15
	layer_sprite_x(_ass._id, _ass._x + _px)
	layer_sprite_y(_ass._id, _ass._y + _py)	
}
}

//layer_x("Backgrounds_1", (bg_1xoffset + (camera.cam_x * 0.18)))
//layer_y("Backgrounds_1", (bg_1yoffset + (_cam_y * 0.18)))
//layer_x("Backgrounds_2", (bg_2xoffset + (camera.cam_x * 0.19)))
//layer_y("Backgrounds_2", (bg_2yoffset + (_cam_y * 0.19)))
//layer_x("Backgrounds_3", (camera.cam_x * 0.2))
//layer_y("Backgrounds_3", (_cam_y * 0.2))
layer_x("Backgrounds_Ground1", (camera.cam_x * 0.2))
layer_x("Backgrounds_Ground2", (camera.cam_x * 0.18))
layer_x("Backgrounds_Ground3", (camera.cam_x * 0.16))
layer_x("Backgrounds_H1", (camera.cam_x * 0.11))
layer_y("Backgrounds_H1", _cam_y)
layer_x("Backgrounds_sky", (camera.cam_x * 0.25))
layer_y("Backgrounds_sky", (_cam_y * 0.25))
layer_x("Backgrounds_sky2", camera.cam_x)
layer_y("Backgrounds_sky2", _cam_y)
layer_x("Backgrounds_still1", ((bg_still1xoffset + camera.cam_x) - clamp((camera.cam_x * (0.15 * (960 / room_width))), 0, (sprite_get_width(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_still1")))) - 960))))
layer_y("Backgrounds_still1", ((bg_still1yoffset + _cam_y) - clamp((_cam_y * (0.15 * (540 / room_height))), 0, (sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_still1")))) - 540))))
layer_x("Backgrounds_still2", ((bg_still2xoffset + camera.cam_x) - clamp((camera.cam_x * (0.25 * (960 / room_width))), 0, (sprite_get_width(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_still1")))) - 960))))
layer_y("Backgrounds_still2", ((bg_still2yoffset + _cam_y) - clamp((_cam_y * (0.25 * (540 / room_height))), 0, (sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_still1")))) - 540))))
layer_x("Backgrounds_stillscroll", (((bg_still1xoffset + bg_scrollx) + camera.cam_x) - clamp((camera.cam_x * (0.15 * (960 / room_width))), 0, (sprite_get_width(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_stillscroll")))) - 960))))
layer_y("Backgrounds_stillscroll", (((bg_still1yoffset + bg_scrolly) + _cam_y) - clamp((_cam_y * (0.15 * (540 / room_height))), 0, (sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_stillscroll")))) - 540))))
//layer_x("Backgrounds_stillH1", (bg_stillH1xoffset + (camera.cam_x * 0.15)))
//layer_y("Backgrounds_stillH1", (bg_stillH1yoffset + (_cam_y - clamp((_cam_y * (0.15 * (540 / room_height))), 0, (sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_stillH1")))) - 540)))))
//layer_x("Backgrounds_stillH2", (bg_stillH2xoffset + (camera.cam_x * 0.20)))
//layer_y("Backgrounds_stillH2", (bg_stillH2yoffset + (_cam_y - clamp((_cam_y * (0.15 * (540 / room_height))), 0, (sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_stillH2")))) - 540)))))
layer_x("Backgrounds_scroll", (((camera.cam_x * 0.25) + bg_scrollx) + bg_scrollxoffset))
layer_y("Backgrounds_scroll", (((_cam_y * 0.25) + bg_scrolly) + bg_scrollyoffset))
bg_scrollx += layer_get_hspeed("Backgrounds_scroll")
bg_scrolly += layer_get_vspeed("Backgrounds_scroll")
bg_scrollx += layer_get_hspeed("Backgrounds_stillscroll")
bg_scrolly += layer_get_vspeed("Backgrounds_stillscroll")
layer_x("Backgrounds_scroll2", (((camera.cam_x * 0.25) + bg_scroll2x) + bg_scroll2xoffset))
layer_y("Backgrounds_scroll2", (((_cam_y * 0.25) + bg_scroll2y) + bg_scroll2yoffset))
bg_scroll2x += layer_get_hspeed("Backgrounds_scroll2")
bg_scroll2y += layer_get_vspeed("Backgrounds_scroll2")


layer_x("Foreground_1", (camera.cam_x * -0.35))
layer_y("Foreground_1", (_cam_y * -0.35))
layer_x("Foreground_H1", (camera.cam_x * -0.35))
layer_y("Foreground_H1", _cam_y - parallax_clamp_bg(_cam_y, -0.35, "Foreground_H1", true))
//layer_y("Backgrounds_stillH1", (bg_stillH1yoffset + (_cam_y - clamp((_cam_y * (0.15 * (540 / room_height))), 0, (sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id("Backgrounds_stillH1")))) - 540)))))

layer_x("Foreground_Ground1", (camera.cam_x * 0.15))
layer_y("Foreground_Ground1", (room_height - sprite_get_height(layer_background_get_sprite(layer_background_get_id(layer_get_id("Foreground_Ground1"))))))
