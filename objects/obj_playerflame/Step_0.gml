scr_collision()
if anim_end(3) && pulse > 0 {
	pulse--
	image_index = 0
}
if anim_end() instance_destroy()