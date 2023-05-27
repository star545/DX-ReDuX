draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)

var xLeft = x - sprite_get_xoffset(sprite_index)
var yTop = y - sprite_get_yoffset(sprite_index)

//draw_sprite(sprite_index, 0, x, y)
var tpnY = y - 277
draw_set_font(global.bigfont)

	

if drawing && !closed
{
	if !arena {
		var use_time = mode && death_rank != -4 ? death_time : best_time
		var milisecs = use_time % 60
		var timeinsecs = floor(use_time / (60))
		var mins = floor(timeinsecs / 60)
		var secs = timeinsecs % 60
		if secs < 10 secs = concat("0", secs)
		if mins < 10 mins = concat("0", mins)
		if milisecs < 10 milisecs = concat("0", milisecs)
		var timer = concat(mins, ":", secs, ".", milisecs)
		var use_highscore = mode && death_rank != -4 ? death_highscore : highscore
	
	
	    if use_highscore != 0 draw_text_scribble(x , tpnY - 75, string(use_highscore) + "[spr_tomatocollect, 0, 0.35]")
	    if timer != "00:00.00" draw_text_scribble(x , tpnY - 40, string(timer) + "[spr_escapecollect, 0, 0.35]")
	
		if percent != 0 draw_text(x, tpnY - 5 , string(percent) + "%")
		var _xx = death_rank == -4 ? x : x - 50
		if rank != -4 { 
			draw_sprite(spr_normal_ranks, rank_as_num, _xx, tpnY - 140)
			draw_sprite_ext(treasure_spr, treasure_index, x - 155, tpnY - 40, 1, 1, 0, has_treasure ? c_white : c_black, 1)
		}
		if death_rank != -4 draw_sprite(spr_death_ranks, death_as_num, x + 50, tpnY - 140)
	} else {
		var use_time = arena_time
		var milisecs = use_time % 60
		var timeinsecs = floor(use_time / (60))
		var mins = floor(timeinsecs / 60)
		var secs = timeinsecs % 60
		if secs < 10 secs = concat("0", secs)
		if mins < 10 mins = concat("0", mins)
		if milisecs < 10 milisecs = concat("0", milisecs)
		var timer = concat(mins, ":", secs, ".", milisecs)
		
		if rank != -4 { 
			draw_sprite(spr_normal_ranks, rank_as_num, x, tpnY - 140)
			//draw_sprite_ext(treasure_spr, treasure_index, x - 155, tpnY - 40, 1, 1, 0, has_treasure ? c_white : c_black, 1)
		}
		if arena_highscore != 0 draw_text_scribble(x , tpnY - 75, string(arena_highscore) + "[spr_tomatocollect, 0, 0.35]")
	    if arena_time != "00:00.00" draw_text_scribble(x , tpnY - 40, string(timer) + "[spr_escapecollect, 0, 0.35]")
		if arena_round != 0 draw_text(x, tpnY - 5 , string(arena_round) + " ROUNDS")
		
	}
}
if state == states.options {
	draw_sprite(spr_attackselect, mode, x, y)
}
draw_self()