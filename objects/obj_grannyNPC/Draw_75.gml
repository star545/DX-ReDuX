var active = place_meeting(x, y, obj_player)
var idlew = sprite_get_width(idlespr) / 2
active |= number_in_range(obj_player.x, x - (idlew * 1.5), x + (idlew * 1.5)) && point_distance(0, obj_player.y, 0, y) < 35



sprite_index = active ? activespr : idlespr
var tgty = min(-string_height(msg), -sprite_get_height((dialogbox)))
switch txt_state {
	case 0: 	
		txt_vsp = 0
		txt_y = Approach(txt_y, tgty, 8)
		if active txt_state = 1
	break;	
	case 1:
		txt_vsp += 0.35
		txt_y = Approach(txt_y, 8, txt_vsp)
		if txt_y >= 6 txt_state = 2
	break;
	case 2:
		txt_vsp = 0
		txt_y = lerp(txt_y, 0, 0.2)
		if !active txt_state = 0
	break
}

var wv = Wave(-5, 5, 5, 20)
var pct = 800 / sprite_get_width(dialogbox)
var pct_y = max(string_height(msg) / sprite_get_height(dialogbox), 1)
if txt_y != tgty {
	draw_sprite_ext(dialogbox, 0, 480 + wv, txt_y, pct, pct_y, 0, c_white, 1)
	

	draw_text_scribble_ext(135 + wv, txt_y + 35, concat("[fa_top][fa_left][c_white][spr_smallfont]", msg), 725)
}
