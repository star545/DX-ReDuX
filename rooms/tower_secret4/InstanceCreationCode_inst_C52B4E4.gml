visible = false
talkedto = 0
if quick_ini_read_real("BabyPeppino", "event2", 0) == 2 talkedto = 1
if quick_ini_read_real("BabyPeppino", "event2", 0) >= 1 && get_keypieces() >= 5 && get_progress() >= 1 {
	dialog = [
		
		create_dialogue("WHAT?!?! Someone said I'd know something!?!?"),
		create_dialogue("WHO TOLD YOU THAT?! NO ONE TELLS ME ANYTHING!"),
		create_dialogue("Eurgh... go bug my sisters! They know more than me!!!!!",,, function() {
			if quick_ini_read_real("BabyPeppino", "event2", 0) == 1 quick_ini_write_real("BabyPeppino", "event2", 2)
		}),
		
	]
	
	
	
} else instance_destroy()

dialog_function = function() { 
	obj_player.state = states.talkto
	queue_dialogue(dialog) 
	talkedto = 1
}