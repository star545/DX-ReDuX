function scr_savescore(argument0, save_arena = false)
{
	global.rank = get_player_rank(save_arena)
	if global.cheat_disable global.rank = "d"
	var _a = global.rank
	audio_stop_all()	
	if obj_player.character = (characters.pizzelle) {
	var _b = asset_get_index(concat("mu_rankPZ", _a))
	} else {
	var _b = asset_get_index(concat("mu_rank", _a))
	}
	if !save_arena && argument0 != "exit" scr_soundeffect(_b)
	else scr_soundeffect(sfx_bosswin)
	audio_stop_sound(mu_pizzatime)
	audio_stop_sound(mu_noiseescape)
	audio_stop_sound(mu_dragonlair)
	audio_stop_sound(mu_snickchallenge)
	audio_stop_sound(mu_deathmode)
	
	ini_open_from_string(obj_savesystem.ini_str)
	if !global.cheat_disable {
	var new_rank = rank_checker(global.rank)
	if instance_exists(obj_arenamode_controller) {
		var cur_arena_rank = rank_checker(ini_read_string("ArenaRanks", argument0, "d"))	
		if (ini_read_real("ArenaScore", argument0, 0) < global.collect)
			ini_write_real("ArenaScore", argument0, global.collect)
		if (ini_read_real("ArenaRound", argument0, 0) < global.arenaphase)
			ini_write_real("ArenaRound", argument0, global.arenaphase)
		if (ini_read_real("ArenaTime", argument0, 0) > global.speedrun_timer)
			ini_write_real("ArenaTime", argument0, global.speedrun_timer)
		if save_arena {
			if cur_arena_rank < new_rank ini_write_string("Ranks", argument0, global.rank)
		}
		
	}
	else if !global.death_mode {
		
		var cur_rank = rank_checker(ini_read_string("Ranks", argument0, "d"))	
		//trace("ranks - ", cur_rank, " - ", new_rank)
		ini_write_real("Collectibles", "pizzacoin", global.pizzacoin)
		if (ini_read_real("Highscore", argument0, 0) < global.collect)
			ini_write_real("Highscore", argument0, global.collect)
		if (ini_read_real("Treasure", argument0, 0) == 0)
			ini_write_real("Treasure", argument0, global.treasure)
		if (global.secretfound > 3)
			global.secretfound = 3
		if (ini_read_real("Secret", argument0, 0) < global.secretfound)
			ini_write_string("Secret", argument0, global.secretfound)
		if (ini_read_real("Toppin", (argument0 + "1"), 0) == 0)
			ini_write_real("Toppin", (argument0 + "1"), global.shroomfollow)
		if (ini_read_real("Toppin", (argument0 + "2"), 0) == 0)
			ini_write_real("Toppin", (argument0 + "2"), global.cheesefollow)
		if (ini_read_real("Toppin", (argument0 + "3"), 0) == 0)
			ini_write_real("Toppin", (argument0 + "3"), global.tomatofollow)
		if (ini_read_real("Toppin", (argument0 + "4"), 0) == 0)
			ini_write_real("Toppin", (argument0 + "4"), global.sausagefollow)
		if (ini_read_real("Toppin", (argument0 + "5"), 0) == 0)
			ini_write_real("Toppin", (argument0 + "5"), global.pineapplefollow)
		if cur_rank < new_rank
			ini_write_string("Ranks", argument0, global.rank)
		if (ini_read_real("Time", argument0, 0) > global.speedrun_timer)
			ini_write_real("Time", argument0, global.speedrun_timer)
	} else {
		var death_rank = rank_checker(ini_read_string("Death", argument0, "d"))
		if (ini_read_real("D_Highscore", argument0, 0) < global.collect)
			ini_write_real("D_Highscore", argument0, global.collect)
		if (ini_read_real("D_Time", argument0, 0) > global.speedrun_timer)
			ini_write_real("D_Time", argument0, global.speedrun_timer)	
		//trace("ranks", death_rank, new_rank)
		if death_rank < new_rank
			ini_write_string("Death", argument0, global.rank)
		
	}
	}
	obj_savesystem.ini_str = ini_close()
	exit;
}

function rank_checker(rank = global.rank)
{

	var value = 0;
	switch (rank)
	{
		case "p":
			value = 5;
		break;		
		case "s":
			value = 4;
		break;					
		case "a":
			value = 3;
		break;					
		case "b":
			value = 2;
		break;					
		case "c":
			value = 1;
		break;					
		case "d":
			value = 0;
		break;	
		default:
			value = -4;
		break;
	}
	return value;
}

