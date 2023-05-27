visible = false
talkedto = 0
if quick_ini_read_real("BabyPeppino", "event2", 0) > 1 && get_keypieces() >= 5 && get_progress() >= 1 {
	dialog = [
		create_dialogue("Fun Fact"),
		create_dialogue("In The Freezer Area"),
		create_dialogue("During Construction"),
		create_dialogue("Pizzaface Blocked Off A Room"),
		create_dialogue("That Was Under Construction"),
		create_dialogue("Our Ruler And His Unusual Decisions"),
		create_dialogue("Whatever Would We Do Without Him"),
	]
	
	
	
} else instance_destroy()

dialog_function = function() { 
	obj_player.state = states.talkto
	queue_dialogue(dialog) 
	talkedto = 1
}