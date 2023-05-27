shader_set(global.Pal_Shader)
if (usepalette) pal_swap_set(spr_palette, paletteselect, 0)
draw_self()
shader_reset()