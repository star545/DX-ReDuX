if (instance_exists(baddieID) && baddieID.invtime == 0 && ((baddieID.object_index != obj_bigcheese)) && baddieID.state != states.grabbed && (!baddieID.invincible) && baddieID.instantkillable)
	InstakillOther(other.image_xscale, 5, baddieID)
	
	