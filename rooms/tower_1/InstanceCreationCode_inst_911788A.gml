visible = false
talkedto = 0
if quick_ini_read_real("BabyPeppino", "event2", 0) > 1 && get_keypieces() >= 5 && get_progress() >= 1 {
	dialog = [
		create_dialogue("Pardon me Sir, did my sister from the Upper Floors send you..?"),
		create_dialogue("I see I see... exclusive information I may know about you ask..."),
		create_dialogue("Alas... I only know yet of one thing..."),
		create_dialogue("There happens to be quite the secret hidden around the Pizza Place on the upper floor..."),
		create_dialogue("I do wonder what could possibly be hidden there... would be quite the secret!"),
	]
	
	
	
} else instance_destroy()

dialog_function = function() { 
	obj_player.state = states.talkto
	queue_dialogue(dialog) 
	talkedto = 1
}