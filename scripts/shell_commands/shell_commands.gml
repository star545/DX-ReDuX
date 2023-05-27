




function scr_openconsole() {
	global.shellactivate = true	

}
function scr_closeconsole() {
	global.shellactivate = false	
}

function meta_showcollisions() 
{
	return {
		description: "Toggles solids",
		arguments: ["<bool>"],
		suggestions: [
			["true","false"]
		],
		argumentDescriptions: [
			"toggles visibility"
		]
	}
}
function sh_showhud(args) 
{
	var arg1 = args[1]	
	switch arg1
	{
		case "true": 
		case "1":
		arg1 = true 
		break;
		case "false": 
		case "0":
		arg1 = false 
		break;
		default: 
		arg1 = !global.showhud
		break;		
	}	
	global.showhud = arg1 
	//scr_showcollisions()

}
function meta_removekeypiece() 
{
	return {
		description: "Removes key piece",
		arguments: ["<string>"],
		suggestions: [
			[]
		],
		argumentDescriptions: [
			
		]
	}
}
function sh_removekeypiece(args) 
{
	var arg1 = args[1]	
	if !is_undefined(global.pizzaboy_quest[? string(arg1)]) && global.pizzaboy_quest[? string(arg1)] == true {
		global.pizzaboy_quest[? string(arg1)] = false
		ds_map_delete(global.pizzaboy_quest, string(arg1))	
		ds_map_secure_save(global.pizzaboy_quest, global.pizzaboy_name)
	}
	//global.showhud = arg1 
	//scr_showcollisions()

}
function meta_showhud() 
{
	return {
		description: "Toggles hud",
		arguments: ["<bool>"],
		suggestions: [
			["true","false"]
		],
		argumentDescriptions: [
			"toggles visibility"
		]
	}
}
function sh_petersprite(args) 
{
	var arg1 = args[1]	
	with obj_player1 {
		var arg_as_string = string(arg1)
		var arg_as_index = asset_get_index(arg_as_string)
		if sprite_exists(arg_as_index) drawn_sprite = arg_as_index
		if string_contains(string_lower(arg_as_string), "pizzahead") game_end()
		
		
	}
	//scr_showcollisions()

}
function meta_petersprite() 
{
	return {
		description: "Sets Peter Plus Sprite",
		arguments: ["<string>"],
		suggestions: [
			[]
		],
		argumentDescriptions: [
			"Sprite Name"
		]
	}
}

	


function sh_mortpowerup(args) 
{
	var arg1 = args[1]	
	if args[2] != undefined && args[2] != 0
	switch arg1
	{
		case "pierce": global.mort_powerups.pierce += args[2] break;
		case "rate": global.mort_powerups.fire_rate += args[2] break;
		case "flame": global.mort_powerups.flame += args[2] break;
		case "shotgun": global.mort_powerups.shotgun += args[2] break;
		case "dmg": global.mort_powerups.dmg += args[2] break;
		case "speed": global.mort_powerups.speed += args[2] break;
		case "life": global.mort_powerups.life += args[2] break;

		//case "pierce": global.mort_powerups.pierce += args[2] break;
	}	

}
function meta_mortpowerup() 
{
	return {
		description: "Add Mort Powerup",
		arguments: ["<string>", "<real>"],
		suggestions: [
			["pierce", "shotgun", "flame"]
		],
		argumentDescriptions: [
			"add powerup"
		]
	}
}
/*

*/

function sh_noclip(args) 
{
	if obj_player.state != states.debugstate	
		obj_player.state = states.debugstate
	else
		obj_player.state = states.normal
	
}	
function meta_noclip() {
	return{
		description: "toggle noclip",
		arguments: [],
		suggestions: [
		],
		argumentDescriptions: [
		]
	}	

}	
#region GUSTAVO
function sh_gustavo(args) 
{
	with obj_player1 {
		create_particle(x, y, particle.genericpoofeffect)
		if !isgustavo {
			
		    ratmount_movespeed = 8
		    gustavodash = 0
		    isgustavo = 1
		    state = states.ratmount
		    brick = 1	
		} else {
			gustavodash = 0
	        ratmount_movespeed = 8
	        isgustavo = 0
	        state = states.normal
	        brick = 0	
		}
		
	}
	
}	
function meta_gustavo() {
	return{
		description: "toggle gustavo",
		arguments: [],
		suggestions: [
		],
		argumentDescriptions: [
		]
	}	

}	
#endregion



#region Escape
function sh_escape(args) 
{
	var arg0 = string(args[1])
	var arg1 = args[2], arg2 = args[3]
	
	switch arg0
	{
		case "true": 
		case "1": 
		arg0 = true 
		break;
		case "false": 
		case "0": 
		arg0 = false 
		break;
		default: 
		arg0 = !global.panic
		break;
	}	
	global.panic = arg0 
	var _minutes = real(string_digits(arg1))
	var _seconds = real(string_digits(arg2))
	global.fill = time_in_frames(_minutes, _seconds)
	obj_tv.chunkmax = global.fill
	obj_tv.targetfill = global.fill
//	if global.panicbg = true
//		scr_panicbg_init();		
	//obj_camera.alarm[1] = 60

}
function meta_escape() 
{
	return {
		description: "activates escape and sets escape time",
		arguments: ["<bool>","<min>","<sec>"],
		suggestions: [
			["true","false"],
			[],
			[]
		],
		argumentDescriptions: [
			"activate/deactivate escape",
			"set minutes",
			"set seconds"
		]
	}
}

