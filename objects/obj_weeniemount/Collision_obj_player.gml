with (other)
{
	if (state == states.handstandjump or state == states.punch)
	{
		state = states.rideweenie
		movespeed = hsp
		sprite_index = spr_rideweenie
		xscale = other.image_xscale
		jumpstop = 1
		if (vsp < 0)
			vsp = 0
		instance_destroy(other)
		var myKey1 = get_control_string(global.key_jump)
		scr_controlprompt("[spr_buttonfont]" + myKey1 + "[spr_promptfont] Jump Off", "weenie_controlprompt")
	}
}
