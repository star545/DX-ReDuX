if (room != kidsparty_entrance1)
{
	var roomname = room_get_name(room)
	roomname = string_letters(roomname)
	if (roomname == "kidspartyfloor" or roomname == "kidspartyentrance" || room = tower_escape2 || room = champ_secret3 || room = tower_5 || is_pizzaboyroom())
	{
		kidsparty_lightning = 1
		dark_lightning = 0
	}
	else if room == lightsout_arena || room == graveyard_pizzaboy {
		kidsparty_lightning = 0
		dark_lightning = 1	
	}
	else
	{
		kidsparty_lightning = 0
		dark_lightning = 0
	}
}
else
{
	kidsparty_lightning = 0
	dark_lightning = 0
}
if (room == dungeon_5 or room == dungeon_6 || force_dark || room = tower_top2)
{
	use_dark = 1
	for (var i = 0; i < array_length(dark_arr); i++)
		layer_shader(dark_arr[i], shd_darker)
}
else
	use_dark = 0
