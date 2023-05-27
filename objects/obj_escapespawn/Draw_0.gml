draw_self();
scale = (image_index / 8)
color = make_color_hsv(0,0, scale * 255)
if floor(image_index) < 8 {
	shader_set(global.Pal_Shader)
	pal_swap_set(spr_palette, paletteselect, 0);
	draw_sprite_ext(drawSprite, -1, x, y, scale * sign(drawXscale), scale, image_angle, color, image_alpha);
	pal_swap_reset();
}