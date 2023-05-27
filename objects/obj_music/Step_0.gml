prevpillar_on_camera = pillar_on_camera
if instance_exists(obj_hungrypillar)
{
	var p = 0
	with (obj_hungrypillar)
	{
		if bbox_in_camera(view_camera[0], 0)
			p = 1
	}
	if (p != pillar_on_camera)
		pillar_on_camera = p
}
else
	pillar_on_camera = 0
if (prevpillar_on_camera != pillar_on_camera) && !global.death_mode
{
	if pillar_on_camera
	{
		audio_sound_gain(pillarmusicID, (0.6 * global.option_music_volume), 2000)
		audio_sound_gain(global.music, 0, 2000)
	}
	else
	{
		audio_sound_gain(pillarmusicID, 0, 2000)
		audio_sound_gain(global.music, (0.6 * global.option_music_volume), 2000)
	}
}

var _song = -4
if array_length(room_details) > 4 {
	_song = room_details[4]()	
	
}

if global.panic && !global.death_mode {
	var a = get_chardetail("music", music_type)
	_song = a[0]
	if escapemusic != -4 && !global.death_mode _song = escapemusic
	unforce_cont = true
} else unforce_cont = false

if global.panic && global.death_mode {
	if escapemusic != -4 && escapemusic == mu_snickchallengeend _song = escapemusic {
		unforce_cont = true
	}
} else unforce_cont = false

if audio_sound_get_gain(prevmuID) <= 0 audio_stop_sound(prevmuID)
if !global.death_mode && room != timesuproom && room != rank_room && !instance_exists(obj_endlevelfade)
{
	
	if global.strongcoldprogress == 1 _song = mu_grinch
	else if global.pinballprogress == 1 _song = mu_pinball
	else if global.kungfuprogress == 1 _song = mu_kung2
	else if global.clownprogress == 1 _song = mu_funny2
	else if global.lightsoutprogress == 1 _song = mu_graveyardOLD
	else if global.towerarenaprogress == 1 {
		_song = mu_mayhem
		shake_cam(2)
	}
	
	if (_song != -4 && music != _song && music != mu_finalescape)
	{
		/*
		music = musicksz
		audio_stop_sound(global.music)
		global.music = scr_music(music)
		if (pillarmusicID != -4)
			audio_stop_sound(pillarmusicID)
		pillarmusicID = -4
		*/
		audio_stop_sound(prevmuID)
		music = _song
		prevmuID = global.music
		var cur_mus_pos = audio_sound_get_track_position(prevmuID) / audio_sound_length(prevmuID)
		global.music = scr_music(music)
		var set_mus_pos = cur_mus_pos * audio_sound_length(global.music)
		if !unforce_cont //(room_details[3] || force_cont) && 
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
}
