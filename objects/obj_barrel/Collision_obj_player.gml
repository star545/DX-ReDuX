if active
{
	if (place_meeting(x, (y - 1), other) && other.vsp > 1 && other.state != states.barrel && other.state != states.barrelslide && other.state != states.barreljump && other.state != states.barrelclimbwall)
	{
		with (other)
		{
			instance_create(x, y, obj_genericpoofeffect)
			movespeed = hsp
			state = states.barrel
			image_index = 0
			var myKey1 = get_control_string(global.key_attack)
			scr_controlprompt("[spr_buttonfont]" + myKey1 + "[spr_promptfont]Slide")
		}
		active = 0
		alarm[0] = 150
	}
}
