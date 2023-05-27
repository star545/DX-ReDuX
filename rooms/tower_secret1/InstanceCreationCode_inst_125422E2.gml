sprite_index = spr_pepperman_idle
image_speed = 0.35
dialog = [
create_dialogue("Salutations my former culinary opponent!"),
create_dialogue("Forgive me for the lack of input, but I'm still perfecting my art!"),
create_dialogue("Once my glorious portal is perfected, then your lesser intellectual mind may enter it's glorious abode."),
create_dialogue("Until then, as the Germans say, \"Adieu.\""),
]

dialog_secret = [
create_dialogue("Well my large and brutish culinary fellow, if you must insist on bothering me, I shall elaborate on this project's process! "),
create_dialogue("It's close to completion, but I must warn you on something..."),
create_dialogue("This portal will be quite the struggle for even you, so I would say to prepare yourself and go in guns blazing once you dare to attempt it."),
create_dialogue("I insist you really ought to go in guns blazing, as that would probably alleviate this portal's burden..."),
create_dialogue("But alas, as the Italians say, \"au revoir.\""),

]
dialog_quest = [
create_dialogue("My I say, I was walking around the upper levels when I heard rumor of a secret art gallery."),
create_dialogue("I, of course, was ecstatic over this and barged right through to view the cheap imitation of my craftsman ship..."),
create_dialogue("But, what disgraced my eyes..."),
create_dialogue("It was horrible, absolute garbage."),
create_dialogue("I could not dare myself to stand in there for a slimmer of an hour."),
create_dialogue("I wouldn't waste my time in there if I were you, my gallery is always open and has the luxury of being made by me."), 
create_dialogue("The only time I'd ever let that gallery waste my time if I was in there absolutely making a mockery of it..."), 
create_dialogue("Regardless though, I'll tend back to my work.",,,function() {
	quick_ini_write_real("BabyPeppino", "event3", 2)		
}),

]


dialog_function = function() { 
	obj_player.state = states.talkto
	var _d = dialog
	if quick_ini_read_real("BabyPeppino", "event3", 0) == 1 _d = dialog_quest
	else if get_keypieces() >= 5 && get_progress() >= 1 _d = dialog_secret
	queue_dialogue(_d) 
}