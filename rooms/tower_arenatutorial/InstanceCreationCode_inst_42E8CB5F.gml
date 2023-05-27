visible = false
talkedto = 0
if quick_ini_read_real("BabyPeppino", "event2", 0) > 1 && get_keypieces() >= 5 && get_progress() >= 1 {
	dialog = [
		create_dialogue("Information?"),
		create_dialogue("I haven't heard much except a rumor going around..."),
		create_dialogue("Some people have been saying something about a big pit on the beach..."),
		create_dialogue("Don't really know much else..."),
	]
	
	
	
} else instance_destroy()

dialog_function = function() { 
	obj_player.state = states.talkto
	queue_dialogue(dialog) 
	talkedto = 1
}