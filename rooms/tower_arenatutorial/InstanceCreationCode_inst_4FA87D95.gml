visible = false
talkedto = 0
if quick_ini_read_real("BabyPeppino", "event2", 0) > 1 && get_keypieces() >= 5 && get_progress() >= 1 {
	dialog = [
		create_dialogue("did SHE tell you to talk to us"),
		create_dialogue("ughhh fine"),
		create_dialogue("i heard there was something that pizzaface wanted to bury"),
		create_dialogue("deep underground"),
		create_dialogue("what that thing is no one knows but theres something he is trying to hide"),
	]
	
	
	
} else instance_destroy()

dialog_function = function() { 
	obj_player.state = states.talkto
	queue_dialogue(dialog) 
	talkedto = 1
}