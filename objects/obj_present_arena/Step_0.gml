var pos = ds_list_find_index(global.arena_box_list, id)
if pos == -1 { trace("none") exit; }
var upspr = spr[pos, 0]
var idlespr = spr[pos, 1]
var dwnspr = spr[pos, 2]
var deadspr = spr[pos, 3]
if active {
	if sprite_index != upspr && sprite_index != idlespr {
		sprite_index = upspr
		image_index = 0	
	}
	if sprite_index == upspr && anim_end() sprite_index = idlespr
	if killed sprite_index = spr_present
	else {
		var player = instance_place(x, y, obj_player)	
		with player {
			if state == states.handstandjump || state == states.mach3 { 
				if state == states.handstandjump scr_pummel()
				other.killed = true
				shake_cam(20, 40)
				repeat (6) create_baddiedebris()
				scr_soundeffect(sfx_punch)
				other.sprite_index = spr_present
				other.active = false
				global.combotime = 60
				with instance_create(other.x, other.y, obj_sausageman_dead) sprite_index = deadspr	
				if pos == 0 {
					trace("PUT COOL CODE ")
					scr_soundeffect(sfx_collectgiantpizza)
					var a = choose(0, 1, 2)
					switch a {
						case 0:
							global.collect += 1000
						break
						case 1:
							global.combo += 10
							
						break
						case 2:
							with obj_player { red_stew += time_in_frames(0, 45) }
						break
					
					
						
						
					}
					with obj_present_arena {
						active = false
						
					}
					
					
				}
					
				
				
				
			}
			
			
		}
		
		
	}
	
	
} else {
	if sprite_index != dwnspr && sprite_index != spr_present {
		sprite_index = dwnspr
		image_index = 0
		
	}
	if anim_end() && sprite_index == dwnspr sprite_index = spr_present
}