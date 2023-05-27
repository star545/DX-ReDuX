var bID = other.baddieID
if !instance_exists(bID)
	exit;

if (instance_exists(bID) && !in_ds_list(bID, pierce_list) && bID.invtime == 0 && (bID.object_index != obj_bigcheese) && bID.state != states.grabbed && bID.state != states.lungeattack && bID.state != states.hit && (!bID.invincible) && bID.instantkillable) {

	ds_list_add(pierce_list, bID)
	InstakillOther(sign(hsp), 5, bID)
	if pierce <= 0
		instance_destroy()
}
	
	
