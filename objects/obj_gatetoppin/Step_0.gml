scr_collision()
hsp = movespeed * image_xscale

if state = states.idle
{
	sprite_index = spr_idle
	image_speed = 0.35
	timer--
	
	movespeed = Approach(movespeed, 0, 0.5)
	
	if timer <= 0
	{
		timer = irandom_range(60, 120)
		state = states.walk
		sprite_index = spr_walk
	}
}
else
{
	sprite_index = spr_walk
	movespeed = Approach(movespeed, 2, 0.5)
	image_speed = (movespeed / 2) * 0.35
	timer--
	
	if timer <= 0
	{
		state = states.idle
		sprite_index = spr_idle
		timer = irandom_range(120, 480)

		image_xscale = choose(-1, 1, -image_xscale)
	}

	if bump_wall() ||place_meeting(x + hsp, y, obj_hallway) || !place_meeting_collision(x + (image_xscale * 15), y + 32) { image_xscale *= -1 movespeed /= 2 }

}