
if obj_player1.super_mario && room != Realtitlescreen && room != SPOOK {
	draw_sprite(spr_mariohud, 0, 0, 0) 
	exit;	
}
if obj_player1.state == states.gameover exit;
//if obj_player1.super_mario exit;
if (room == editor_room || room == rm_baby || !global.showhud || obj_player1.state == states.bossdefeat)
	exit;
		
if (global.leveltosave != -4 && (global.leveltosave != "exit" || global.panic)) || room == rank_room { 
	if room != rank_room && obj_player1.state != states.chainsaw global.speedrun_timer++
	var milisecs = global.speedrun_timer % 60
	var timeinsecs = floor(global.speedrun_timer / (60))
	var mins = floor(timeinsecs / 60)
	var secs = timeinsecs % 60
		
		
		
		
	if secs < 10 secs = concat("0", secs)
	if mins < 10 mins = concat("0", mins)
	if milisecs < 10 milisecs = concat("0", milisecs)
	var timer = concat(mins, ":", secs, ".", milisecs)
	draw_set_font(global.font_small);
	
	draw_text_scribble(950, 540, "[fa_right][fa_bottom]" + timer)
		
} 
	

if room == rank_room exit;


if (obj_player.x < 250 && obj_player.y < 169)
	hud_posY = Approach(hud_posY, -300, 15)
else
	hud_posY = Approach(hud_posY, 0, 15)
pizzascore_index += (0.25 * get_heat_player())
if get_heat_player() <= 0 {
	if floor(pizzascore_index) != 0 pizzascore_index += 0.35
	else pizzascore_index = 0		
}


if (pizzascore_index > (pizzascore_number - 1))
	pizzascore_index = (0 + frac(pizzascore_index))
	
var pizza_hud_spr = global.sugary ? spr_cakescore : spr_pizzascore
var heat_spr = global.sugary || global.option_funnyhud ? spr_ss_heatmeter : spr_heatmeter
var heatfill_spr = global.sugary ? spr_ss_heatmeterfill : spr_heatmeter_fill
if global.option_funnyhud heatfill_spr = spr_ss_heatmeterOLD
var heatfillpal_spr = global.sugary ? spr_ss_heatmeterpal : spr_heatmeter_palette

var sToppin = global.sugary ? spr_cakescore_srank : spr_pizzascore_shroom
var aToppin = global.sugary ? spr_cakescore_arank : spr_pizzascore_olive
var bToppin = global.sugary ? spr_cakescore_brank : spr_pizzascore_pepperoni
var cToppin = global.sugary ? spr_cakescore_crank : spr_pizzascore_pepper
	
	
	
	
var sw = sprite_get_width(heatfill_spr)
var sh = sprite_get_height(heatfill_spr)
var b = global.stylemultiplier
var hud_xx = (121 + irandom_range((-collect_shake), collect_shake))
var hud_yy = ((70 + irandom_range((-collect_shake), collect_shake)) + hud_posY)
if global.option_funnyhud {
	hud_xx = 145
	hud_yy = 145
}

