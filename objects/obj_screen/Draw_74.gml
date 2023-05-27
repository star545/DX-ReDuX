#region Draw Screen
	//Scaling 
	var surfW = 960;
	var surfH = 540;	

	//Ghost Surface
	if !surface_exists(finalApplicationSurface) {
		finalApplicationSurface = surface_create(960, 540);
		if (buffer_exists(finalApplicationSurfBuffer)) {
			buffer_set_surface(finalApplicationSurfBuffer, finalApplicationSurface, 0);
		}
	}
	
	#region Shader Effects
	var shader = noone;
	var appa = 1;

	
	#endregion
	
	//Draw Application Surface
	if (obj_pause.state == states.unpaused) {
		surface_set_target(finalApplicationSurface)

			gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
			draw_surface_stretched_ext(application_surface, 0, 0, 960, 540, c_white, appa);
			gpu_set_blendmode(bm_normal);
			
		shader_reset();	
	
		surface_reset_target();
		if (buffer_exists(finalApplicationSurfBuffer)) 
			buffer_set_surface(finalApplicationSurfBuffer, finalApplicationSurface, 0);
	}
	

	draw_surface_stretched_ext(finalApplicationSurface, 0, 0, surfW, surfH, c_white, 1)
	
	
	// Save to Buffer.
	if (!buffer_exists(finalApplicationSurfBuffer)) {
		finalApplicationSurfBuffer = buffer_create(surfW * surfH * 4, buffer_fixed, 1);
	}
	if (obj_pause.state != states.unpaused) {
		buffer_get_surface(finalApplicationSurfBuffer, finalApplicationSurface, 0);
	}
	
#endregion