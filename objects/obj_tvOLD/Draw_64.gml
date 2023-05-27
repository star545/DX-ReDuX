if (room == editor_room)
	exit;
draw_set_font(global.bigfont)
draw_set_halign(fa_left)
draw_text((15 + random_range(-1, 1)), (500 + txt_y), txt_array[global.attackstyle])	
draw_set_halign(fa_right)
draw_text((945 + random_range(-1, 1)), (500 + txt_y2), txt_array2[global.sidemove])	
draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
if is_bossroom()
	exit;



var collect_x = irandom_range((-collect_shake), collect_shake)
var collect_y = irandom_range((-collect_shake), collect_shake)
var tv_x = 845
var tv_y = 80
var _cx = 121
var _cy = 70
var _perc = (global.combotime / 60)
var _minX = (_cx - 56)
var _maxX = (_cx + 59)
combofill_x = lerp(combofill_x, (_minX + ((_maxX - _minX) * _perc)), 0.5)
combofill_y = _cy
draw_sprite(spr_tv_combobubblefill, combofill_index, combofill_x, combofill_y)
draw_sprite(spr_tv_combobubble, -1, _cx, _cy)
draw_set_font(global.combofont2)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
var _tx = (_cx - 64)
var _ty = (_cy + 10)
var _str = string(global.combo)
var num = string_length(_str)
for (var i = num; i > 0; i--)
{
	var char = string_char_at(_str, i)
	draw_text(_tx, _ty, char)
	_tx -= 22
	_ty -= 8
}
if (room != strongcold_endscreen)
{
	draw_sprite_ext(spr_tv_bg, 0, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY), 1, 1, 0, c_white, alpha)
	shader_set(global.Pal_Shader)
	player_palette()
	draw_sprite_ext(sprite_index, image_index, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY), 1, 1, 0, c_white, alpha)
	shader_reset()
	if sprite_index != spr_tv_open
	draw_sprite_ext(spr_tv_frame, 0, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY), 1, 1, 0, c_white, alpha)
}
if (bubblespr != -4)
	draw_sprite_ext(bubblespr, bubbleindex, 512, 53, 1, 1, 1, c_white, alpha)
if (!surface_exists(promptsurface))
	promptsurface = surface_create(290, 102)
surface_set_target(promptsurface)
draw_clear_alpha(c_black, 0)
draw_set_font(font1)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
if (bubblespr == spr_tv_bubble)
{
	promptx -= promptspd
	if (bubblespr != 433 && promptx < (350 - string_width(prompt)))
	{
		bubblespr = spr_tv_bubbleclose
		bubbleindex = 0
	}
	draw_text_color((promptx - 350), 50, prompt, c_black, c_black, c_black, c_black, 1)
}
draw_set_halign(fa_left)
surface_reset_target()
draw_surface(promptsurface, 350, 0)
draw_set_font(global.smallnumber_fnt)
draw_set_halign(fa_center)
var _ttx = timer_x
var _tty = timer_y
	
if instance_exists(obj_wartimer) || global.panic
	var promptY = 425
else
	var promptY = 500

if global.panic && !global.death_mode
{
	var _fill = targetfill
	var _currentbarpos = (chunkmax - _fill)
	_perc = (_currentbarpos / chunkmax)
	var _max_x = 299
	var _barpos = (_max_x * _perc)
	real_barpos = lerp(real_barpos, _barpos, 0.015)
	var _barfillpos = (floor(_barpos) + 13)
	var timeinsecs = floor(targetfill / (60))
	var mins = floor(timeinsecs / 60)
	var secs = timeinsecs % 60
	if secs < 10
		secs = concat("0", secs)
	draw_set_font(timerfont)
	draw_set_halign(fa_center)
	draw_text(160, 20, concat(mins, ":", secs))
}
if (global.combo != 0 && global.option_funnyhud && sprite_index != spr_tv_open && sprite_index != spr_tv_off)
{
    draw_sprite_ext(spr_tv_combo, image_index, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY), 1, 1, 1, c_white, alpha)
    var str = string(global.combo)
    if (global.combo < 10)
        str = concat("0", str)
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    draw_set_font(global.combofont)
    var num = string_length(str)
    var w = (string_width(str) / num)
    var xx = 0
    var yy = 0
    for (var i = 0; i < num; i++)
    {
        var char = string_char_at(str, (i + 1))
        xx = (i * w)
        yy = (i * 5)
        draw_text((tv_x - 44 + xx), ((tv_y - yy) + hud_posY), char)
    }
}



draw_set_alpha(promptalpha)
draw_text_scribble(480, promptY, "[fa_middle][shake]" + controlprompt)
draw_set_alpha(1)
