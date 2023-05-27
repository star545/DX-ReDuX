sprite_index = spr_pizzaboyclone
dialog = 
[create_dialogue("it seems like you do not have much time left...",spr_pizzaboyportrait,[sfx_breath, 0.1]),
create_dialogue("spend your time wisely",spr_pizzaboyportrait,[sfx_breath, 0.1]),
create_dialogue("after you get what you want...",spr_pizzaboyportrait,[sfx_breath, 0.1], function() {
	with obj_keypiece active = true	
})]
