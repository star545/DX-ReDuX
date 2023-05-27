var cam = new camera_get_position_struct(view_camera[0])
for (var i = 0; i < array_length(global.secret_layers); i++) {
	var a = global.secret_layers[i]
	if !surface_exists(a.surf) {
		a.surf = surface_create(960, 540)
		
	} else if layer_exists(global.secret_layers[i].nm) {
		surface_set_target(a.surf)
		draw_clear_alpha(c_white, 0);
		var tilemap = layer_tilemap_get_id(global.secret_layers[i].nm);
		draw_tilemap(tilemap, -cam.cam_x, -cam.cam_y)
		surface_reset_target()
		draw_surface_ext(a.surf, cam.cam_x, cam.cam_y, 1, 1, 0, c_white, a.alpha)
		
	}
	
}
/*

if surface_exists(secret_surface) {
	surface_set_target(secret_surface);
	
	//gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
	if array_length(global.secret_layers) > 0 {
		for (var i = 0; i < array_length(global.secret_layers); i++) {
			
			var tilemap = layer_tilemap_get_id(global.secret_layers[i, 0]);
			draw_set_alpha(0.5)
			draw_tilemap(tilemap, 0, 0)
			draw_set_alpha(1)
		}
	}
	gpu_set_blendmode(bm_normal);	
	surface_reset_target();	
	draw_surface(secret_surface, 0, 0)
} else {
	surface_create(room_width, room_height)	
}