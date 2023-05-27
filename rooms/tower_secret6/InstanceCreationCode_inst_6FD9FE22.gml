	sprite_index = spr_goldenpizzaboy
pitch_range = 0.1
step_event = function() {
	image_speed = random_range(0, 0.3)	
	
}
talkedto = 0

if chance(2)  {
	instance_destroy()
	exit;
	
	
}

if get_keypieces() >= 36 {
	instance_destroy()
	exit;
	
	
}



exhausted_dialog = [
	[create_dialogue("isnt there something you are forgetting?",spr_pizzaboyportrait,[sfx_breath, 0.1]),],
	[create_dialogue("are you lost?",spr_pizzaboyportrait,[sfx_breath, 0.1]),],
	[create_dialogue("where are you?",spr_pizzaboyportrait,[sfx_breath, 0.1]),]
]
exhausted_dialog2 = [
	[create_dialogue("you do not know what you want",spr_pizzaboyportrait,[sfx_breath, 0.1]),],
	[create_dialogue("you are not welcome",spr_pizzaboyportrait,[sfx_breath, 0.1]),],
	[create_dialogue("...",spr_pizzaboyportrait,[sfx_breath, 0.1]),],
	[create_dialogue("i've been watching you",spr_pizzaboyportrait,[sfx_breath, 0.1]),],
	[create_dialogue("the others are not pleased",spr_pizzaboyportrait,[sfx_breath, 0.1]),],
]
exhausted_dialog3 = [
	[create_dialogue("you are foolish. bumbling. lost.",spr_pizzaboyportrait,[sfx_breath, 0.1]),],
	[create_dialogue("just another hapless traveller flying too close to the sun.",spr_pizzaboyportrait,[sfx_breath, 0.1]),],
	[create_dialogue("i suggest you quit it while you're still ahead.",spr_pizzaboyportrait,[sfx_breath, 0.1]),],
	[create_dialogue("what do you think you are getting at?",spr_pizzaboyportrait,[sfx_breath, 0.1]),],
	[create_dialogue("your violent destruction and misfortune only angers the tower",spr_pizzaboyportrait,[sfx_breath, 0.1]),],
	[create_dialogue("can you hear it, then? the rumbling below your feet?",spr_pizzaboyportrait,[sfx_breath, 0.1]),],
	[create_dialogue("this will only end in dissapointment. do you understand?",spr_pizzaboyportrait,[sfx_breath, 0.1]),],
	[create_dialogue("at the end, there will be nothing. only me.",spr_pizzaboyportrait,[sfx_breath, 0.1]),],

]
dialog_set1 = [
	[create_dialogue("... do you hear the squeal of the ones trapped in the box?",spr_pizzaboyportrait,[sfx_breath, 0.1]),
	create_dialogue("do you embrace their cries? do not.",spr_pizzaboyportrait,[sfx_breath, 0.1]),
	create_dialogue("for those are simply mimics aiming to harm you. avoid them...",spr_pizzaboyportrait,[sfx_breath, 0.1], function() {
		quick_ini_write_real("BabyPeppino", "event6", 1)
	}),],
	
	[create_dialogue("and once out of that pearly gate, where do your belongings go?",spr_pizzaboyportrait,[sfx_breath, 0.1]),
	create_dialogue("all the delectable ingredients, the little plump critters...",spr_pizzaboyportrait,[sfx_breath, 0.1]),
	create_dialogue("is the white chasm you reside in even truly there?",spr_pizzaboyportrait,[sfx_breath, 0.1]),],
	
	[create_dialogue("you've escaped the crumbling tower before, haven't you?",spr_pizzaboyportrait,[sfx_breath, 0.1]),
	create_dialogue("and yet here you are again. and all you had worked for has been re-established with the blink of an eye.",spr_pizzaboyportrait,[sfx_breath, 0.1]),
	create_dialogue("this is the fate you deserve",spr_pizzaboyportrait,[sfx_breath, 0.1]),],
]

