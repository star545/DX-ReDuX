/// @description Loop Audio
if (audio_is_playing(Audio)) {

	if (audio_sound_get_track_position(Audio) >= audio_sound_length(Audio) - Transition_delay)
		audio_sound_set_track_position(Audio, LoopBegin);
}
else {
    instance_destroy();
}