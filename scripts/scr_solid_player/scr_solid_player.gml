function scr_solid_player(argument0, argument1)
{
	//var old_x = x
	//var old_y = y
	//x = argument0
	//y = argument1
	//if place_meeting(x, y, obj_solid)
	//{
	//	var num = instance_place_list(x, y, obj_solid, global.instancelist, 0)
	//	var _collided = 0
	//	var i = 0
	//	while (i < num)
	//	{
	//		var b = ds_list_find_value(global.instancelist, i)
	//		switch b.object_index
	//		{
	//			case obj_ghostwall:
	//				if (state != states.ghost)
	//					_collided = 1
	//				break
	//			case obj_mach3solid:
	//				if (state != states.mach3 && (state != states.machslide or sprite_index != spr_mach3boost) && (state != states.chainsaw or tauntstoredstate != states.mach3))
	//					_collided = 1
	//				break
	//			default:
	//				_collided = 1
	//		}

	//		if _collided
	//			break
	//		else
	//		{
	//			i++
	//			continue
	//		}
	//	}
	//	ds_list_clear(global.instancelist)
	//	if _collided
	//	{
	//		x = old_x
	//		y = old_y
	//		return true;
	//	}
	//}
	//if (y > old_y && state != states.ladder && place_meeting(x, y, obj_platform))
	//{
	//	num = instance_place_list(x, y, obj_platform, global.instancelist, 0)
	//	_collided = 0
	//	for (i = 0; i < num; i++)
	//	{
	//		b = ds_list_find_value(global.instancelist, i)
	//		if ((!(place_meeting(x, old_y, b))) && place_meeting(x, y, b))
	//			_collided = 1
	//	}
	//	ds_list_clear(global.instancelist)
	//	if _collided
	//	{
	//		x = old_x
	//		y = old_y
	//		return true;
	//	}
	//}
	//if (y > old_y && (bbox_bottom % 16) == 0 && (!(place_meeting(x, old_y, obj_grindrail))) && place_meeting(x, y, obj_grindrail))
	//{
	//	if (state == states.grind)
	//	{
	//		x = old_x
	//		y = old_y
	//		return true;
	//	}
	//}
	//if check_slope_player(obj_slope)
	//{
	//	x = old_x
	//	y = old_y
	//	return true;
	//}
	//if check_slope_player(obj_grindrailslope)
	//{
	//	if (state == states.grind)
	//	{
	//		x = old_x
	//		y = old_y
	//		return true;
	//	}
	//}
	//x = old_x
	//y = old_y
	//return false;
	return place_meeting_collision(argument0, argument1, Exclude.SLOPES)
}

function check_slope_player(argument0)
{
	return place_meeting_slope(x, y, true)
}

