if radius >= 960 {
	if surface_exists(surf) surface_free(surf)
	
	exit;
}
if !surface_exists(surf) surf = surface_create(960, 540)
else {
	surface_set_target(surf)
	draw_clear_alpha(c_black, 0.8)
	gpu_set_blendmode(bm_subtract)
	draw_set_color(c_black)
	draw_circle(x, y, radius, 0)
	gpu_set_blendmode(bm_normal)
	draw_set_color(c_white)
	surface_reset_target()
	draw_surface(surf, 0, 0)
}