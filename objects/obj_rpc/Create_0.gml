/// @description Initialize Discord.

#macro DISCORD_APP_ID "1107116810177872023"
room_name = ""
ready = false;

alarm[0] = room_speed * 5;
alarm[1] = room_speed * 6;

if (!np_initdiscord(DISCORD_APP_ID, true, np_steam_app_id_empty))
{
	show_error("NekoPresence init fail.", true);
}

var a = object_index
if (instance_number(a) > 1) {
	var _first = instance_find(a, 0);
	if (id != _first) {
		instance_destroy(); 
		exit; 
	}
}