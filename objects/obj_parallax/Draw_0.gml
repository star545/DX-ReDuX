/// @description Parallax Drawing
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
if global.option_performance exit;
if surface_exists(global.parallaxbg_surface) && !instance_exists(obj_parrallaxOLD) {
	//surface_set_target(RealSurface);
	//if surface_exists(global.parallaxbg_surface) {
	//	//Draw BGs	
	//	if global.panic && global.panicbg {
	//		shader_set(shd_panicbg)
	//		var panic_id = shader_get_uniform(shd_panicbg, "panic")
	//		shader_set_uniform_f(panic_id, (global.wave / global.maxwave))
	//		var time_id = shader_get_uniform(shd_panicbg, "time")
	//		shader_set_uniform_f(time_id, (current_time / 1000))
	//		draw_surface_ext(global.parallaxbg_surface, -64, -64, 1, 1, 0, c_white, 1);
	//		shader_reset()
	//	} else {
	//		draw_surface_ext(global.parallaxbg_surface, -64, -64, 1, 1, 0, c_white, 1);
	//	}
	//}
	//surface_reset_target();
	#region Funny Math
	var tx,ty,rot_x,rot_y, rotation = camera_get_view_angle(view_camera[0]);

	//calculate offset of top-left corner point from origin
	tx = -(camera_get_view_width(view_camera[0]) div 2) - 64;
	ty = -(camera_get_view_height(view_camera[0]) div 2) - 64;

	//calculate rotated coordinates at angle 'rotation'
	rot_x = tx * cos(degtorad(rotation)) - ty * sin(degtorad(rotation));
	rot_y = tx * sin(degtorad(rotation)) + ty * cos(degtorad(rotation));

	//add rotated coordinates to center point
	var cam_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2
	var cam_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2
	var draw_x = (cam_x + rot_x);
	var draw_y = (cam_y + rot_y);
	var cam_width = camera_get_view_width(view_camera[0])
	var local_time = global.ScrollOffset / 60
	var cam_height = camera_get_view_height(view_camera[0])
	#endregion
	//Draw Thing
	//var shader = noone;
	draw_rectangle_color(draw_x - 128, draw_y - 128, draw_x + cam_width + 128, draw_y + cam_height + 128, c_white,c_white,c_white,c_white, 0)
	//draw_surface_ext(RealSurface, draw_x, draw_y, camera_get_view_width(view_camera[0])/960, camera_get_view_height(view_camera[0])/540, -rotation, c_white, 1);
	if use_war && !global.option_performance {
		var time = shader_get_uniform(shd_war, "time")
		var size = shader_get_uniform(shd_war, "size")
		var strength = shader_get_uniform(shd_war, "strength")
		shader_set(shd_war)
		
		shader_set_uniform_f(time, (cur_time / 3))
		shader_set_uniform_f(size, 512, 512, Wave(0, 0.8, 8, 0))
		shader_set_uniform_f(strength, Wave(0, 0.2, 5, 0))
		draw_surface_ext(global.parallaxbg_surface, draw_x, draw_y, camera_get_view_width(view_camera[0])/960, camera_get_view_height(view_camera[0])/540, -rotation, c_white, 1);
		shader_reset()
	} else if (global.panic || instance_exists(obj_johnhitstun)) && !instance_exists(obj_ghostcollectibles) && !global.option_performance {
		shader_set(shd_panicbg)
		var panic_id = shader_get_uniform(shd_panicbg, "panic")
		var time_id = shader_get_uniform(shd_panicbg, "time")
		var time_pct = (1 - (global.fill / obj_tv.chunkmax))
		var hitstun_pct = obj_player1.hitLag / 30
		var degPct = hitstun_pct * 180
		var set_sin = cos(degtorad(degPct - 90))
		if !instance_exists(obj_johnhitstun) {
			shader_set_uniform_f(panic_id, time_pct)
			shader_set_uniform_f(time_id, cur_time)
		} else {
			shader_set_uniform_f(panic_id, set_sin * 5)
			shader_set_uniform_f(time_id, set_sin)
		}
		draw_surface_ext(global.parallaxbg_surface, draw_x, draw_y, camera_get_view_width(view_camera[0])/960, camera_get_view_height(view_camera[0])/540, -rotation, c_white, 1);
		shader_reset()
	} else {
		draw_surface_ext(global.parallaxbg_surface, draw_x, draw_y, camera_get_view_width(view_camera[0])/960, camera_get_view_height(view_camera[0])/540, -rotation, c_white, 1);
	}	
	if bgflash > 0 {
		bgflash -= 0.05
		draw_set_alpha(bgflash)
		draw_rectangle_color(draw_x - 32, draw_y - 32, draw_x + cam_width + 32, draw_y + cam_height + 32, c_white,c_white,c_white,c_white, 0)
		draw_set_alpha(1)
	}
	if instance_exists(obj_johnhitstun) && room == tower_finalhallway {
		draw_sprite_tiled_ext(spr_superattack_bg, 0, 0, (-current_time / 1000), 1, 1, c_white, 1)	
		
	}
}// else {
//	RealSurface = surface_create(960, 540);
//}
