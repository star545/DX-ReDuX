sprite_index = choose(spr_gerome_idle1, spr_gerome_idle2, spr_gerome_idle3)
image_speed = 0.35

switch (sprite_index) {
	
	case spr_gerome_idle1:
	dialog = [
	create_dialogue("Whoo!  Hot damn boy!",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("Sho' is hot round here.",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("Hoped y'packed some water, cause it ain't gonna' get much cooler than it is now.",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	]
	break;
	
	case spr_gerome_idle2:
	dialog = [
	create_dialogue("All you damn young ones buggin' me with y'videogame things.",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("I saw one of them new age hippies walk past me with some weird computers on his back...",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("Worst part was the fella was onna' them brits'!  Saw him mumbling bout' needing a pint.",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("C'est tout."),
	]
	break;
	
	case spr_gerome_idle3:
	dialog = [
	create_dialogue("Zzzzz...",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("Snore ...",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("Mmmph, beef jambalaya...",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	]
	break;
	
	
	
	
}