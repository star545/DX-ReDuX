if (flash == 1 && alarm[0] <= 0)
	alarm[0] = (0.15 * room_speed)
if state != states.finishingblow {
	scr_collision()
	if place_meeting(x, y, obj_player) && alarm[2] < 0 alarm[2] = 1
		
	if place_meeting(x, y, obj_player1) && obj_player1.key_up2 && obj_player1.state != states.firemouth && obj_player1.state == states.normal && global.collect >= perk_id.cost {
		global.collect -= perk_id.cost
		obj_player1.key_up2 = false
		for (var i = 0; i < global.comboscore; i += 1000)
			create_collect((obj_player1.x + irandom_range(-60, 60)), ((obj_player1.y - 100) + irandom_range(-60, 60)), choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect))
		global.comboscore = 0
		//instance_destroy()
		event_user(0)
	
	}
	if place_meeting(x, y, obj_player1) && obj_player1.state != states.firemouth { show_text = true scr_controlprompt("[spr_promptfont]" + perk_id.desc, -1) }
	else show_text = false
}