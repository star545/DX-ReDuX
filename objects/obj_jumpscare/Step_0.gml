with (obj_player)
{
	hsp = 0
	vsp = 0
}
global.combotime = 0
instance_destroy(obj_comboend)
var td_spr = spr_3dshroom
if state != 1 {
	if !audio_is_playing(sfx_static) 
		scr_soundeffect_loop(sfx_static)
} else audio_stop_sound(sfx_static)
switch monsterid {
	default: td_spr = spr_3dshroom break;	
	case 1: td_spr = spr_3dcheese break;	
	case 2: td_spr = spr_3dtomato break;	
	case 3: td_spr = spr_3dsausage break;	
	case 4: td_spr = spr_3dpineapple break;	
}
if threedee && state == 1 {
	if !anim_end(sprite_get_number(td_spr) - 1, td_index) {
		td_index += 0.35
		alarm[0] = 5
	}
	
}