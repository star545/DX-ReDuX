for (var i = 0; i < trueXscale; i++) {
	var _x = x + (32 * i)
	var _y = y 
	var _solidx = x + (32 * i) + 16
	var _solidy = y + (sign(image_yscale) * 16)
	var check_x = _x + 16
	var check_y = _y + (-sign(image_yscale) * 16) //lengthdir_y(1, image_angle + (sign(image_xscale) == -1 ? 180 : 0));
	
	if !position_meeting_collision(check_x, check_y) && !place_meeting(check_x, check_y, obj_tiledestroy) && position_meeting_collision(_solidx, _solidy) {
		draw_sprite_ext(spr_cutoffV, img_array[i], _x, _y, image_xscale, image_yscale, image_angle, c_white, 1);
	}

}