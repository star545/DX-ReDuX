enum perks {
	ammobox,
	cheeseburger,
	tragedymask,
	feather,
	waterskin,
	
	
	pizza_pepper,
	master_class,
	health_station,
	buyable_shotty,
	
	speed_spaghetti,
	parry_pasta,
	blaze_bruschetta,
	flying_fettuccine,
	point_power,
	slammer_sanguine,
	flighty_formaggio,
	power_pepperoni,
	
	
}
scr_collision_init()
grav = 0.5

final_perk = perks.pizza_pepper

perk_id = 0
state = states.normal
perk[perks.ammobox] = {
cost : 4000,
desc : "+5 percent chance to not expend ammo when firing",
name : "Ammo Box",
func : function() { global.ammobox += 1 },
}

perk[perks.cheeseburger] = {
cost : 4000,
desc : "Makes you go mach 4 faster for each stack",
name : "Cheeseburger",
func : function() { global.cheeseburger += 1 },
}

perk[perks.tragedymask] = {
cost : 4000,
desc : "Makes you get more points from a combo per stack",
name : "Tradgedy Mask",
func : function() { global.tradgedymask += 1 },
}

perk[perks.feather] = {
cost : 4000,
desc : "Makes you jump higher per stack",
name : "Floaty Feather",
func : function() { global.floatyfeather += 1 },
}

perk[perks.waterskin] = {
cost : 4000,
desc : "Arena timer max increased per stack",
name : "Waterskin",
func : function() { global.waterskin += 1 },
}

perk[perks.health_station] = {
cost : 5000,
desc : "Heals you 1 Health",
name : "Health Station",
func : function() { 
	
	with obj_arenamode_controller {
		if player_hp < player_hp_max {
			player_hp++ 
			create_collect(obj_player1.x, obj_player1.y, spr_bosshealth)
		}
		
	}
	
},
}
perk[perks.buyable_shotty] = {
cost : 5000,
desc : "Gain temporary Shotgun",
name : "Pizzamart Branded Shotgun",
func : function() { 
	
	with obj_player1 {
		shotgunAnim = 1
		lose_shotty_on_hit = true
		image_index = 0
		sprite_index = spr_shotgunpullout
		scr_soundeffect(sfx_shotgungot)
		instance_destroy(other)
		shotgunAnim = 1
		state = states.shotgun
		var myKey1 = get_control_string(global.key_shoot)
		scr_controlprompt("[spr_buttonfont]" + myKey1 + "[spr_promptfont] Shoot")
		tv_push_prompt_once(tv_create_prompt("This is the shotgun powerup text", tvprompt.transfo, spr_tv_shotgun, 3), "shotgun")
		global.heattime = 60
		
	}
	
},
}
current_perk = 0
percs = []
removal_amt = 100

// Add all Perks
var _list = ds_list_create()
repeat(perks.waterskin + 1) {
	var _rand_perk = irandom(perks.waterskin)
	var _r = 0
	while ds_list_find_index(_list, _rand_perk) != -1 {
		_rand_perk = irandom(perks.waterskin)
		_r++
		if _r >= 30 break;
	}
	ds_list_add(_list, _rand_perk)	
}
var _size = ds_list_size(_list)
for (var i = 0; i < _size; i++) {
	var cur_list_perk = ds_list_find_value(_list, i)
	array_push(percs, cur_list_perk)
}
ds_list_destroy(_list)

/*
array_push(percs, irandom(perks.power_pepperoni))
var a = 0
while (a == percs[0]) a = irandom(perks.power_pepperoni)
array_push(percs, a)
while (a == percs[0] || a == percs[1]) a = irandom(perks.power_pepperoni)
array_push(percs, a)
*/
trace(percs)
perk_id = perk[percs[current_perk]]
final = 0
flash = 0
show_text = false

if object_index == obj_healthstation perk_id = perk[perks.health_station]
if object_index == obj_gunstation perk_id = perk[perks.buyable_shotty]