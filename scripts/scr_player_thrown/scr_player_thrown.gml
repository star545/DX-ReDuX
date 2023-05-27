function scr_player_thrown()
{
	if fake_alarm(5) create_particle(x, y, particle.cloudeffect, 25)
	image_speed = 0.35
	sprite_index = spr_hurt
	hsp = (movespeed * (-xscale))
	vsp = 0
	if place_meeting_collision(x + hsp, y)
	{
		xscale *= -1
		state = states.normal
		scr_hurtplayer(id)
	}

}
