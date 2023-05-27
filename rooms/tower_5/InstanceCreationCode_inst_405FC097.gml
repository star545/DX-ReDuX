sprite_index = choose(spr_gerome_idle1, spr_gerome_idle2, spr_gerome_idle3)
image_speed = 0.35

switch (sprite_index) {
	
	case spr_gerome_idle1:
	dialog = [
	create_dialogue("I swear to ya' that this gate wasn't here yesterday!",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("Appeared like some magic, knowing this place it's probably evil.",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("It reminds me of some ol' haunted plantations back home.",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("Scary thang y'hear.  Be careful round these parts.",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	]
	break;
	
	case spr_gerome_idle2:
	dialog = [
	create_dialogue("With all the bustle round right now,",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("* Smack * , I ain't got no gossip for y'all.",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("Alls I can say is prepare y'self.  * Chomp *",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("The boss' gotta big plan fo y'all.",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	]
	break;
	
	case spr_gerome_idle3:
	dialog = [
	create_dialogue("Zzzzz...",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("Snore ...",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	create_dialogue("Mmmph, crawfish etouffee...",,[sfx_gerome1,sfx_gerome2,sfx_gerome3,sfx_gerome4]),
	]
	break;
	
	
	
	
}