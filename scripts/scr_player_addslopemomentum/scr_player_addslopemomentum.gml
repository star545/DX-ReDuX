function scr_player_addslopemomentum(_add, sub_mult)
{
	var _slope = instance_place(x, y + 1, obj_slope)
	var angel = 0
	var add = 0
	var multiplier = 1
	if _slope != -4 {
		angel = abs(_slope.image_yscale / _slope.image_xscale)
		add = sign(_slope.image_xscale) == -xscale ? 1 : -1
	}
	
	multiplier = add == -1 ? sub_mult : 1
	if groundedSlope 
		movespeed += ((_add * angel) * add) * multiplier
	exit;
}

function scr_player_addslopemomentum_ext(_add, sub_mult, dir = xscale, use_hsp = false)
{
	var _slope = instance_place(x, y + 1, obj_slope)
	var angel = 0
	var add = 0
	var multiplier = 1
	if _slope != -4 {
		angel = abs(_slope.image_yscale / _slope.image_xscale)
		add = sign(_slope.image_xscale) == -dir ? 1 : -1
	}
	
	multiplier = add == -1 ? sub_mult : 1
	if groundedSlope {
		if !use_hsp movespeed += ((_add * angel) * add) * multiplier
		else hsp += ((_add * angel) * add) * multiplier
		
	}
	exit;
}

function scr_pizzaball_addslopemomentum(argument0, argument1)
{
	with (instance_place(x, (y + 1), obj_slope))
	{
		if (sign(image_xscale) == (-sign(other.image_xscale)))
		{
			if (abs(image_yscale) < abs(image_xscale))
				other.slopespeed += argument0
			else
				other.slopespeed += argument1
		}
		else if (abs(image_yscale) < abs(image_xscale))
			other.slopespeed -= argument0
		else
			other.slopespeed -= argument1
	}
	if (slopespeed < 0)
		slopespeed = 0
	if (slopespeed > 10)
		slopespeed = 10
	if (movespeed < 1)
		slopespeed = 0
	exit;
}

function slope_direction() {
	if place_meeting_slope(x, y + 1, false) {
		with (instance_place(x, (y + 1), obj_slope))
			return (sign(image_xscale));
	}
	if place_meeting_slopePlatform(x, y + 1) {
		with (instance_place(x, (y + 1), obj_slopePlatform))
			return (sign(image_xscale));
	}	
}