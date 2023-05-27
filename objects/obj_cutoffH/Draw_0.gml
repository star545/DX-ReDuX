for (var i = 0; i < trueYscale; i++) {
	var _x = x 
	var _y = y + (32 * i)
	var _solidx = x + (sign(image_xscale) * 16)
	var _solidy = y + (32 * i) + 16
	var check_x = _x + (-sign(image_xscale) * 16)
	var check_y = _y + 16
	
	
	if !position_meeting_collision(check_x, check_y) && !place_meeting(check_x, check_y, obj_tiledestroy) && position_meeting_collision(_solidx, _solidy) {
		draw_sprite_ext(spr_cutoffH, img_array[i], _x, _y, image_xscale, image_yscale, image_angle, c_white, 1);
	}

	
}
