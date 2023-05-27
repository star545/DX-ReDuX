ds_list_clear(global.arenaroom)
global.arenaphase++
fake_num = 0
showround = 0
ds_list_shuffle(global.arena_box_list)
with obj_present_arena { active = true killed = false }
alarm[3] = 300
if global.arenaphase % (global.arena_perks.time ? 3 : 8) == 0 with obj_arenamode_controller player_hp++
if global.arenaphase % 2 == 0 && room == pinball_arena && !instance_exists(obj_meatball) with instance_create(obj_pinballspawner.x, obj_pinballspawner.y, obj_meatball) {
	image_xscale = choose(-1, 1)
	movespeed = irandom_range(2, 12)
	hsp = image_xscale * movespeed
		
	
}
if global.arenaphase == 5 && room == lightsout_arena with instance_create(obj_player1.x, obj_player1.y, obj_fakepeppino) LAG_STEPS = 75
if global.arenaphase == 10 && room == lightsout_arena with instance_create(obj_player1.x, obj_player1.y, obj_fakepeppino) LAG_STEPS = 150
if global.arenaphase == 15 && room == lightsout_arena with instance_create(obj_player1.x, obj_player1.y, obj_fakepeppino) LAG_STEPS = 225
if global.arenaphase % 10 == 0 {
	global.laps++
	if room == strongcold_arena global.strongcoldprogress = 1
	if room == pinball_arena global.pinballprogress = 1
	if room == clown_arena global.clownprogress = 1
	if room == lightsout_arena global.lightsoutprogress = 1
	if room == kungfu_arena global.kungfuprogress = 1
	if room == tower_arena global.towerarenaprogress = 1
	instance_create(x, y, obj_flash)
}

if global.arenaphase % 5 == 0  {
	if room == strongcold_arena && !instance_exists(obj_fakesanta) with instance_create(1216, 320, obj_fakesanta) activated = 1
	with obj_exitgate { image_index = 1 alarm[0] = 1600 }
	
}
