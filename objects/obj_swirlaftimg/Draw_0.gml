//gpu_set_blendmode(bm_add)
var o = owner
for (var i = 0; i < count; i++) {
	var c = colors[wrap(i, 0, array_length(colors) - 1)]
	var a = current_time / (i * 500)
	var auraX = sin(a) * (3 + (i / count))
	var auraY = cos(a / 1.1) * (3 + (i / count))
	var alpha = 1 - abs(cos(a / 1.1)) - abs(sin(a))
	draw_sprite_ext(o.sprite_index, o.image_index, o.x + (auraX * 3), o.y + (auraY * 3), o.image_xscale, o.image_yscale, o.image_angle, c, 0.33)
	
	
}
//gpu_set_blendenable(bm_normal)