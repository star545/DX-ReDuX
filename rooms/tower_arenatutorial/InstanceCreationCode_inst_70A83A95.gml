visible = false
talkedto = 0
if quick_ini_read_real("BabyPeppino", "event2", 0) > 1 && get_keypieces() >= 5 && get_progress() >= 1 {
	dialog = [
		create_dialogue("OOOH ARE YOU LOOKING FOR INFORMATION?"),
		create_dialogue("IM NOT EVEN SUPPOSED TO BE TELLING YOU THIS BUT..."),
		create_dialogue("WHEN TALKING WITH A COWORKER AND HE WAS TALKING ABOUT ..."),
		create_dialogue("A SECRET HIDDEN IN THE ROOF OF A CASTLE! THATS ALL HE TOLD ME THOUGH "),
	]
	
	
	
} else instance_destroy()

dialog_function = function() { 
	obj_player.state = states.talkto
	queue_dialogue(dialog) 
	talkedto = 1
}