function scr_player_dynamite()
{
	if grounded hsp = Approach(hsp, 0, 0.1)
	landAnim = 0
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerV_dynamitethrow)
	{
		if (key_attack && hsp != 0) {
			state = states.mach2
			if abs(hsp) >= 12 state = states.mach3
		}
		else if !grounded
			state = states.jump
		else state = states.normal
	}
	image_speed = 0.7
	exit;
}

