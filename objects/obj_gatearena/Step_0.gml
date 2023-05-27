
var current_alt = floor(global.arenaphase / alternate_round) % 2
if global.arenaphase >= alternate_at && alternate {
	if current_alt == use_alt {
		if sprite_index == spr_arenagate_closed { 
			image_index = 0 
			sprite_index = spr_arenagate_open 
		}
	}
	else {
		if sprite_index == spr_arenagate_opened && !place_meeting(x, y, obj_player) { 
			image_index = 0 
			sprite_index = spr_arenagate_close 
		}
	}
}
else if global.arenaphase >= open_at && sprite_index == spr_arenagate_closed { image_index = 0 sprite_index = spr_arenagate_open }


if anim_end() {
	if sprite_index == spr_arenagate_close sprite_index = spr_arenagate_closed	
	if sprite_index == spr_arenagate_open sprite_index = spr_arenagate_opened
}