if (sprite_index != spr_mortspawn && sprite_index != spr_mortfall)
{
	with (other)
	{
		if (state != states.mort && state != states.mortjump && state != states.mortattack && state != states.morthook && state != states.ridecow)
		{
			repeat (6)
				create_debris(x, y, spr_feather)
			mortGun = true
			instance_create_unique(x, y, obj_mortfollow)
			//global.mort = true
			//movespeed = hsp
			//state = states.mort
			var myKey1 = get_control_string(global.key_jump) + get_control_string(global.key_jump)
			var myKey2 = get_control_string(global.key_shoot)
			scr_controlprompt("[spr_buttonfont]" + myKey1 + "[spr_promptfont]Double Jump   [spr_buttonfont]" + myKey2 + "[spr_promptfont] Throw")
			tv_push_prompt_once(tv_create_prompt("This is the mort powerup text", tvprompt.transfo, spr_tv_mort, 3), "mort")
			instance_destroy(other)
		}
	}
}
