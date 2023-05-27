selected_level = 0
selected_world = 0
active = false
alarm[0] = 30
global.leveltorestart = -4


toppin_info[0] = [0, spr_toppinshroom] // image_index, sprite
toppin_info[1] = [0, spr_toppincheese]
toppin_info[2] = [0, spr_toppintomato]
toppin_info[3] = [0, spr_toppinsausage]
toppin_info[4] = [0, spr_toppinpineapple]

scr_input_init()

var world_num = 0
create_world(world_num, "HUB")
create_level(world_num, "Entrance Hall", tower_entrancehall, "a")
//create_level(world_num, "Crumbling Tower Of Pizza", tower_finalhallway, "exit")
//create_level(world_num, "Smip's Fun House", tower_smipsfunhouse, "e")
// TODO: Hide HUB, WORLD 2, 3, 4 and 5 in the demo 2 release.

create_world(++world_num, "SMIPS ARCADES")
create_level(world_num, "Smip's GOLFMANIA 9000", mania_1, "golfmania")
create_level(world_num, "Smip's BATHROOM SIMULATOR", bath_1, "bath")
create_level(world_num, "Smip's CALZONE ADVENTURE", calzone_1, "calzone")

create_world(++world_num, "WORLD ARENA")
create_level(world_num, "Holiday Cheer", strongcold_arena, "a_strongcold")
create_level(world_num, "Multiball", pinball_arena, "a_pinball")
create_level(world_num, "Hiiyaaaah!!", kungfu_arena, "a_kungfu")
create_level(world_num, "What's So Funny?", clown_arena, "a_clown")
create_level(world_num, "You bring a light?", lightsout_arena, "a_lightsout")
create_level(world_num, "Top", tower_arena, "a_tower")

create_world(++world_num, "WORLD 1")
create_level(world_num, "John Gutter", entrance_1, "entrance")
create_level(world_num, "Pizzascape", medieval_1, "medieval")
create_level(world_num, "Ancient Cheese", ruin_1, "ruin")
create_level(world_num, "Bloodsauce Dungeon", dungeon_1, "dungeon")

create_world(++world_num, "WORLD 2")
create_level(world_num, "Oregano Mirage", badland_1, "badland")
create_level(world_num, "Wasteyard", graveyard_1, "graveyard")
create_level(world_num, "Fun Farm", farm_2, "farm")
create_level(world_num, "Fast Food Saloon", saloon_1, "saloon")

create_world(++world_num, "WORLD 3")
create_level(world_num, "Crust Cove", plage_entrance, "plage")
create_level(world_num, "Gnome Forest", forest_1, "forest")
create_level(world_num, "Deep Dish 9", space_1, "space")
create_level(world_num, "Golf", minigolf_1, "minigolf")

create_world(++world_num, "WORLD 4")
create_level(world_num, "The Pig City", street_intro, "street")
create_level(world_num, "Oh Shit!", sewer_1, "sewer")
create_level(world_num, "PeppiBot Factory", industrial_1, "industrial")
create_level(world_num, "Three Cheese Tundra", freezer_1, "freezer")

create_world(++world_num, "WORLD 5")
create_level(world_num, "Pizzascare", chateau_1, "chateau")
create_level(world_num, "Meat Lover's Mansion", mansion_start, "mansion")
create_level(world_num, "Pizzaboy's Pizz-Pizza", kidsparty_1, "kidsparty")
create_level(world_num, "WAR", war_1, "war")