#endregion




function scr_showcollisions() {
	var arr = [
	"Tiles_BG",
	"Tiles_BG2",
	"Tiles_BG3",
	"Tiles_1",
	"Tiles_2",
	"Tiles_3",
	"Tiles_4",
	"Tiles_Foreground1",
	"Tiles_Foreground2",
	"Tiles_Foreground3",
	]
	var col = [
	obj_solid,
	obj_platform,
	obj_slope,
	obj_sidePlatform,
	obj_slopePlatform,
	obj_grindrail,
	obj_iceblock,
	obj_iceblockslope
	]
	for (var i = 0; i < array_length(arr); i++) {
		if tiles_array[i]
			layer_set_visible(arr[i], showtiles)
	
	}
	for (i = 0; i < array_length(col); i++) {
		with col[i]	
			if object_index = col[i]
				visible = other.showcollisions
	
	}
	
}

function sh_showcollisions(args) 
{
	var arg1 = args[1]	
	switch arg1
	{
		case "true": 
		case "1":
		arg1 = true 
		break;
		case "false": 
		case "0":
		arg1 = false 
		break;
		default: 
		arg1 = !showcollisions
		break;		
	}	
	showcollisions = arg1 
	scr_showcollisions()

}


var i = 0;
while room_exists(i)
{
	global.roomlist[i] = room_get_name(i)
	i++
}	


function sh_room_goto(args) 
{
	var arg1 = asset_get_index(args[1]), arg2 = args[2]	
	//Error Check 
	if asset_get_type(args[1]) != asset_room { return "Can't find room " + string(args[1]); } //Shamelessy took this from Ethgaming
	//Go to Room
	if asset_get_type(args[1]) = asset_room
	{
		obj_player.targetRoom = arg1;
		obj_player.targetDoor = arg2;
		instance_create(0, 0, obj_fadeout);
	}
}
function meta_room_goto() 
{	
	return {
		description: "allows you to go to another room",
		arguments: ["<room>","<door>"],
		suggestions: [
			global.roomlist,
			["N/A","A","B","C","D","E","P","S"]
		],
		argumentDescriptions: [
			"sets targetRoom",
			"sets targetDoor"
		]
	}
}	

function sh_debugsetchar(args) {
	obj_player1.character = args
}

function meta_debugsetchar(args) {
	return {
		description: "sets the player's character in a buggy fashion",
		arguments: ["character"],
		suggestions: [
			""
		],
		argumentDescriptions: [
			"sets player character",
		]
	}
}	



function sh_setstate(args) {
	obj_player1.state = args
}

function meta_setstate(args) {
	return {
		description: "sets the player's state",
		arguments: ["state"],
		suggestions: [
			""
		],
		argumentDescriptions: [
			"sets player state",
		]
	}
}	

function sh_givestat(args) 
{
	var arg1 = args[1]	
	var add = args[2]	
	switch arg1
	{
		case "combo": global.combo += add global.combotime = 60 break;
		case "heat": global.style += add break;
		case "score": global.collect += add break;
		//case "deathtime": with obj_deathmode time += (add * 60) break;

	}	
}
function meta_givestat() 
{
	return {
		description: "Adds...",
		arguments: ["<string>", "<real>"],
		suggestions: [
			["combo","heat", "score", ]
		],
		argumentDescriptions: [
			"Variable to add to",
			"Number to add by",
		]
	}
}
	
function sh_arenaperk(args) 
{
	var arg1 = args[1]	
	
	switch arg1
	{
		case "parry": global.arena_perks.autoparry = !global.arena_perks.autoparry break;
		case "blaze": global.arena_perks.blaze = !global.arena_perks.blaze break;
		case "mach": global.arena_perks.staminup = !global.arena_perks.staminup break;
		case "impact": global.arena_perks.impact = !global.arena_perks.impact break;
		case "time": global.arena_perks.time = !global.arena_perks.time break;
		case "flight": global.arena_perks.flight = !global.arena_perks.flight break;
		case "money": global.arena_perks.money = !global.arena_perks.money break;
		case "slam": global.arena_perks.slam = !global.arena_perks.slam break;
		case "master": 
			if global.arena_perks.final > 0 global.arena_perks.final = 0
			else global.arena_perks.final = 2
		break;
		case "pepper": 
			if global.arena_perks.final > 0 global.arena_perks.final = 0
			else global.arena_perks.final = 1
		break;


		//case "pierce": global.mort_powerups.pierce += args[2] break;
	}	

}
function meta_arenaperk() 
{
	return {
		description: "Add Aren Powerup",
		arguments: ["<string>"],
		suggestions: [
			["parry", "blaze", "mach", "impact", "master", "pepper", "flight", "points", "slam", "time"]
		],
		argumentDescriptions: [
			"add powerup"
		]
	}
}

/*

function sh_showtiles(args) 
{
	var arg1 = args[1]	
	switch arg1
	{
		case "true": 
		case "1":
		arg1 = true 
		break;
		case "false": 
		case "0":
		arg1 = false 
		break;
		default: 
		arg1 = !showtiles
		break;		
	}	
	showtiles = arg1 
	scr_showcollisions()

}
function meta_showtiles() 
{
	return {
		description: "Toggles tiles",
		arguments: ["<bool>"],
		suggestions: [
			["true","false"]
		],
		argumentDescriptions: [
			"toggles visibility"
		]
	}
}


