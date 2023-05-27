sprite_index = choose(spr_gerome_idle1, spr_gerome_idle2, spr_gerome_idle3)
image_speed = 0.35

switch (sprite_index) {
	
	case spr_gerome_idle1:
	dialog = [
	create_dialogue("My doc says I gotta start walkin' round more, parently' it's cause only a third of my time is workin', the rest eatin' and sleepin'.",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("Some bull I say.  Can't even take a trip round' cause them damn punks by China Town keep messin' with me.",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("They look like crawdaddys, so be careful y'all.",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	]
	break;
	
	case spr_gerome_idle2:
	dialog = [
	create_dialogue("* Smack *"),
	create_dialogue("Hey, let ol' Gerome tell you a quick tale before y'all yonder off.  I was layin' bout at the fair right?",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("Cleanin' up puke near the cahbins and whatnot, when I kept hearin' this snorin'.",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("* Chomp * Beats me what it was, whatever the beast is, sounds like a Louisiana guard dog...  Or gators as y'all call em'.",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	]
	break;
	
	case spr_gerome_idle3:
	dialog = [
	create_dialogue("Zzzzz...",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("Snore ...",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("Mmmph, beignets...",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	]
	break;
	
	
	
	
}