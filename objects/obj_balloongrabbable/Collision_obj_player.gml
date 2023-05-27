if active
{
	if (other.isgustavo && other.brick)
	{
		other.state = states.ratmountballoon
		active = 0
		cooldown = 100
		other.balloonbuffer = 250
		var myKey1 = get_control_string(global.key_jump)
		scr_controlprompt("[spr_buttonfont]" + myKey1 + "[spr_promptfont] Boost Upward")
	}
	else if (other.isgustavo == 0)
	{
		other.state = states.balloon
		other.movespeed = other.hsp
		active = 0
		with (other)
		{
			if isgustavo
				vsp = -7
		}
		cooldown = 100
		other.balloonbuffer = 250
		var myKey1 = get_control_string(global.key_jump)
		scr_controlprompt("[spr_buttonfont]" + myKey1 + "[spr_promptfont] Let Go")
	}
}
