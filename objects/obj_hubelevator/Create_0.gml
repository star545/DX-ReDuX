state = states.normal
hub_array[0] = [tower_dark, "BASEMENT"]
hub_array[1] = [tower_1, "FLOOR 1"]
hub_array[2] = [tower_2, "FLOOR 2"]
hub_array[3] = [tower_3, "FLOOR 3"]
hub_array[4] = [tower_4, "FLOOR 4"]
hub_array[5] = [tower_5, "FLOOR 5"]
hub_array[6] = [tower_finale2, "TOP"]
isgustavo = 0
playerid = -4
selected = 0

switch (room) {
	
	case tower_2:
	selected = 1
	image_index = 1
	break
	
	case tower_3:
	selected = 2
	image_index = 2
	break
	
	case tower_4:
	selected = 3
	image_index = 3
	break
	
	case tower_5:
	selected = 4
	image_index = 4
	break
	
	case tower_finale2:
	selected = 5
	image_index = 5
	break
	
	case tower_dark:
	selected = 6
	image_index = 6
	break
	
	default:
	selected = 0
	image_index = 0
	break
	
}
