function scr_player_actor()
{
	if (sprite_index == spr_player_givepizza or sprite_index == spr_player_gnomecutscene2)
	{
		if (image_index > (image_number - 1))
			image_index = (image_number - 1)
	}
	cutscene = 1
	movespeed = 0
	var _room_x = 0
	var _room_y = 0
	var _room_w = room_width
	var _room_h = room_height
	if (room == custom_lvl_room && cam != noone)
	{
		_room_x = cam.x
		_room_y = cam.y
		_room_w = cam_width
		_room_h = cam_height
	}
	if float
	{
		hsp = 0
		vsp = 0
	}
	x = clamp(x, _room_x, _room_w)
	y = clamp(y, _room_y, _room_h)
	exit;
}

function scr_player_dialog() {
	image_speed = 0.35;
	sprite_index = spr_idle
	if key_taunt2 || (!instance_exists(obj_dialogue) && !instance_exists(obj_dialogue_choices))
		state = states.normal;
	hsp = 0;
	vsp = 0;	
	
}
