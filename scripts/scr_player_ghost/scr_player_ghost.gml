function scr_player_ghost()
{

	
	
	visible = true
	image_speed = 0.35
	if (sprite_index != spr_ghostend)
	{
		move_h = (key_right + key_left)
		move_v = (key_down - key_up)
		var mv = move_v
		
		//if move_v == 0 && move_h == 0 move_v = 0.05
		
		var maxspd = round(5 + (clamp(ghost_pepper, 0, 5) * 1.5))
		var topspd = round((10 * 1.5))
		var turn = (0.65 * 2) * (maxspd / topspd) //(maxspd - 3) / 6
		//if move_v == 0 && move_h == 0 ghost_mvsp = Approach(ghost_mvsp, maxspd, 0.1)
		//else ghost_mvsp = Approach(ghost_mvsp, maxspd, 0.1)
		var dir = point_direction(x, y, x + (move_h * 3), y + (move_v * 3))
		
		movespeed = Approach(movespeed, move_h * maxspd, turn)
		vsp = Approach(vsp, move_v * maxspd, turn)
		vsp -= grav
		hsp = movespeed
		if place_meeting_solid(x + sign(movespeed), y) movespeed = 0
		//if place_meeting_solid(x, y + sign(wallspeed)) wallspeed = 0
		if (hsp != 0)
			xscale = sign(hsp)
		if ghost_pepper < 3 || (mv == 0 && move_h == 0)
		{
			if anim_end() && hsp == 0 sprite_index = spr_ghostidle
			if (key_up)
				sprite_index = spr_ghostjump

		}
		else
			sprite_index = spr_ghostdash
		if (place_meeting(x, y, obj_tombstone) && sprite_index != spr_ghostend)
		{
			sprite_index = spr_ghostend
			image_index = 0
			image_alpha = 1
			vsp = 10
			hsp = 0
			grav = 0.5
			movespeed = 0
			with (instance_place(x, y, obj_tombstone))
			{
				other.x = x
				other.y = y
			}
		}
	}
	if (sprite_index == spr_ghostend && floor(image_index) == (image_number - 1))
		state = states.normal
	if place_meeting(x, y, obj_ghosttransparency)
		image_alpha = 0.5
	else
		image_alpha = 1
}

function scr_player_ghostpossess()
{
	visible = false
	hsp = 0
	if (!instance_exists(possessID))
	{
		visible = true
		state = states.ghost
		sprite_index = spr_ghostidle
	}
}

