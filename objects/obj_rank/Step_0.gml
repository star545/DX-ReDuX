if (floor(image_index) == (image_number - 1))
	image_speed = 0
	
var spr = variable_instance_get(obj_player1, concat("spr_rank", global.rank))	
sprite_index = spr
if global.cheat_disable sprite_index = spr_rankEGGPLANT

//sprite_index = spr_rankEGGPLANT
if instance_exists(obj_treasureviewer)
	visible = false
