if point_in_camera(x, y, view_camera[0]) && sprite_index = spr_fakepeppino_idle {
	sprite_index = spr_fakepeppino_walk
	image_xscale = dir
	hspeed = dir * 8
	
}
image_speed = 0.5
if sprite_index = spr_fakepeppino_walk image_alpha -= 0.1
if image_alpha <= 0 instance_destroy()