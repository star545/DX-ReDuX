function scr_get_music_loop(snd) {
	if !audio_is_playing(snd) return 0;
	var file = asset_get_index(audio_get_name(snd))
	switch file {
		default: return 0; break;
		case mu_beach: return 2.081; break;
		case mu_forest: return 11.285; break;
		case mu_hub:
		case mu_hub3: 
		case mu_hub5:
		return 18.938; 
		break;
		case mu_war: return 42.39 break;
		case mu_tombstone:	 return 117.79 break;
		
		
	}
}