function scr_player_slipbanan()
{
	hsp = (xscale * movespeed)
	if grounded
		movespeed = Approach(movespeed, 0, 0.5)
	if (floor(image_index) == (image_number - 1) && sprite_index != spr_rockethitwall)
		image_speed = 0
	else
		image_speed = 0.35
	if (sprite_index == spr_slipbanan2)
		scr_player_addslopemomentum(0.75, 1)
	if (grounded && vsp > -1 && sprite_index != spr_slipbanan2 && (!(place_meeting(x, (y + 1), obj_metalblock))) && (!(place_meeting(x, (y + 1), obj_destructibles))))
	{
		if (sprite_index == spr_rockethitwall)
		{
			sprite_index = spr_slipbanan2
			image_index = 0
			image_speed = 0.35
		}
		else
		{
			vsp = -6
			movespeed = Approach(movespeed, 0, 3)
			sprite_index = spr_rockethitwall
			instance_create(x, (y + 43), obj_bangeffect)
		}
	}
	if (sprite_index == spr_slipbanan2)
	{
		if (floor(image_index) == (image_number - 1) && abs(hsp) <= 2)
			state = states.normal
	}
	if bump_wall(xscale)
	{
		if (sprite_index == spr_slipbanan1)
			movespeed = Approach(movespeed, 0, 3)
		sprite_index = spr_rockethitwall
		instance_create((x + 30), y, obj_bangeffect)
		xscale *= -1
		scr_sleep(1)
	}
	exit;
}

