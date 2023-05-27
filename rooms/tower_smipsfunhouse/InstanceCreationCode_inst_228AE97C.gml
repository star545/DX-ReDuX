msg = "Smip's BATHROOM SIMULATOR"
level = "bigbath"
targetRoom = bath_1
if get_level_pct("bigbath") != 0 {
	sprite_index = spr_arcademachinebath
}
else {
	sprite_index = spr_arcademachinestatic
}