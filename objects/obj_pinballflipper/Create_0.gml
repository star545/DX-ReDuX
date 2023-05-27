image_speed = 0.35
bounce_spr = spr_pinballflipper_bounce
idle_spr = spr_pinballflipper
canCollide = function(who_is = obj_player) {
	return sprite_index != spr_pinballflipper_bounce	
	
}