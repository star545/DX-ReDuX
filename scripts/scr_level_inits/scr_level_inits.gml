function escape_time() {
	var a = 0
	switch room {
		default: a = time_in_frames(4, 30) break;
		case demozero_john: a = time_in_frames(1, 15) break;
		case entrance_10: a = time_in_frames(3, 30) break;	
		case medieval_10: a = time_in_frames(3, 15) break;
		case ruin_11: a = time_in_frames(3, 15) break;
		case dungeon_10: a = time_in_frames(3, 45) break;
		
		case badland_9: a = time_in_frames(2, 50) break;
		case graveyard_6: a = time_in_frames(3, 45) break;
		case farm_11: a = time_in_frames(3, 0) break;
		case saloon_6: a = time_in_frames(2, 30) break;
		
		case plage_cavern2: a = time_in_frames(3, 15) break;
		case forest_john: a = time_in_frames(2, 30) break;
		case space_9: a = time_in_frames(2, 45) break;
		case minigolf_8: a = time_in_frames(3, 45) break;
		
		case sewer_8: a = time_in_frames(3, 45) break;
		case industrial_5: a = time_in_frames(3, 0) break;
		case freezer_escape1: a = time_in_frames(2, 45) break;
		case street_john: a = time_in_frames(3, 0) break;
		
		case chateau_9: a = time_in_frames(3, 30) break;
		case mansion_2_john: a = time_in_frames(3, 45) break;
		case kidsparty_john: a = time_in_frames(3, 30) break;
		
		case champ_john: a = time_in_frames(4, 30) break;
	}
	return a 
}

function lap_time() {
	var b = 0
	switch room {
		default: b = time_in_frames(0, 30) break;
		case saloon_lap: b = time_in_frames(0, 45) break;
		
		case entrance_lap: 
		case medieval_1:
			b = time_in_frames(0, 50) 
		break;
		case ruin_1: 
		case forest_lap:
		case space_lap:
		case badland_lap: 
		case street_1: 
			b = time_in_frames(1, 0)
		break;
		case farm_2: 
		case mansion_start: 
		case chateau_lap: 
		case plage_lap:
		case kidsparty_floor1_1:
			b = time_in_frames(1, 15)
		break;
		case dungeon_1:
		case sewer_1:
		case graveyard_1:
		case freezer_lap:
			b = time_in_frames(1, 30)
		break
		case champ_lap:
		case industrial_lap:
		case minigolf_lap:
			b = time_in_frames(2, 0)
		break
		
	}
	return b
}

function set_ranks() {
	var s = 0
	switch room {
		case entrance_1: s = 24000 break;
		case medieval_1: s = 26500 break;	
		case ruin_1: s = 26000 break;
		case dungeon_1: s = 24000 break;
		
		case badland_1: s = 23000 break;
		case farm_1: s = 23000 break;
		case graveyard_1: s = 24750 break;
		case saloon_1: s = 23500 break;
		
		case plage_entrance: s = 21500 break;
		case forest_1: s = 22000 break;
		case space_1: s = 25750 break;
		case minigolf_1: s = 24000 break;
		
		case sewer_1: s = 26000 break;
		case industrial_1: s = 18500 break;
		case freezer_1: s = 22000 break;
		case street_intro: s = 25000 break;
		
		case chateau_1: s = 27500 break;
		case kidsparty_1: s = 29000 break;
		case mansion_start: s = 30000 break;
		case war_1: s = 19500 break;
		
		case champ_1: s = 60000 break;
		case tower_finalhallway: s = 20000 break;
		
		case mania_1: s = 18000 break;
		case demozero_1: s = 25000 break;
	}
	if s != 0 {
		global.srank = s
		global.arank = (global.srank - (global.srank / 4))
		global.brank = (global.srank - ((global.srank / 4) * 2))
		global.crank = (global.srank - ((global.srank / 4) * 3))	
	}
}