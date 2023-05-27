function scr_player_shotgunshoot()
{
	image_speed = 0.4
	move = (key_left + key_right)
	hsp = ((xscale * movespeed) + (railmovespeed * raildir))
	if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))))
		movespeed = 0

	if (floor(image_index) == (image_number - 1))
	{
		railmovespeed = 0
		if movespeed >= 12 && key_attack && move != -xscale {
			state = states.mach3
			sprite_index = spr_mach4	
		}
		else if movespeed > 8 && key_attack && move != -xscale {
			state = states.mach2	
			sprite_index = spr_mach	
		} else if grounded {
			state = states.normal
			hsp = 0	
			movespeed = 2
		}
		else {
			state = states.jump
			hsp = 0	
			movespeed = 2
		}
		if (move == (-xscale) && state != states.mach3 && state != states.mach2)
		{
			xscale = move
			dir = xscale
			movespeed = abs(movespeed)
			momemtum = 1
		}
	}
	if key_jump
		input_buffer_jump = 0
	if key_slap2
		input_buffer_slap = 0
	if (key_shoot2 && image_index > (image_number - 3))
		scr_shotgunshoot()
	exit;
}

