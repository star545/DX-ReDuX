draw_set_font(global.bigfont)
draw_set_valign(fa_middle)
draw_set_color(c_white)
var _fill = time
var _currentbarpos = (maxtime - _fill)
_perc = (_currentbarpos / maxtime)
var _max_x = 430
var _barpos = (_max_x * _perc)
if (!surface_exists(bar_surface))
    bar_surface = surface_create(430, 38)

real_barpos = lerp(real_barpos, _barpos, 0.05)
var _barfillpos = (floor(real_barpos) + 6)
if (_barfillpos > 0)
{
    surface_resize(bar_surface, _barfillpos, 31)
    surface_set_target(bar_surface)
    draw_clear_alpha(c_black, 0)
    var clip_x = (timer_x + 8)
    var clip_y = (timer_y + 7)
    draw_sprite_tiled(spr_bosstimer_barfill, 0, barfill_x, 0)
    surface_reset_target()
    draw_surface(bar_surface, clip_x, clip_y)
}
draw_sprite(spr_bosstimer_bar, -1, timer_x, timer_y)
if (bell_sprite != spr_bosstimer_hitbell)
	draw_sprite(spr_bosstimer_hammer, 0, ((timer_x + 11) + real_barpos), (timer_y + 12))
draw_sprite(bell_sprite, bell_index, (timer_x + 440), (timer_y + 21))
//draw_text(480, 35, "ROUND " + string(global.arenaphase + fake_num))
/*
var arenaspr = global.arenaphase -1
arenaspr = clamp(arenaspr, 0, 0)
var boss_y = timer_y + 202
draw_sprite(spr_bossrounds, arenaspr, 480, boss_y)
var color = c_black
switch arenaspr {
	case 0:
	color = #c88048
	draw_rectangle_color(534, (boss_y - 66), 597, (boss_y + 8), color, color, color ,color, 0)
	draw_text(565, boss_y - 29, global.arenaphase)
	break
	case 2:
	
	
}
*/
var _hx = 121
var offset = 70
var halfway = player_hp_max / 2
var _tx = offset * (halfway - 1)
_hx -= (_tx / 2)
var _hy = 130
if global.option_heatmeter _hy += 25
if global.option_funnyhud _hy += 100
hp_index += 0.35
if anim_end(sprite_get_number(spr_bosshealth) - 1, hp_index) hp_index = frac(hp_index)
for (var i = 0; i < player_hp_max ; i++) {
	
	var _pos = i % halfway
	var _xx = _hx + (_pos * offset)
	var _yy = _hy
	if i >= halfway { _yy += 10 _xx += 10 }
	draw_sprite_ext(spr_bosshealth, hp_index, _xx, _yy, 1, 1, 0, c_black, 1)
	if i < player_hp draw_sprite_ext(spr_bosshealth, hp_index, _xx, _yy, 1, 1, 0, c_white, 1)

	
}