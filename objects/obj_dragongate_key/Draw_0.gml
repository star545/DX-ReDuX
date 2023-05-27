shake = Approach(shake, 0, 0.5)
if flash draw_sprite_ext_flash(sprite_index, image_index, x + random_range(-shake, shake), y, 1, 1, 0, c_white, image_alpha)
else draw_sprite(sprite_index, image_index, x + random_range(-shake, shake), y)