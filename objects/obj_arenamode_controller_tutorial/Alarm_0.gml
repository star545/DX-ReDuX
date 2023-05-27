/*
ds_list_clear(global.arenaroom)
global.arenaphase++
fake_num = 0
showround = 0
ds_list_shuffle(global.arena_box_list)
with obj_present_arena { active = true killed = false }
alarm[3] = 300
if global.arena_perks.time && global.arenaphase % 3 == 0 with obj_arenamode_controller player_hp++

if global.arenaphase == 5 && room == lightsout_arena with instance_create(obj_player1.x, obj_player1.y, obj_fakepeppino) LAG_STEPS = 75
if global.arenaphase == 10 && room == lightsout_arena with instance_create(obj_player1.x, obj_player1.y, obj_fakepeppino) LAG_STEPS = 150
if global.arenaphase == 15 && room == lightsout_arena with instance_create(obj_player1.x, obj_player1.y, obj_fakepeppino) LAG_STEPS = 225
if global.arenaphase % 10 == 0 {
	global.laps++	
	
}

if global.arenaphase % 5 == 0  {
	if room == strongcold_arena && !instance_exists(obj_fakesanta) with instance_create(1216, 320, obj_fakesanta) activated = 1
	with obj_exitgate { image_index = 1 alarm[0] = 600 }
	
}
