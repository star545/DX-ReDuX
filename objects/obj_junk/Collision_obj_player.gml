var _obj_player = other.id
with other {
	if (state == states.handstandjump or state == states.punch or state == states.lungeattack)
	{
	
		sprite_index = spr_haulingstart
		if (!grounded)
			vsp = -6
		swingdingendcooldown = 0
		state = states.grab
						
		grabbingenemy = 1
		other.state = states.grabbed
		other.grabbedby = _obj_player
		if other.object_index != obj_pizzaball ds_list_add_unique(local_grab_list, other.id)
		//else scr_pizzaball_setgrabbed(bID)
	}
}
