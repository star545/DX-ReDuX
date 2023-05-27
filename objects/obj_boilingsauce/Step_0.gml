if (room == rm_editor)
	exit;
var playerid = instance_place(x, (y - 1), obj_player)
with (playerid)
{
	if (character == "V")
		scr_hurtplayer(id)
	else if (state != states.boots && state != states.gameover && state != states.rideweenie && state != states.gotoplayer)
	{
		var _pindex = (object_index == obj_player1 ? 0 : 1)
		GamepadSetVibration(_pindex, 1, 1, 0.85)
		if (state != states.fireass)
			tv_push_prompt_once(tv_create_prompt("This is the fireass transformation text", tvprompt.transfo, spr_tv_fireass, 3), "fireass")
		state = states.fireass
		vsp = -20
		sprite_index = spr_fireass
		image_index = 0
		movespeed = hsp
		if isgustavo
		{
			sprite_index = spr_lonegustavo_fireass
			if brick {
				brick = 0
				with (instance_create(x, y, obj_brickcomeback))
				{
					wait = 1
					instance_create(x, y, obj_genericpoofeffect)
				}
			}
		}
		var snd = sfx_scream5
		if obj_player1.character == characters.pizzelle && !obj_player1.isgustavo snd = sfx_ss_fireass
		if !audio_is_playing(snd) scr_soundeffect(snd)
	}
}
