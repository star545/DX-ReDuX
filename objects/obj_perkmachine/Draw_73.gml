draw_set_font(global.bigfont)
draw_set_halign(fa_center)
if show_text draw_text_scribble(x, y - 150, "[shake]" + string_upper(perk_id.name))
draw_set_font(global.promptfont)
if show_text draw_text_scribble(x, y - 100, perk_id.cost)