if global.option_heatmeter {
	shader_set(global.Pal_Shader)
	pal_swap_set(heatfillpal_spr, global.sugary ? floor(b * 5) : (b * 4), 0)
	draw_sprite_part(heatfill_spr, pizzascore_index, 0, 0, (sw * b), sh, (hud_xx - 95), (hud_yy + 24))
	draw_sprite_ext(heat_spr, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
	shader_reset()
		
} else hud_yy += 22
if global.option_funnyhud == false
	draw_sprite_ext(pizza_hud_spr, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
var _score = global.collect
if global.coop
	_score += global.collectN
if global.option_funnyhud == false {
	if (_score >= global.crank)
		draw_sprite_ext(cToppin, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
	if (_score >= global.brank)
		draw_sprite_ext(bToppin, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
	if (_score >= global.arank)
		draw_sprite_ext(aToppin, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
	if (_score >= global.srank)
		draw_sprite_ext(sToppin, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
}
var rx = (hud_xx + 142)
var ry = (hud_yy - 22)
var rank_ix = rank_checker(get_player_rank(instance_exists(obj_arenamode_controller)))
/*
if !instance_exists(obj_arenamode_controller) {
	if (_score >= global.srank) {
		rank_ix = 4
		if (global.death_mode && global.shroomfollow && global.cheesefollow && global.tomatofollow && global.sausagefollow && global.pineapplefollow)
			rank_ix = 5
		if (!global.combodropped && !global.death_mode && (global.laps >= 1 || global.leveltosave == "exit"))
			rank_ix = 5
		
	
	}
	else if (_score >= global.arank)
		rank_ix = 3
	else if (_score >= global.brank)
		rank_ix = 2
	else if (_score >= global.crank)
		rank_ix = 1
} else {
	if global.arenaphase >= 20 {
		rank_ix = 4
		if global.hurtcounter < 5 rank_ix = 5
	}
	else if global.arenaphase >= 15 rank_ix = 3
	else if global.arenaphase >= 10 rank_ix = 2
	else if global.arenaphase >= 5 rank_ix = 1
	//else rank_ix = 0
	
}
*/
if (previousrank != rank_ix)
{
	previousrank = rank_ix
	rank_scale = 3
}
rank_scale = Approach(rank_scale, 1, 0.2)
	
var rank_fill = global.death_mode ? spr_death_ranksfill : (global.sugary ? spr_ranks_sugaryfill : spr_ranks_hudfill)
var rank = global.death_mode ? spr_death_ranks : (global.sugary ? spr_ranks_sugary : spr_normal_ranks)
var spr_w = sprite_get_width(rank_fill)
var spr_h = sprite_get_height(rank_fill)
var spr_xo = sprite_get_xoffset(rank)
var spr_yo = sprite_get_yoffset(rank)
var perc = get_player_rank(instance_exists(obj_arenamode_controller), 1)
/*
switch rank_ix
{
	case 5:
		perc = 1
	break
	case 4:
		if global.death_mode 
			perc = (global.shroomfollow + global.cheesefollow + global.tomatofollow + global.sausagefollow + global.pineapplefollow) / 5
		else if instance_exists(obj_arenamode_controller) 
			perc = clamp((5 - global.hurtcounter) / 5, 0, 1)
		
		else 
			perc = 0
		break
	case 3:
		perc = ((_score - global.arank) / (global.srank - global.arank))
		if instance_exists(obj_arenamode_controller) perc = ((global.arenaphase - 15) / 5)
		break
	case 2:
		perc = ((_score - global.brank) / (global.arank - global.brank))
		if instance_exists(obj_arenamode_controller) perc = ((global.arenaphase - 10) / 5)
		break
	case 1:
		perc = ((_score - global.crank) / (global.brank - global.crank))
		if instance_exists(obj_arenamode_controller) perc = ((global.arenaphase - 5) / 5)
		break
	default:
		perc = (_score / global.crank)
		if instance_exists(obj_arenamode_controller) perc = (global.arenaphase / 5)
		break;
}
*/
var t = (spr_h * perc)
var top = (spr_h - t)
if !global.option_funnyhud {
	draw_sprite_ext(rank, rank_ix, rx, ry, rank_scale, rank_scale, 0, c_white, 1)
	if rank_ix != 5
		draw_sprite_part(rank_fill, rank_ix, 0, top, spr_w, (spr_h - top), (rx - spr_xo), ((ry - spr_yo) + top))
}
draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_set_font(global.collectfont)
if global.sugary draw_set_font(global.collectfont_sugary)
var text_y = 0
switch floor(pizzascore_index)
{
	case 1:
	case 2:
	case 3:
		text_y = 1
		break
	case 5:
	case 10:
		text_y = -1
		break
	case 6:
	case 9:
		text_y = -2
		break
	case 7:
		text_y = -3
		break
	case 8:
		text_y = -5
		break
}

var cs = 0
with (obj_comboend)
	cs += comboscore
var sc = ((_score - global.comboscore) - cs)
var str = string(sc)
var num = string_length(str)
var w = string_width(str)
var xx = (hud_xx - (w / 2))
if (lastcollect != sc)
{
	color_array = array_create(num, 0);
	for (i = 0; i < array_length(color_array); i++)
		color_array[i] = choose(irandom(3));
	lastcollect = sc;
}
shader_set(global.Pal_Shader);
draw_set_alpha(alpha);
if !global.option_funnyhud {
	for (i = 0; i < num; i++)
	{
		var yy = (((i + 1) % 2) == 0) ? -5 : 0;
		var c = color_array[i];
		pal_swap_set(spr_font_palette, c, false);
		draw_text(floor(xx), floor((hud_yy - 56) + text_y + yy), string_char_at(str, i + 1));
		xx += (w / num);
	}
}
draw_set_alpha(1)
shader_reset()
draw_set_font(global.bigfont)
draw_set_halign(fa_left)
draw_set_color(c_white)
var _laptxt = ("LAP " + string(global.laps))
lap_face_index += 0.35
if lap_face_index >= sprite_get_number(spr_johnface_lap) - 1 lap_face_index = frac(lap_face_index)
if (global.laps > 0) {
    draw_text_scribble(960 - 94, 489, "[spr_smallfont][fa_middle][fa_right]" + _laptxt)
	draw_sprite_ext(spr_johnface_lap, lap_face_index, 960 - 46, 489, -1, 1, 0, c_white, 1)	
}
draw_set_font(global.smallfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
var _blx = 40
var _gsx = 145 // not used i think?? i dunno
var _bly = 160
if instance_exists(obj_arenamode_controller) _bly += 50
if global.option_funnyhud _bly += 50
if global.sidemove == 1 {
	draw_sprite(asset_get_index("spr_tier" + string(global.bullet)), -1, _blx, _bly)
	draw_sprite(asset_get_index("spr_tier" + string(global.fuel) + "f"), -1, _blx, _bly + 63)
}
	