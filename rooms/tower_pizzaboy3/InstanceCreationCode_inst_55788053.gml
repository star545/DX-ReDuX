sprite_index = spr_pizzaboyclone
dialog = 
[create_dialogue("all sorts of hidden things",spr_pizzaboyportrait,[sfx_breath, 0.1]),
create_dialogue("everything isnt what it seems",spr_pizzaboyportrait,[sfx_breath, 0.1]),
create_dialogue("do you understand",spr_pizzaboyportrait,[sfx_breath, 0.1], function() {
	with obj_keypiece active = true	
})]
