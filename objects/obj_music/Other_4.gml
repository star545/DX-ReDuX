for (var i = 0; i < array_length(room_arr); i++) {
	var b = room_arr[i]
	//show_debug_message("Var B" + string(b))
	if (room == b[0]) {
		room_details = b
		break;
	}
}

// Entrance Music
if room_details[0] == entrance_1 {
	var prev_song = room_details[1]
	var a = get_chardetail("music", "entrance")
	var b = get_chardetail("music", "entrance_secret")
	room_details[1] = a[0]
	room_details[2] = b[0]
	if prev_song != room_details[1] force_cont = true	
}

if (!global.panic && room != timesuproom && room != rank_room && !instance_exists(obj_endlevelfade))
{
	
	
	if room == forest_G1 && obj_player1.isgustavo && !forest_progress forest_progress = 1
	
	var _song = room_details[1]
	if array_length(room_details) > 4 {
		_song = room_details[4]()	
		
	}
	// dhgfgfggfdgfdgdfgfdfg
	if _song == noone && music == mu_street _song = mu_street
	// Forest Progress
	//if _song == mu_forestOld && forest_progress _song = mu_forest
	// Death Mode
	if obj_player.character == (characters.pizzelle) {
		if global.death_mode _song = mu_sucrose
	}
	else if global.death_mode && obj_player.character != characters.snick _song = mu_deathmode
	if global.death_mode && !global.panic && obj_player.character == characters.snick _song = mu_snickchallenge
	// Set Song
	if music != _song
	{
		music = _song
		prevmuID = global.music
		var cur_mus_pos = audio_sound_get_track_position(prevmuID) / audio_sound_length(prevmuID)

		global.music = scr_music(music)
		var set_mus_pos = cur_mus_pos * audio_sound_length(global.music)
		if room_details[3] || force_cont
			audio_sound_set_track_position(global.music, set_mus_pos)
		if audio_is_playing(prevmuID) {
			audio_sound_gain(prevmuID, 0, 500)	
			audio_sound_gain(global.music, 0, 0)	
			audio_sound_gain(global.music, ((audio_sound_get_gain(music) * 0.8) * global.option_music_volume), 500)	
		} else audio_sound_gain(global.music, ((audio_sound_get_gain(music) * 0.8) * global.option_music_volume), 0)	
		//audio_stop_sound(prevmuID)
		
		audio_stop_sound(global.secretmusic)
		audio_stop_sound(pillarmusicID)
		global.secretmusic = -4
			
	}
	force_cont = false
	if instance_exists(obj_hungrypillar)
	{
		pillarmusicID = scr_music(mu_dungeondepth)
		audio_sound_gain(pillarmusicID, 0, 0)
	}
}

if secret
{
	global.secretmusic = scr_music(room_details[2])
	var cur_pos = audio_sound_get_track_position(global.music) / audio_sound_length(global.music)
	var set_secret_pos = cur_pos * audio_sound_length(global.secretmusic)
	audio_sound_set_track_position(global.secretmusic, set_secret_pos)
	audio_pause_sound(global.music)
	scr_soundeffect(sfx_secretfound)
}
else if secretend
{
	secretend = 0
	audio_resume_sound(global.music)
	audio_stop_sound(global.secretmusic)
}

if (room == rank_room)
{
	audio_stop_sound(global.music)
	audio_stop_sound(global.secretmusic)
	audio_stop_sound(pillarmusicID)
	global.music = -4
	global.secretmusic = -4
	pillarmusicID = -4
}
if global.death_mode && !global.panic && obj_player.character == characters.snick _song = mu_snickchallenge
if global.death_mode && global.panic && obj_player.character == characters.snick _song = mu_snickchallengeend
global.musicstr = string(audio_get_name(music))