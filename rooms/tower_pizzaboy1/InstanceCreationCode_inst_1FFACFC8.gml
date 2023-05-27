sprite_index = spr_pizzaboyclone
dialog = 
[create_dialogue("what is it you seek?",spr_pizzaboyportrait,[sfx_breath, 0.1]),
create_dialogue("a reward? salvation?",spr_pizzaboyportrait,[sfx_breath, 0.1]),
create_dialogue("you will not find it here",spr_pizzaboyportrait,[sfx_breath, 0.1], function() {
	with obj_keypiece active = true	
})]
