var cent_cam = (camx + (camw / 2)) - xstart
var par_val = (cent_cam * 0.1)
x = (xstart + par_val)
cent_cam = (camy + (camh / 2)) - ystart
par_val = (cent_cam * 0.1)
y = (ystart + par_val)
if number_in_range(obj_player1.x, xstart - 30, xstart + 30) && obj_player1.state == states.Sjumpland && quick_ini_read_real("BabyPeppino", "event3", 0) == 2 && quick_ini_read_real("BabyPeppino", "progress", 0) >= 1  {
	instance_destroy()
	
}