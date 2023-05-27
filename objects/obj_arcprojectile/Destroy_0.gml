var dir = 1
if elite && !shatter {
	repeat(2) {
		with (instance_create(x, y, obj_arcprojectile))
		{
			image_xscale = dir
			hsp = (image_xscale * 6)
			vsp = -8
			shatter = 1
			image_xscale = 0.5
			image_yscale = 0.5
			
		}
		dir *= -1
	}
}