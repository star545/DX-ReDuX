

if world == quick_ini_read_real("BabyPeppino", "event1", 0) {
	quick_ini_write_real("BabyPeppino", "event1", quick_ini_read_real("BabyPeppino", "event1", 0) + 1)
	if quick_ini_read_real("BabyPeppino", "event1", 0) >= 6 && get_progress() >= 1 {
		with instance_create(x, y, obj_keypiece) {
			keyid = "w5_2"	
		}	
	}
}