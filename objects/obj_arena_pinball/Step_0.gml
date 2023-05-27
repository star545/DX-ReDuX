var cam = new camera_get_position_struct(view_camera[0])
var mx = mouse_x
var my = mouse_y
switch state {
	case states.normal:
		hsp = xscale * movespeed
		//if sign(hsp) != 0 xscale = sign(hsp)
		if point_in_rectangle(mx, my, bbox_left, bbox_top, bbox_right, bbox_bottom) && mouse_check_button_pressed(mb_left) {
			state = states.grabbed	
			
		}
		if keyboard_check_pressed(ord("D")) vsp = -50
		if place_meeting_solid(x + hsp, y) && (!groundedSlope || place_meeting_solid(x + hsp, y - 16)) { 
			movespeed *= 0.7
			xscale *= -1
			
		}
		if grounded {
			if storedvsp > 3 vsp = storedvsp * -0.7
			//hsp = Approach(hsp, 0, 0.05)	
		} else storedvsp = vsp
		var _slope = instance_place(x, y + 1, obj_slope)
		var angel = 0
		var add = 0
		var multiplier = 1
		if _slope != -4 {
			angel = abs(_slope.image_yscale / _slope.image_xscale)
			add = sign(_slope.image_xscale) == -sign(hsp) ? 1 : -1
			hsp += (0.3 * add * angel)
		}

		scr_collision()
	break
	case states.grabbed:
		x = mx
		y = my
		var x_diff = x - xprevious
		var y_diff = y - yprevious
		if !mouse_check_button(mb_left) {
			state = states.normal
			if sign(x_diff) != 0 xscale = sign(x_diff)
			hsp = x_diff
			vsp = y_diff
			
		}
	
	break
	
}
