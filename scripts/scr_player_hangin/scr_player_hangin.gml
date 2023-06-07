
function scr_player_hangin() {
	image_speed = 0.35
	xscale = sign(instance_nearest(x, y, obj_hanginstart).image_xscale)
	if sprite_index == spr_player_hang || input_buffer_jump2 == 0 {
		input_buffer_jump2 = 0
		vsp = -10
		if (movespeed < 14)
			{
				movespeed = 14
				hsp = (xscale * movespeed)
			}
		state = states.mach2
	}
	// oh boy oh gee i really hope this works and doesnt spawn a Truck andh its me with it
}