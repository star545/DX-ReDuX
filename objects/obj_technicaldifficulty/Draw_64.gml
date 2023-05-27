draw_sprite(sprite_index, image_index, 0, 0)
if sprite_index = spr_technicaldifficulty_bg {
shader_set(global.Pal_Shader)
player_palette()
draw_sprite(sprite, 0, 300, 352)
shader_reset()

}
