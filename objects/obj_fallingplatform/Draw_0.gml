var _real_x = x
if (fall == 1)
    _real_x += random_range(-6, 6)
draw_sprite_ext(sprite_index, image_index, _real_x, y, image_xscale, image_yscale, image_alpha, image_blend, image_alpha)