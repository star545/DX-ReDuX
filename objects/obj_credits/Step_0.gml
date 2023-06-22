var oldalp = pg_alpha
pg_alpha = Approach(pg_alpha, tgt_alpha, 0.05)
if obj_player1.key_jump && sprite_index != spr_credits_hint tgt_alpha = 1
if pg_alpha = 1 && oldalp != pg_alpha && tgt_alpha = 1 {
	tgt_alpha = 0
	image_index++
	if floor(image_index) == 5 {
		alarm[3] = 90
		sprite_index = spr_credits_hint
		image_index = 0
	}
	alarm[0] = 300
	//if instance_exists(obj_cutscene_fade) && obj_cutscene_fade.fadealpha != 1 alarm[3] = 300
	
	
	
}