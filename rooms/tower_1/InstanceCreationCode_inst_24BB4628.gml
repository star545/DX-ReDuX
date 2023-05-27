var _d = false
if get_keyname("pbroom1") != true _d = true
if quick_ini_read_real("BabyPeppino", "eventpb1", 0) == 1 _d = true
if _d {
	instance_destroy()
	exit;
}
fading = false
sprite_index = spr_pizzaboyclone
dialog = 

[create_dialogue("what",spr_pizzaboyportrait,[sfx_breath, 0.1], function() {
	quick_ini_write_real("BabyPeppino", "eventpb1", 1)
	instance_destroy()
})]


talk_condition = function() {
	return place_meeting(x, y, obj_player) && obj_player.key_up2 && obj_player.state != states.talkto && !fading
}
step_event = function() {
	if fading image_alpha -= 0.1
	if image_alpha <= 0 instance_destroy()
}