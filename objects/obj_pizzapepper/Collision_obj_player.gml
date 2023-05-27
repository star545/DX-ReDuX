if (visible == true && other.state != states.cheeseball)
{
	if audio_is_playing(sfx_collecttopping)
		audio_stop_sound(sfx_collecttopping)
	scr_soundeffect(sfx_collecttopping)
	scr_soundeffect(sfx_woosh)
	scr_soundeffect(sfx_jetpackjump)
	visible = false
	repeat (6)
		instance_create(x, y, obj_slimedebris)
	with (other)
	{
		vsp = -14
		state = states.jetpackjump
		jetpackdash = 0
		jetpackbounce = 0
		sprite_index = spr_player_jetpackstart
		doublejump = 0
		movespeed = hsp
		with (instance_create(x, y, obj_highjumpcloud2))
			sprite_index = spr_player_firemouthjumpdust
	}
	timetovisible = 100
}
