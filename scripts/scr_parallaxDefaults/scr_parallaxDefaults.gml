function defaultParallax(parallaxValueH, parallaxValueV) {
	x += camx * parallaxValueH;
	y += camy * parallaxValueV;
}

function defaultParallaxGround(parallaxValueH, parallaxValueV) {
	x += (camera_get_view_x(view_camera[0]) * parallaxValueH);
	y += (room_height - sprite_get_height(layer_background_get_sprite(layer_background_get_id(id))));
}

function defaultParallaxH(parallaxValueH, parallaxValueV) {
	x += (camera_get_view_x(view_camera[0]) * parallaxValueH);
	y += (camera_get_view_y(view_camera[0]) - clamp(camera_get_view_y(view_camera[0]) * (parallaxValueV) * (camera_get_view_height(view_camera[0]) / room_height), 0, (sprite_get_height(layer_background_get_sprite(layer_background_get_id(id))) - camera_get_view_height(view_camera[0]))));
}

function defaultParallaxV(parallaxValueH, parallaxValueV) {
	x += (camera_get_view_x(view_camera[0]) - clamp(camera_get_view_x(view_camera[0]) * (parallaxValueH) * (camera_get_view_width(view_camera[0]) / room_width), 0, (sprite_get_width(layer_background_get_sprite(layer_background_get_id(id))) - camera_get_view_width(view_camera[0]))));
	y += (camera_get_view_y(view_camera[0]) * parallaxValueV);
}

function defaultParallaxFar(parallaxValueH, parallaxValueV) {
	x += (camera_get_view_x(view_camera[0]) - clamp(camera_get_view_x(view_camera[0]) * (parallaxValueH) * (camera_get_view_width(view_camera[0]) / room_width), 0, (sprite_get_width(layer_background_get_sprite(layer_background_get_id(id))) - camera_get_view_width(view_camera[0]))));
	y += (camera_get_view_y(view_camera[0]) - clamp(camera_get_view_y(view_camera[0]) * (parallaxValueV) * (camera_get_view_height(view_camera[0]) / room_height), 0, (sprite_get_height(layer_background_get_sprite(layer_background_get_id(id))) - camera_get_view_height(view_camera[0]))));
}

function ParallaxZigZag(parallaxValueH, parallaxValueV) {
	var time = (global.ScrollOffset / 60)
	var _spd = layer_get_vspeed(id),
	var _sin = sin(cur_time) * _spd
	x += (camera_get_view_x(view_camera[0]) * parallaxValueH);
	y += ((camera_get_view_y(view_camera[0]) * parallaxValueV) + _sin);
	y -= yShift
}


// Backgrounds.

