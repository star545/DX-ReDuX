
drawing = place_meeting(x, y, obj_player) && (state == states.normal || state == states.options)
//if showing_score ease_frame += 5
fade = (distance_to_object(obj_player) - 50) / 250
if state == states.options {
	scr_getinput()
	if !can_proceed {
		if key_right mode = 1
		if -key_left mode = 0
	}
	if key_jump can_proceed = true
	
	
}
if state = states.transitioncutscene {
	if !audio_is_playing(snd_rumble) snd_rumble = scr_soundeffect_loop(sfx_jon)
	if global.ScrollOffset % 3 == 0 {
		create_debris(x + (random_range(-(sprite_width / 2),(sprite_width / 2))), y, spr_towerblockdebris)
		with instance_create(x + (random_range(-(sprite_width / 2),(sprite_width / 2))), y, obj_parryeffect)
		{
			sprite_index = spr_deadjohnsmoke
			image_speed = 0.35
			vsp = random_range(-4, 4)
		}
	}
	if global.ScrollOffset % 10 == 0 {
		audio_stop_sound(sfx_breakblock1)	
		audio_stop_sound(sfx_breakblock2)	
		scr_soundeffect(sfx_breakblock1, sfx_breakblock2)
	}
	shake_cam(5, 3 / room_speed)
	y_crop = Approach(y_crop, sprite_height, 1)	
	if y_crop == sprite_height { 
		state = states.normal
		if quick_ini_read_real("Gates", level, 0) == 0 quick_ini_write_real("Gates", level, 1)
	}
} else {
	if audio_is_playing(snd_rumble) audio_stop_sound(snd_rumble)
}
if state == states.pizzahead_sexypicture {
	if quick_ini_read_real("Gates", level, 0) == 1 {
		y_crop = sprite_height
		state = states.normal	
	} else if bbox_in_camera(view_camera[0], -100) {
		y_crop = 0
		state = states.transitioncutscene
	}
	
}