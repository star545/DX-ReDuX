if !instance_exists(obj_cutscene_handler) {
	with instance_create(0, 0, obj_cutscene_handler) {
		scene_info = [
			//[cutscene_create_playeractor],
			[cutscene_set_player_actor],
			[cutscene_set_player_visible, false],
			[cutscene_set_player_pos, other.x, other.y + 1000],
			[cutscene_player_float, true],
			[cutscene_player_pos_lerp, other.x, other.y, 0.05],
			[cutscene_wait, 120],
			[cutscene_wait, 200],
			[cutscene_set_player_visible, true],
			[cutscene_set_player_normal],
			[cutscene_player_float, false],
			[cutscene_dark_end],
			
			
			

		]
	}
}