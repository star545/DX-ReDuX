if (global.option_funnyhud || room == editor_room || room == rm_baby || !global.showhud || obj_player1.state == states.bossdefeat)
	exit;
if obj_player1.super_mario exit;	
draw_set_font(global.bigfont)
draw_set_halign(fa_left)
draw_text((15 + random_range(-1, 1)), (500 + txt_y), txt_array[global.attackstyle])	
draw_set_halign(fa_right)
draw_text((945 + random_range(-1, 1)), (500 + txt_y2), txt_array2[global.sidemove])	
draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
if instance_exists(obj_wartimer) || global.panic || instance_exists(obj_arenamode_controller)
	var promptY = 425
else
	var promptY = 500

draw_set_alpha(promptalpha)
draw_text_scribble(480, promptY, "[fa_middle][shake]" + controlprompt)
draw_set_alpha(1)


if is_bossroom() || (is_hub() && !global.panic)
	exit;



var collect_x = irandom_range((-collect_shake), collect_shake)
var collect_y = irandom_range((-collect_shake), collect_shake)
var tv_x = 845
var tv_y = 80
if global.sugary tv_y += Wave(2, -2, 3, 0);
var _cx = tv_x + combo_posX;
var _cy = tv_y + 117 + hud_posY + combo_posY;
var _perc = global.combotime / 60;
var _minX = _cx - 56;
var _maxX = _cx + 59;
combofill_index += 0.35
if combofill_index = anim_end(image_number - 1, spr_tv_combobubblefill) combofill_index = 0
combofill_x = lerp(combofill_x, _minX + ((_maxX - _minX) * _perc), 0.5);
combofill_y = _cy;
draw_sprite(spr_tv_combobubblefill, combofill_index, combofill_x, combofill_y);
draw_sprite(spr_tv_combobubble, -1, _cx, _cy);
draw_set_halign(0);
draw_set_font(global.combofont2)
draw_set_valign(0);
var _tx = _cx - 64;
var _ty = _cy - 12;
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
	if !global.sugary draw_sprite_ext(spr_tv_bg, 0, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY), 1, 1, 0, c_white, alpha)
	if global.sugary && sprite_index != tv_turnon draw_sprite_ext(draw_static ? spr_pizzy_tvpropeller_static : spr_pizzy_tvpropeller, prop_index, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY), 1, 1, 0, c_white, alpha)
	shader_set(global.Pal_Shader)
	player_palette()
	
	draw_sprite_ext(sprite_index, image_index, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY), 1, 1, 0, c_white, alpha)
	
	shader_reset()
	if sprite_index != tv_turnon draw_sprite_ext(global.sugary ? spr_pizzy_tv_frame : spr_tv_frame, 0, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY), 1, 1, 0, c_white, alpha)
	if draw_static {
		static_index += 0.3
		draw_sprite_ext(global.sugary ? spr_pizzy_tvstatic : spr_tv_newstatic, static_index, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY), 1, 1, 0, c_white, alpha)
	}
	/*
	draw_sprite(spr_speakerHUD, -1, tv_x - 200, tv_y + 150)
	draw_set_font(global.bigfont)
	draw_set_halign(fa_center)
	draw_text(_ttx + 160, _tty - 20, concat(mins, ":", secs))
	*/
	draw_sprite_ext(asset_get_index("spr_shieldbar" + string(obj_player.pizzashield)), -1, tv_x, tv_y + 170, 1, 1, 0, barblend, alpha)
	if global.cheat_disable draw_sprite(spr_nosave, -1, tv_x + 20, tv_y + 50)
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
if instance_exists(obj_pizzaball)
	draw_text(832, 300, ((string(global.golfhit) + " ") + "GOLF HIT"))
var _ttx = timer_x
var _tty = timer_y
	
if global.panic && !global.death_mode
{
	var _fill = targetfill
	var _currentbarpos = (chunkmax - _fill)
	_perc = (_currentbarpos / chunkmax)
	var _max_x = 299
	var _barpos = (_max_x * _perc)
	if (!surface_exists(bar_surface))
		bar_surface = surface_create(298, 30)
	real_barpos = lerp(real_barpos, _barpos, 0.015)
	var _barfillpos = (floor(_barpos) + 13)
	if (_barfillpos > 0)
	{
		surface_resize(bar_surface, _barfillpos, 30)
		surface_set_target(bar_surface)
		draw_clear_alpha(c_black, 0)
		var clip_x = (_ttx + 3)
		var clip_y = (_tty + 5)
		for (i = 0; i < 3; i++)
			draw_sprite(spr_timer_barfill, 0, (barfill_x + (i * 173)), 0)
		surface_reset_target()
		draw_surface(bar_surface, clip_x, clip_y)
	}
	draw_sprite(spr_timer_bar, -1, _ttx, _tty)
	draw_sprite(johnface_sprite, johnface_index, ((_ttx + 13) + _barpos), (_tty + 20))
	draw_sprite(pizzaface_sprite, pizzaface_index, (_ttx + 320), (_tty + 10))
	
	var timeinsecs = floor(targetfill / (60))
	var mins = floor(timeinsecs / 60)
	var secs = timeinsecs % 60
	if secs < 10
		secs = concat("0", secs)
	draw_set_font(global.bigfont)
	draw_set_halign(fa_center)
	draw_text(_ttx + 160, _tty - 20, concat(mins, ":", secs))
}

// Handle CHEATNG!  
if (global.hardmode || global.cheat_pogoratkill || global.cheat_infammo || global.option_doubleenem || obj_pause.queue_cheating || (global.cheat_pizzagooch && (not global.arenaphase >= 1))) && !is_hub() && !global.cheat_disable {
	global.cheat_disable = true
	if obj_pause.queue_cheating obj_pause.queue_cheating = false	
}



for (var p = 0; p < array_length(global.perklist); p++) {
	_yy = 420 + (p > 4 ? 30 : 0)
	draw_sprite(spr_perkicons, global.perklist[p], 10 + ((p % 5) * 30), _yy)	
}

