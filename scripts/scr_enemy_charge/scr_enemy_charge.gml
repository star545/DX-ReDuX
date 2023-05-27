function scr_enemy_charge()
{
	var turn = place_meeting(x + image_xscale, y, obj_hallway) || bump_wall(image_xscale)
	if (object_index == obj_peasanto)
	{
		if (grounded or (grounded && (!(place_meeting(x, y, obj_platform)))))
			hsp = (image_xscale * 6)
		image_speed = 0.35
		if turn image_xscale *= -1
		if ((!((grounded or (grounded && (!(place_meeting(x, y, obj_platform))))))) && hsp < 0)
			hsp += 0.1
		else if ((!((grounded or (grounded && (!(place_meeting(x, y, obj_platform))))))) && hsp > 0)
			hsp -= 0.1
		sprite_index = spr_peasanto_flameattack
	}
	if (object_index == obj_indiancheese)
	{
		if (floor(image_index) == (image_number - 1))
			image_speed = 0
		hsp = (image_xscale * movespeed)
		if (grounded && vsp > 0)
		{
			if turn image_xscale *= -1
			state = states.walk
			image_index = 0
			image_speed = 0.35
			sprite_index = spr_indiancheese_land
		}
	}
	if (object_index == obj_snowman)
	{
		hsp = (image_xscale * movespeed)
		image_speed = 0.35
		if turn image_xscale *= -1
		sprite_index = spr_newpizzice_walk
	}
	if (object_index == obj_fencer or object_index == obj_banditochicken)
	{
		if (object_index == obj_fencer)
		{
			if (grounded or (grounded && (!(place_meeting(x, y, obj_platform)))))
				hsp = (image_xscale * movespeed)
			else
				hsp = 0
		}
		else
			hsp = (image_xscale * movespeed)
		if turn image_xscale *= -1
	}
	if (object_index == obj_ancho)
	{
		hsp = (image_xscale * movespeed)
		if place_meeting((x + hsp), y, obj_solid)
		{
			state = states.stun
			stunned = 100
		}
	}
	if (object_index == obj_ninja)
	{
		inv_timer = 5
		hsp = (image_xscale * 2)
		if (grounded && vsp > 0)
		{
			state = states.walk
			sprite_index = idlespr
		}
		if (alarm[4] == -1)
			alarm[4] = 5
	}
	if place_meeting(x, (y + 1), obj_railparent)
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		hsp += (_railinst.movespeed * _railinst.dir)
	}
	exit;
}

