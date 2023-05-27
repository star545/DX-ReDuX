var p = instance_place(x, y - 1, obj_player)
if p < 0 collision_rectangle(bbox_left, bbox_top - 4, bbox_right, bbox_top + 4, obj_player, 0, 1)
if instance_exists(obj_technicaldifficulty) exit;

if p > 0 {
	if sprite_index == spr_squeezer_idle {
		sprite_index = spr_squeezer_squeeze
		image_index = 0
	}
	if sprite_index == spr_squeezer_hold || sprite_index == spr_squeezer_release || (sprite_index == spr_squeezer_squeeze && anim_end(7)) scr_hurtplayer(p)
}
var squeeeezed = floor(image_index) == 7
if squeeeezed && sprite_index == spr_squeezer_squeeze && p > 0 with p scr_technicaldifficulties()
if anim_end() {
	if sprite_index == spr_squeezer_squeeze {	
		sprite_index = spr_squeezer_hold
		image_index = 0 
		
	}
	else if sprite_index = spr_squeezer_hold {
		sprite_index = spr_squeezer_release
		image_index = 0
	}
	else if sprite_index = spr_squeezer_release {
		sprite_index = spr_squeezer_idle
		image_index = 0
	}
	
}

		
		
