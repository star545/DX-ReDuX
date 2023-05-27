sprite_index = choose(spr_gerome_idle1, spr_gerome_idle2, spr_gerome_idle3)
image_speed = 0.35

switch (sprite_index) {
	
	case spr_gerome_idle1:
	dialog = [
	create_dialogue("Howdy there boy!",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("Welcome to Floor 3, the Party Capitol of the tower.",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("I hate cleanin' this place, it's like ol' New Orleans, just up the bayou, and without any of them nice beads all over.",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	]
	break;
	
	case spr_gerome_idle2:
	dialog = [
	create_dialogue("* Smack *",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("Hey boy, I'm in deep dish trouble bad now.  * Chomp * ",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("I lost my keys to that damn washroom, think I was pick-pocketed while playin' some games.",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("* Smack * , I knew them damn burgers was shady.  Be careful round those parts y'hear?",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	]
	break;
	
	case spr_gerome_idle3:
	dialog = [
	create_dialogue("Zzzzz...",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("Snore ...",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("Mmmph, good ol' gumbo, with some Tony's in there too...",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	]
	break;
	
	
	
	
}