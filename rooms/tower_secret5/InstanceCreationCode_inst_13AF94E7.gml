keyid = "w5_secret"
keyr = 5
if quick_ini_read_real("BabyPeppino", "progress", 0) < 1 instance_destroy()
if quick_ini_read_real("BabyPeppino", "event3", 0) < 2 instance_destroy()
step_event = function() {
	x = !instance_exists(obj_soyface) ? xstart : -99999	
	y = !instance_exists(obj_soyface) ? ystart : -99999		
}