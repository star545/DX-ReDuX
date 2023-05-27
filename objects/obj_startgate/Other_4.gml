
switch targetRoom
{
	case entrance_1:
	case medieval_1:
	case ruin_1:
	case dungeon_1:
		world = 1
		break
	
	case desert_1:
	case graveyard_1:
	case farm_1:
	case ufo_1:
		world = 2
		break
	
	case beach_1:
	case forest_1:
	case minigolf_1:
		world = 3
		break
	
	case space_1:
	case city_1:
	case sewer_1:
	case war_1:
		world = 4
		break
	
	case factory_1:
	case freezer_1:
	case mansion_start:
	case kidsparty_entrance1:
		world = 5
		break
}

ini_open_from_string(obj_savesystem.ini_str)
highscore = ini_read_real("Highscore", string(level), 0)
death_highscore = ini_read_real("D_Highscore", string(level), 0)
arena_highscore = ini_read_real("ArenaScore", string(level), 0)

has_treasure = ini_read_real("Treasure", string(level), 0)

rank = ini_read_string("Ranks", string(level), -4)
death_rank = ini_read_string("Death", string(level), -4)
arena_rank = ini_read_string("ArenaRanks", string(level), -4)

best_time = ini_read_real("Time", string(level), 0)
death_time = ini_read_real("D_Time", string(level), 0)
arena_time = ini_read_real("ArenaTime", string(level), 0)
arena_round = ini_read_real("ArenaRound", string(level), 0)


secret_count = ini_read_string("Secret", string(level), 0)
toppin[0] = ini_read_real("Toppin", (string(level) + "1"), 0)
toppin[1] = ini_read_real("Toppin", (string(level) + "2"), 0)
toppin[2] = ini_read_real("Toppin", (string(level) + "3"), 0)
toppin[3] = ini_read_real("Toppin", (string(level) + "4"), 0)
toppin[4] = ini_read_real("Toppin", (string(level) + "5"), 0)
ini_close()
rank_as_num = rank_checker(rank)
arena_as_num = rank_checker(arena_rank)
death_as_num = rank_checker(death_rank)
percent = get_level_pct(string(level))

switch string(level) {
	default: treasure_index = 0 break;	
	case "entrance": treasure_index = 1 break;	
	case "medieval": treasure_index = 2 break;	
	case "ruin": treasure_index = 3 break;	
	case "dungeon": treasure_index = 4 break;	
	case "badland": treasure_index = 5 break;	
	case "graveyard": treasure_index = 6 break;	
	case "farm": treasure_index = 7 break;	
	case "saloon": treasure_index = 8 break;	
	case "plage": treasure_index = 9 break;	
	case "forest": treasure_index = 10 break;	
	case "space": treasure_index = 11 break;	
	case "minigolf": treasure_index = 12 break;	
	case "street": treasure_index = 13 break;	
	case "sewer": treasure_index = 14 break;	
	case "industrial": treasure_index = 15 break;	
	case "freezer": treasure_index = 16 break;	
	case "chateau": treasure_index = 17 break;	
	case "mansion": treasure_index = 18 break;	
	case "kidsparty": treasure_index = 19 break;	
	case "war": treasure_index = 20 break;	

	
}



if !arena && state == states.normal { 
for (var i = 0; i < secret_count; i++)
{
		with instance_create(x, y, obj_gateeye)
		{
			targetGate = other.id
			startX = (targetGate.x - sprite_get_xoffset(targetGate.sprite_index)) - 25
			toX = ((((targetGate.x - sprite_get_xoffset(targetGate.sprite_index)) + sprite_get_xoffset(targetGate.sprite_index)) + sprite_get_xoffset(targetGate.sprite_index)) + 25)
			xSpd = 4 - (i / 2)
			
			startY = targetGate.y - 25
			toY = (targetGate.y - sprite_get_yoffset(targetGate.sprite_index)) - 25
			ySpd = 7 - (i / 2)
		}
		
}

for (var j = 0; j < 5; j++)
{
	if toppin[j]
	{
		with instance_create(irandom_range(x - sprite_get_xoffset(sprite_index), x + sprite_get_xoffset(sprite_index)), y - 46, obj_gatetoppin)
		{
			toppin_id = j 
			gate_id = other.id
			switch toppin_id {
				case 0:
					spr_idle = spr_toppinshroom
					spr_walk = spr_toppinshroom_run
				break;
				case 1:
					spr_idle = spr_toppincheese
					spr_walk = spr_toppincheese_run
				break;
				case 2:
					spr_idle = spr_toppintomato
					spr_walk = spr_toppintomato_run
				break;
				case 3:
					spr_idle = spr_toppinsausage
					spr_walk = spr_toppinsausage_run
				break;
				case 4:
					spr_idle = spr_toppinpineapple
					spr_walk = spr_toppinpineapple_run
				break;
				default:
					spr_idle = spr_toppinshroom
					spr_walk = spr_toppinshroom_run
				break;
			}
		}
	}
}

}