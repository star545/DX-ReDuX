if (flash == 1 && alarm[0] <= 0)
	alarm[0] = (0.15 * room_speed)
image_speed = 0.35	
if state != states.finishingblow {
	scr_collision()
	if final && !slam && grounded && vsp > 0 {
		shake_cam(10)
		slam = 1
		flash = true
		create_particle(x, y, particle.groundpoundeffect)
		scr_soundeffect(sfx_groundpound)
		
	}
	var lawl = room == tower_arenatutorial ? 1 : global.arenaphase
	var formula = 1 + (power(lawl - 1, 3) * 0.01)
	perk[perks.health_station].cost = max(round(1000 * formula), 1000)
	var buy = true
	with obj_arenamode_controller if player_hp >= player_hp_max buy = false
	if place_meeting(x, y, obj_player1) && buy && obj_player1.key_up2 && obj_player1.state != states.firemouth && obj_player1.state == states.normal && global.collect >= perk_id.cost {
		global.collect -= perk_id.cost
		obj_player1.key_up2 = false
		for (var i = 0; i < global.comboscore; i += 1000)
			create_collect((obj_player1.x + irandom_range(-60, 60)), ((obj_player1.y - 100) + irandom_range(-60, 60)), choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect))
		global.comboscore = 0
		event_user(0)
	
	}
	if place_meeting(x, y, obj_player1) && obj_player1.state != states.firemouth { show_text = true scr_controlprompt("[spr_promptfont]" + perk_id.desc, -1) }
	else show_text = false
} else { 
	state = states.normal
	
}