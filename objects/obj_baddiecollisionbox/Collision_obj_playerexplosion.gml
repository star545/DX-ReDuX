if (instance_exists(baddieID) && baddieID.invtime == 0 && ((baddieID.object_index != obj_bigcheese )) && baddieID.state != states.grabbed && (!baddieID.invincible) && baddieID.instantkillable) {
	var fo = face_obj(obj_player1)
	if fo = 0 fo = -baddieID.image_xscale
	InstakillOther(fo, 1, baddieID)
}