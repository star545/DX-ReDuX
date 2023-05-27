msg = "Smip's GOLFMANIA 9000"
level = "golfmania"
targetRoom = mania_1
if get_level_pct("golfmania") != 0 {
	sprite_index = spr_arcademachinemania
}
else {
	sprite_index = spr_arcademachinestatic
}