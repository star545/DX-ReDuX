if sprite_index == spr_spider x += (image_xscale * 5)
else { 
	if anim_end() sprite_index = spr_spider
	x = Approach(x, webID.x, 5)
}
if webID != -4 && active
x = clamp(x, webID.x - 520, webID.x + 520)