dialog_set2 = [
	[create_dialogue("rooms such as this one",spr_pizzaboyportrait,[sfx_breath, 0.1]),	
	create_dialogue("how many of them are there?",spr_pizzaboyportrait,[sfx_breath, 0.1]),
	create_dialogue("maybe you are not looking hard enough",spr_pizzaboyportrait,[sfx_breath, 0.1]),],
	

	[create_dialogue("the man with the rat... the man with the rat...",spr_pizzaboyportrait,[sfx_breath, 0.1]),
	create_dialogue("a bit too kindhearted",spr_pizzaboyportrait,[sfx_breath, 0.1]),
	create_dialogue("dont you think?",spr_pizzaboyportrait,[sfx_breath, 0.1]),
	create_dialogue("...and what about his cousin?",spr_pizzaboyportrait,[sfx_breath, 0.1]),],
	

	[create_dialogue("the locale",spr_pizzaboyportrait,[sfx_breath, 0.1]),
	create_dialogue("have you talked to them all?",spr_pizzaboyportrait,[sfx_breath, 0.1]),
	create_dialogue("they might know a new thing or two",spr_pizzaboyportrait,[sfx_breath, 0.1], function() {
	if quick_ini_read_real("BabyPeppino", "event2", 0) == 0	
	quick_ini_write_real("BabyPeppino", "event2", 1)
	}),],
	[create_dialogue("someone in the roof",spr_pizzaboyportrait,[sfx_breath, 0.1]),
		create_dialogue("something ails them",spr_pizzaboyportrait,[sfx_breath, 0.1]),
		create_dialogue("come and see",spr_pizzaboyportrait,[sfx_breath, 0.1], function() {
			if quick_ini_read_real("BabyPeppino", "event3", 0) == 0	
				quick_ini_write_real("BabyPeppino", "event3", 1)
		
		}),
	

	],
	[
		create_dialogue("a statue of yourself",spr_pizzaboyportrait,[sfx_breath, 0.1]),
		create_dialogue("what is there to commemorate",spr_pizzaboyportrait,[sfx_breath, 0.1]),
		create_dialogue("you bury your secrets deep down",spr_pizzaboyportrait,[sfx_breath, 0.1]),
	],
]
dialog_set3 = [
	[
		create_dialogue("ha ha ha",spr_pizzaboyportrait,[sfx_breath, 0.1]),
		create_dialogue("do you see it?",spr_pizzaboyportrait,[sfx_breath, 0.1]),
		create_dialogue("it sees you",spr_pizzaboyportrait,[sfx_breath, 0.1]),
	],
	[create_dialogue("someone similar to you was looking around here",spr_pizzaboyportrait,[sfx_breath, 0.1]),
	create_dialogue("find him",spr_pizzaboyportrait,[sfx_breath, 0.1]),
	create_dialogue("he has something to show you",spr_pizzaboyportrait,[sfx_breath, 0.1], function() {
		if quick_ini_read_real("BabyPeppino", "event1", 0) == 0	
			quick_ini_write_real("BabyPeppino", "event1", 1)	
	})],
	[
		create_dialogue("there was someone up above",spr_pizzaboyportrait,[sfx_breath, 0.1]),
		create_dialogue("perhaps an angel",spr_pizzaboyportrait,[sfx_breath, 0.1]),
		create_dialogue("it descended from the sky",spr_pizzaboyportrait,[sfx_breath, 0.1]),
	],
	
	[
		create_dialogue("the tower shifts beneath your feet",spr_pizzaboyportrait,[sfx_breath, 0.1]),
		create_dialogue("have you noticed",spr_pizzaboyportrait,[sfx_breath, 0.1]),
	]
]
dialog_set4 = [
	[
		create_dialogue("you think you know everything",spr_pizzaboyportrait,[sfx_breath, 0.1]),
		create_dialogue("foolish",spr_pizzaboyportrait,[sfx_breath, 0.1]),
	],
	[
		create_dialogue("the floor beneath you... are you sure it's ever so stable?",spr_pizzaboyportrait,[sfx_breath, 0.1]),
		create_dialogue("are you moving around on your own, ever so sure that you conquered the tower?",spr_pizzaboyportrait,[sfx_breath, 0.1]),
		create_dialogue("...but have you ever wondered... has the tower conquered you instead?",spr_pizzaboyportrait,[sfx_breath, 0.1]),
	],
	[
		create_dialogue("... so proud, so sure, running through. breaking the fundaments and scavaging all you can...",spr_pizzaboyportrait,[sfx_breath, 0.1]),
		create_dialogue("are you even sure of what you are doing?",spr_pizzaboyportrait,[sfx_breath, 0.1]),
		create_dialogue("are you aware of what will happen?",spr_pizzaboyportrait,[sfx_breath, 0.1]),
		create_dialogue("such thought disturbs the others.",spr_pizzaboyportrait,[sfx_breath, 0.1]),
	],
	[
		create_dialogue("... and yet, after all was spoken, you came still.",spr_pizzaboyportrait,[sfx_breath, 0.1]),
		create_dialogue("you never let go. explored every corner. exhausted everything everyone could ever say.",spr_pizzaboyportrait,[sfx_breath, 0.1]),
		create_dialogue("was leaving ever even an option?",spr_pizzaboyportrait,[sfx_breath, 0.1]),
	],
	[
		create_dialogue("listen to the rumbling",spr_pizzaboyportrait,[sfx_breath, 0.1]),
		create_dialogue("this place is crashing and burning",spr_pizzaboyportrait,[sfx_breath, 0.1]),

	],


]



dialog_function = function() { 
	obj_player.state = states.talkto
	var dialog_select = dialog_set1
	if get_keypieces() >= 5 {
		dialog_select = choose(dialog_set1, dialog_set2)
		if quick_ini_read_real("BabyPeppino", "progress", 0) < 1 quick_ini_write_real("BabyPeppino", "progress", 1)
	}
	if get_keypieces() >= 15 {
		dialog_select = choose(dialog_set1, dialog_set2, dialog_set3)
		if quick_ini_read_real("BabyPeppino", "progress", 0) < 2 quick_ini_write_real("BabyPeppino", "progress", 2)
	}
	if get_keypieces() >= 25 {
		dialog_select = choose(dialog_set1, dialog_set2, dialog_set3, dialog_set4)
		if quick_ini_read_real("BabyPeppino", "progress", 0) < 3 quick_ini_write_real("BabyPeppino", "progress", 3)
	}
	if talkedto > 5 {
		dialog_select = exhausted_dialog
		if get_keypieces() >= 20 dialog_select = exhausted_dialog2	
	}
	if get_keypieces() >= 35 dialog_select = exhausted_dialog3
	var rand = irandom(array_length(dialog_select) - 1)
	var the_dianlog = dialog_select[rand]
	if chance(0.5) array_push(the_dianlog,
		create_dialogue("leave\nleave\nleave\nleave\nleave\nleave\nleave\nleave\nleave\nleave\nleave\nleave\nleave\nleave",spr_pizzaboyportrait,[sfx_breath, 0.1]),
	
	)
	
	queue_dialogue(the_dianlog) 
	
	talkedto++
}