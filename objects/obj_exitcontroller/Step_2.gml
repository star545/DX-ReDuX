/*
var time = audio_sound_get_track_position(obj_music.musicID)
var current_sync = music_sync[cur_music_sync]
var sync_length = array_length(music_sync) - 1
var nextTime = current_sync[0]
var nextFunc = current_sync[1]
if time >= nextTime && obj_music.music == mu_finalescape {
	if cur_music_sync < sync_length
		cur_music_sync++
	if nextFunc != -4
		nextFunc()
	
}