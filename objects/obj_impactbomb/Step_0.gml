
if (grounded || scr_solid(x + hsp, y))
	instance_destroy()
hsp = (movespeed * image_xscale)	
if (vsp < 12)
	vsp += grav
scr_collision()


