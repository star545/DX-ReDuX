if visible {
	if (other.state == states.gotoplayer)
		exit;
	if (sprite_index == spr_boxcrusher_fall)
	{
		other.image_index = 0
		other.state = states.bump
		other.x = x
		other.y = y
	}
	else if (sprite_index == spr_boxcrusher_land)
	{
		if (other.state != states.boxxedpep)
		{
			var myKey1 = get_control_string(global.key_jump)
			var myKey2 = get_control_string(global.key_slap)
			scr_controlprompt("[spr_buttonfont]" + myKey1 + "[spr_promptfont] Flap   [spr_buttonfont]" + myKey2 + "[spr_promptfont] Spin")
			tv_push_prompt_once(tv_create_prompt("This is the boxxed transformation text", tvprompt.transfo, spr_tv_boxxedpep, 3), "boxxedpep")
		}
		other.boxxed = 1
		other.movespeed = 0
		other.state = states.boxxedpep
		if (other.sprite_index != other.spr_boxxedpepintro)
			other.sprite_index = other.spr_boxxedpepintro
		other.image_index = 0
		other.hsp = 0
		other.vsp = 0
		other.x = x
		other.y = (y - 20)
	}
}