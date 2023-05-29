with (other)
{
	if (state != states.antigrav && !isgustavo)
	{
		state = states.antigrav
		vsp = 0
		scr_soundeffect(sfx_antigravstart)
		with (obj_antigravbubble)
		{
			if (playerid == other.id)
				instance_destroy()
		}
		with (instance_create(x, y, obj_antigravbubble))
			playerid = other.id
		other.image_index = 0
		other.sprite_index = spr_antigrav_activate
		var myKey1 = get_control_string(global.key_jump)
		scr_controlprompt("[spr_buttonfont]" + myKey1 + "[spr_promptfont] Jump Out")
	}
}