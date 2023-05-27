sprite_index = spr_pizzaboyclone
dialog = 
[create_dialogue("look into the sky",spr_pizzaboyportrait,[sfx_breath, 0.1]),
create_dialogue("what is it you see",spr_pizzaboyportrait,[sfx_breath, 0.1]),
create_dialogue("i see nothing",spr_pizzaboyportrait,[sfx_breath, 0.1]),
create_dialogue("i see so much of it",spr_pizzaboyportrait,[sfx_breath, 0.1], function() {
	with obj_keypiece active = true	
})]
