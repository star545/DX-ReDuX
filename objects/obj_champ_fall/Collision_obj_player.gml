with other {
	if instance_exists(obj_doorC) {
		x = obj_doorC.x	
		y = obj_doorC.y
		vsp = 18
		if isgustavo state = states.ratmountgroundpound
		else state = states.freefall
		with obj_pizzaface {
			x = other.x 
			y = other.y - 1000
			
		}
		
	}
	
	
}