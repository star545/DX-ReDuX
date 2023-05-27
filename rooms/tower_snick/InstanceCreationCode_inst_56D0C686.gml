sprite_index = spr_snicknpc_idle
image_speed = 0.35
dialog = [
create_dialogue("Sorry bud!"),
create_dialogue("Can't really operate any of these games right now."),
create_dialogue("Lost the key to the back of 'em."),
create_dialogue("..say. Do me a solid, couldya find that key for me? Should be nearby.",,, function() {
	if quick_ini_read_real("BabyPeppino", "snick", 0) == 0	
		quick_ini_write_real("BabyPeppino", "snick", 1)		
	
}),
]
if !is_undefined(get_keyname("w2_snick")) && get_keyname("w2_snick") == true {
	dialog = [
		create_dialogue("Sorry bud!"),
		create_dialogue("Gone flat broke. Guess that's what happens when you give out stuff for free..."),
	]
	
}


if get_progress() >= 1 && get_keypieces() >= 5 {
	dialog = [	
		create_dialogue("Hey bud!"),
	create_dialogue("Managed to get one of these games workin!"),
	create_dialogue("Althought... I'd need someone special to play them, you know anyone?"),
	
	]
	
}