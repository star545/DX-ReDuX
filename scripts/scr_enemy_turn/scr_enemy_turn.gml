function scr_enemy_turn()
{
	sprite_index = turnspr
	image_speed = 0.35
	if anim_end()
	{

		state = states.walk
		image_index = 0
		sprite_index = walkspr
		
	}
	exit;
}

