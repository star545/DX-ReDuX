function scr_destroy_destructibles(xplus = 0, yplus = 0)
{
	var _num = instance_place_list(x + xplus, y + yplus, obj_destructibles, global.instancelist, 0)
	if instance_exists(obj_player) && obj_player1.character == characters.vigilante {
		instance_destroy(instance_place(x + xplus, y + yplus, obj_shotgunblock))	
		
	}
	if _num > 0
	{
		GamepadSetVibration(0, 0.8, 0.8, 0.5)
		for (var i = 0; i < ds_list_size(global.instancelist); i++)
			instance_destroy(ds_list_find_value(global.instancelist, i))
		ds_list_clear(global.instancelist)
	}
}
function scr_destroy_obj(xplus = 0, yplus = 0, obj)
{

	if _num > 0
	{
		GamepadSetVibration(0, 0.8, 0.8, 0.5)
		for (var i = 0; i < ds_list_size(global.instancelist); i++)
			instance_destroy(ds_list_find_value(global.instancelist, i))
		ds_list_clear(global.instancelist)
	}
}

function scr_meeting_destructibles(xplus = 0, yplus = 0)
{
	var _num = instance_place_list(x + xplus, y + yplus, obj_destructibles, global.instancelist, 0)
	if instance_exists(obj_player) && obj_player1.character == characters.vigilante {
		if place_meeting(x + xplus, y + yplus, obj_shotgunblock) return true
	}
	if _num > 0
	{
		ds_list_clear(global.instancelist)
		return true;
	}
	ds_list_clear(global.instancelist)
	return false
}

function scr_destroy_metal(xplus = 0, yplus = 0)
{
	var _num = instance_place_list(x + xplus, y + yplus, obj_metalblock, global.instancelist, 0)
	
	if _num > 0
	{
		GamepadSetVibration(0, 0.8, 0.8, 0.5)
		for (var i = 0; i < ds_list_size(global.instancelist); i++)
			instance_destroy(ds_list_find_value(global.instancelist, i))
		ds_list_clear(global.instancelist)
	}
}