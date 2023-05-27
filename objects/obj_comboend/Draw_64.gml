var cam = new camera_get_position_struct(view_camera[0])
var xx = x
var yy = y
draw_sprite(spr_comboend, 0, xx, yy)
var title = floor((combo / 5))
var a = get_chardetail("combotitle")
title = clamp(title, 0, floor(((sprite_get_number(a[0]) - 1) / 2)))
draw_sprite(a[irandom(array_length(a) - 1)], ((title * 2) + title_index), xx, (yy + 30))
draw_set_font(global.smallfont)
draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_text(xx, (yy + 60), comboscore)
