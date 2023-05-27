var p = obj_player1
var tgt_y = 3584 
switch state {
	case states.fall:
		shake = 3
		var a = (distance_between_points(x, 0, 2072, 0) / 4)
		var total_dist = tgt_y - ystart
		var cur_y = tgt_y - y
		var pct = cur_y / total_dist
		y = Approach(y, tgt_y, (pct * 10) + 0.01)
		p.x = lerp(p.x, x - a, 0.05)
		p.y = lerp(p.y, tgt_y + 32, 0.05)
		if y == tgt_y {
			vsp = -10
			state = states.jump
			saved_player_x = p.x
			
		}
	
	break
	case states.jump: 
		shake = false
		scr_collision()
		if grounded  { shake_cam(30, 40) state = states.normal scr_soundeffect(sfx_groundpound) }
	
	break
	case states.normal:
		p.x = saved_player_x + random_range(-fake_cam_shake, fake_cam_shake)
		fake_cam_shake = Approach(fake_cam_shake, 0, 0.5)
		if fake_cam_shake > 0 alarm[0] = 120
	
	break
	case states.transitioncutscene:
		p.y = Approach(p.y, 1552, vsp)
		vsp += 0.15 
		if vsp > 10 && !instance_exists(obj_cutscene_fade) instance_create(x,y, obj_cutscene_fade)
		if p.y == 1552 state = states.finishingblow
	
	break
	
}