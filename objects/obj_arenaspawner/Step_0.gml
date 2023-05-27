var _found = 0
var total_count = 0
with obj_baddie {
	total_count++
	if arenaID = other.id 
		_found++
}
if prevROUND != global.arenaphase {
	prevROUND = global.arenaphase
	current_enem = 0
	var formula_for_total_enem = (0.04 * power(global.arenaphase, 2)) + 1
	formula_for_total_enem = clamp(round(formula_for_total_enem), 2, 70)
	//trace("LIMIT", formula_for_total_enem)
	var enemy_limit = clamp(round(formula_for_total_enem / 3), 1, 5)
	for (var i = 0; i < array_length(wave); i++) {
		var _round = wave[i, 0]
		//trace(_round)
		if global.arenaphase == _round {
			max_wave_array = i
			break;
		}
	}
	enemy_array = []
	var enemy_a = wave[max_wave_array, 2]
	var cur_type = wave[max_wave_array, 1]
	if enemy_a != -4 {
		if cur_type == states.arena_all enemy_array = enemy_a
		else { repeat(formula_for_total_enem) array_push(enemy_array, enemy_a[irandom(array_length(enemy_a) - 1)]) }
	}
	enemlimit = enemy_limit
		
	
}

var type = wave[max_wave_array, 1]
var enem = wave[max_wave_array, 2]



switch state {
	case states.normal:
		var proceed = false
		if current_enem < array_length(enemy_array) proceed = true
		
		if anim_end(16) && proceed image_speed = 0	
			
		var in_cam = bbox_in_camera(view_camera[0], 100) || _found < 2
		var enem_max = instance_number(obj_baddie) < 10 || total_count < 10
		
		// If enemies left, proceed.
		if proceed && enem != -4 && _found < enemlimit && enem_max && in_cam && !place_meeting(x, y, obj_player1) {
			state = states.portal
			image_index = 0
			visible = true
			image_speed = 0.35
		}
		
		if anim_end() {
			visible = false
			image_speed = 0
		}
	break
	case states.portal:
		if (floor(image_index) > 5) {
			state = states.normal
			var enem_create = enemy_array[current_enem]
			current_enem++
			if enem_create != obj_nothing {
				with instance_create(x + random_range(-25, 25), y + random_range(-25, 25), enem_create) {
					arenaID = other.id
					state = states.stun
					//hsp = random_range(-5, 5)
					vsp = -3
		            sprite_index = stunfallspr
		            stunned = 5
		            boundbox = 0	
					event_perform(ev_other, ev_room_start)
				}
			}
		}
	break
	
}