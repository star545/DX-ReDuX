if place_meeting_solid(x, y) && (state != states.grabbed && state != states.portal && state != states.pummel && state != states.lungeattack && state != states.hit && state != states.secret && ((!(place_meeting(x, y, obj_destructibles))) or place_meeting(x, y, obj_onewaybigblock)))
	instance_destroy()
