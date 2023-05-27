shader_set(global.Pal_Shader)
pal_swap_set(spr_palette, paletteselect, 0)
draw_sprite(sprite_index, image_index, x, y + Wave(-5, 5, 3, 10))
shader_reset()