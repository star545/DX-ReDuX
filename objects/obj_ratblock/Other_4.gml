if (ds_list_find_index(global.saveroom, id) != -1)
	instance_destroy()
	
	switch global.leveltosave {
	
		case "medieval":
		sprite_index = spr_ratblock5
		spr_dead = spr_ratblock5_dead
		break
		
		case "badland":
		sprite_index = spr_ratblock7
		spr_dead = spr_ratblock7_dead
		break
		
		case "farm":
		sprite_index = spr_ratblock8
		spr_dead = spr_ratblock8_dead
		break
	
		case "saloon":
		sprite_index = spr_ratblock4
		spr_dead = spr_ratblock4_dead
		break
	
		case "space":
		sprite_index = spr_ratblock9
		spr_dead = spr_ratblock9_dead
		break
		
		case "sewer":
		sprite_index = spr_ratblock2
		spr_dead = spr_ratblock2_dead
		break
		
		case "plage":
		sprite_index = spr_ratblock3
		spr_dead = spr_ratblock3_dead
		break
		
		case "industrial":
		sprite_index = spr_ratblock1
		spr_dead = spr_ratblock1_dead
		break
		
		
		case "champ":
		sprite_index = spr_ratblock10
		spr_dead = spr_ratblock10_dead
		break
		
		
		default:
		sprite_index = spr_ratblock
		spr_dead = spr_ratblock_dead
		break
		
	}