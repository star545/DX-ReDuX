/// @description Update NekoPresence so async events will execute.

// Ranks
rank = string_upper(get_player_rank(instance_exists(obj_arenamode_controller)))

var logo_set = "default"
switch room {
	default:
		if global.leveltosave != -4 logo_set = global.leveltosave
		//if global.leveltosave == "champ" logo_set = "default"
	break;
	case tower_1:
	case tower_2:
	case tower_3:
	case tower_4:
	case tower_5:
		logo_set = string(room_get_name(room))
	break;
	case tower_finale: case tower_finale2: logo_set = "top" break;
	case tower_top: case tower_arena: logo_set = "exit" break;
}

var real_logo = spr_FAULT
// Set Ranks
var img_rank = concat(rank, " Rank")
if global.death_mode rank = concat("death_", rank)
rank += "rank"
rank = string_lower(rank)
var level_playing = global.levelname

level_playing = (!is_string(global.levelname)) ? "Exploring the hub" : concat("Playing ", global.levelname)

var room_name = string(global.combo) + " Combo!"



np_setpresence_more(img_rank, level_playing, false);

np_setpresence(concat(global.collect, " Score"), room_name, real_logo, rank);

np_update();
alarm[1] = room_speed