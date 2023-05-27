if state == states.transitioncutscene {
	if sprite_index == spr_goldenpizzaboy {
		image_index = 0
		sprite_index = spr_goldenpizzboy_intro
		alarm[0] = 120
		with obj_player {
			sprite_index = spr_player_gnomecutscene2
			image_index = 0
		}
		
	}
	else if sprite_index == spr_goldenpizzboy_intro {
		image_index = 0
		sprite_index = spr_goldenpizzboy_intro2
		alarm[0] = 150
		with obj_player {
			sprite_index = spr_player_gnomecutscene3
			image_index = 0
		}
		
	}
	else if sprite_index == spr_goldenpizzboy_intro2 {
		image_index = 0
		sprite_index = spr_goldenpizzaboy_grabstart
		state = states.charge
		movespeed = 8
		flash = 1
		//alarm[0] = 90
		with obj_player {
			state = states.normal
		}
		
	}
	
	
}