function get_level_pct(level) {
	// Percents
	// Normal Rank 33%
	// Death Rank 33%
	// Toppins + secrets 24%
	// Treasure 10%
	ini_open_from_string(obj_savesystem.ini_str)

	var rank = ini_read_string("Ranks", string(level), -4)
	var death_rank = ini_read_string("Death", string(level), -4)


	var secret_count = ini_read_string("Secret", string(level), 0)
	var mush = ini_read_real("Toppin", (string(level) + "1"), 0)
	var cheese = ini_read_real("Toppin", (string(level) + "2"), 0)
	var tomat = ini_read_real("Toppin", (string(level) + "3"), 0)
	var saus = ini_read_real("Toppin", (string(level) + "4"), 0)
	var papple = ini_read_real("Toppin", (string(level) + "5"), 0)
	var treasure = ini_read_real("Treasure", string(level), 0)
	ini_close()

	switch level {
		default:
			var toppin_pct = ((real(secret_count) + mush + cheese + tomat + saus + papple) / 8) * 24
			var treasure_pct = treasure * 10
			var death_pct = clamp((rank_checker(death_rank) / 5) * 33, 0, 33)
			var rank_pct = clamp((rank_checker(rank) / 5) * 33, 0, 33)
		break
		case "exit":
			var toppin_pct = 0
			var treasure_pct = 0
			var death_pct = 0
			var rank_pct = (rank_checker(rank) / 5) * 100
		
		break
	
	}
	return clamp(round(toppin_pct + treasure_pct + death_pct + rank_pct), 0, 100)
}
function get_level_rank(level) {
	ini_open_from_string(obj_savesystem.ini_str)
	var rank = ini_read_string("Ranks", string(level), "d")
	ini_close()
	trace(rank_checker(rank))
	return rank_checker(rank)
	
}
function get_player_rank(arena = 0, as_perc = 0) {
	var c_cond = arena ? global.arenaphase >= 5 : (global.collect >= global.crank)

	var b_cond = arena ? global.arenaphase >= 10 : (global.collect >= global.brank)
	var a_cond = arena ? global.arenaphase >= 15 : (global.collect >= global.arank)
	var s_cond = arena ? global.arenaphase >= 20 : (global.collect >= global.srank)
	var p_cond_normal = ((global.shroomfollow && global.cheesefollow && global.tomatofollow && global.sausagefollow && global.pineapplefollow && global.treasure && global.secretfound >= 3 && global.laps >= 1) || global.leveltosave == "exit") && !global.combodropped
	var p_cond_death = (!global.timerdropped && (global.shroomfollow && global.cheesefollow && global.tomatofollow && global.sausagefollow && global.pineapplefollow))
	var p_cond_arena = global.hurtcounter < 5
	var p_cond = s_cond && (arena ? p_cond_arena : (global.death_mode ? p_cond_death : p_cond_normal))
	if !as_perc {
		if p_cond return "p"
		else if s_cond return "s"
		else if a_cond return "a"
		else if b_cond return "b"
		else if c_cond return "c"
		else return "d"	
	} else {
		if p_cond return 0
		else if s_cond {
			var p_pct_normal = (global.leveltosave != "exit" && !global.combodropped ? (((global.shroomfollow + global.cheesefollow + global.tomatofollow + global.sausagefollow + global.pineapplefollow + global.treasure + (global.laps >= 1)) / 7)) : 0)
			var p_pct_death = !global.timerdropped ? ((global.shroomfollow + global.cheesefollow + global.tomatofollow + global.sausagefollow + global.pineapplefollow) / 5) : 0
			var p_pct_arena = clamp((5 - global.hurtcounter) / 5, 0, 1)
			return clamp(arena ? p_pct_arena : (global.death_mode ? p_pct_death : p_pct_normal), 0, 1)
		} else if a_cond return clamp(arena ? ((global.arenaphase - 15) / 5) : ((global.collect - global.arank) / (global.srank - global.arank)), 0, 1)
		else if b_cond return clamp(arena ? ((global.arenaphase - 10) / 5) : ((global.collect - global.brank) / (global.arank - global.brank)), 0, 1)
		else if c_cond return clamp(arena ? ((global.arenaphase - 5) / 5) : ((global.collect - global.crank) / (global.brank - global.crank)), 0, 1)
		else return clamp(arena ? ((global.arenaphase) / 5) : (global.collect / global.crank), 0, 1)
	}
	
	
}
