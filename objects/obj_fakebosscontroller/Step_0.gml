php_index += 0.35
if !instance_exists(obj_pizzaboyboss) && !played_outro {
	if obj_player1.grounded {
		played_outro = true
		audio_stop_all()
		scr_soundeffect(sfx_bosswin)
		obj_player1.state = states.victory
		obj_player1.sprite_index = spr_player_levelcomplete
		obj_player1.image_index = 0
		
	}
	
	
}
if obj_player1.state == states.victory && obj_player1.state != states.throwing && !audio_is_playing(sfx_bosswin) {
	obj_player1.state = states.normal
	instance_create(480, -100, obj_giantkey)	
}