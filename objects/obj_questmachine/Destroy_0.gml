with instance_create(x, y, obj_sausageman_dead) {
	sprite_index = other.sprite_index 	
	
}
scr_soundeffect(sfx_killenemy)
repeat(6) create_baddiedebris()
if get_keyname("w3_secret") == true exit;
if get_keypieces() >= 5 && quick_ini_read_real("BabyPeppino", "progress", 0) > 0 {
	with instance_create(x, y, obj_keypiece) {
		keyid = "w3_secret"
		create_particle(x, y, particle.genericpoofeffect)
	}
}