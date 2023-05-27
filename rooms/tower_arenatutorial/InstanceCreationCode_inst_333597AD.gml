visible = false
talkedto = 0
if quick_ini_read_real("BabyPeppino", "event2", 0) > 1 && get_keypieces() >= 5 && get_progress() >= 1 {
	dialog = [
		create_dialogue("sOOOOO..."),
		create_dialogue("dID yOU kNOW...."),
		create_dialogue("sOMEONE...."),
		create_dialogue("pUT sOMETHING \"Special\"..."),
		create_dialogue("uNDERNEATH SOME... mUSHROOMS... i tHNIK..."),
	]
	
	
	
} else instance_destroy()

dialog_function = function() { 
	obj_player.state = states.talkto
	queue_dialogue(dialog) 
	talkedto = 1
}