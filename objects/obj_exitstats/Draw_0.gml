draw_self()

var use_time = best_time
var milisecs = use_time % 60
var timeinsecs = floor(use_time / (60))
var mins = floor(timeinsecs / 60)
var secs = timeinsecs % 60
if secs < 10 secs = concat("0", secs)
if mins < 10 mins = concat("0", mins)
if milisecs < 10 milisecs = concat("0", milisecs)
var timer = concat(mins, ":", secs, ":", milisecs)
var use_highscore = highscore
draw_set_font(global.bigfont)
var tpnY = y - 130
if use_highscore != 0 draw_text_scribble(x , tpnY - 75, string(use_highscore) + "[spr_tomatocollect, 0, 0.35]")
if timer != "00:00:00" draw_text_scribble(x , tpnY - 40, string(timer) + "[spr_escapecollect, 0, 0.35]")
if percent != 0 draw_text(x, tpnY - 5 , string(percent) + "%")
var _xx = x
if rank != -4 draw_sprite(spr_normal_ranks, rank_as_num, _xx, tpnY - 140)
//if death_rank != -4 draw_sprite(spr_death_ranks, death_as_num, x + 50, tpnY - 140)