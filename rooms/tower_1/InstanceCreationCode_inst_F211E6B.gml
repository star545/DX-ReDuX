sprite_index = choose(spr_gerome_idle1, spr_gerome_idle2, spr_gerome_idle3)
image_speed = 0.35

switch (sprite_index) {
	
	case spr_gerome_idle1:
	dialog = [
	create_dialogue("Harumph!  I can't believe that those big shots are cutting my salary...",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("They say it's cause I can't find them Bonus Rooms hidden 'round this joint...",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("Do ol' Gerome a hand out and keep an eye out for em', ey?",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	]
	break;
	
	case spr_gerome_idle2:
	dialog = [
	create_dialogue("* Smack * , Ey, can't ya bother someone else?  I'm eatin' this!",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("If you want somethin' to waste y'time with, go'n over and check out round those Cheese fellas sha'.",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("* Chomp * I heard noises coming above there.  Ol' Gerome can't crack it.  * Smack * ",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	]
	break;
	
	case spr_gerome_idle3:
	dialog = [
	create_dialogue("Zzzzz...",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("Snore ...",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("Mmmph, chevrette poboys...",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	]
	break;
	
	
	
	
}