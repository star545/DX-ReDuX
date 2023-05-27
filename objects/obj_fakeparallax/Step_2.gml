if (live_call()) {
	trace("RELOAD") 
	return live_result;
}
var camera = new camera_get_position_struct(view_camera[0])
var room_size_normal = room_width / 3
cam_x = camera.cam_x * 0.15
cam_x += global.arena_scroll * room_size_normal