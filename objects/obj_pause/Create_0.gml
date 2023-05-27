function create_option(_name, _selected, _array) { return { title : _name, selected : _selected, suboptions : _array, color : c_gray, saved_time : 0 } }
function create_suboption(_name, _func) {return { title : _name,func : _func } }
function create_optionpage(_name, _x, _y, _options) {return {title : _name,set_x : _x,set_y : _y,selected : 0,options : _options,}	}
scr_input_init()
pausespr = -4
bg_sprite = -4
select_gus = 0
pause = 0
state = states.unpaused
var i = 0
color = make_color_rgb(121, 103, 151)
selected = 0
stickpressed = 0
image_speed = 0
depth = -998
pause_surf = -4
pause_alpha = 0
fadeout = false
queue_cheating = false
txt = ""
txt_y = 0
txt_out = 120
surf_buffer = -4
pause_surf = surface_create(960, 540)
surface_set_target(pause_surf)
draw_clear_alpha(c_black, 0)
surface_reset_target()
real_pause_surf = surface_create(960, 540)
surface_set_target(real_pause_surf)
draw_clear_alpha(c_black, 0)
surface_reset_target()
pause_menu = ["RESUME", "OPTIONS", "RESTART LEVEL", "EXIT LEVEL"]
cursor_index = 0
cursor_sprite_number = sprite_get_number(spr_cursor)
cursor_sprite_height = sprite_get_height(spr_cursor)
peppino_sprite = spr_player_idle
peppino_sprite_number = sprite_get_number(peppino_sprite)
peppino_index = 0
toppin_sprite = [
spr_toppinshroom,
spr_toppincheese,
spr_toppintomato,
spr_toppinsausage,
spr_toppinpineapple,


]
combo_names = [
["INTENDED", "PIZZA MASSACRE", "BEACH AND FOREST"],
["FAN FAVORITE", "JAY LENO'S JOKER", "DEMO 3"],
["BLACK BELT", "POWERHOUSE", "SPEED DEMON"]
]
music_editor = -4
musicID = -4
gain = 0

for (i = 0; i < array_length(toppin_sprite); i++)
{
	toppin_number[i] = sprite_get_number(toppin_sprite[i])
	toppin_index[i] = 0
	toppin_has[i] = 0
}

var pause_options = [ 
create_option("RESUME", 0, function() { fadeout = true }),
create_option("RESTART LEVEL", 0, function() { event_user(0) }),
create_option("OPTIONS", 0, function() { selected_page = 1 }),
create_option("EXIT LEVEL", 0, function() { event_user(1) }),
]

var vid_options = [

create_option("FULLSCREEN", global.option_fullscreen, [
create_suboption("FALSE", function() { save_option(0, "fullscreen") }),
create_suboption("TRUE", function() { save_option(1, "fullscreen") }),
]),

create_option("RESOLUTION", global.option_resolution, [
create_suboption("480 X 270", function() { save_option(0, "resolution") }),
create_suboption("960 X 540", function() { save_option(1, "resolution") }),
create_suboption("1920 X 1080", function() { save_option(2, "resolution") }),
]),

create_option("CONTROLLER RUMBLE", global.option_vibration, [
create_suboption("ON", function() { save_option(1, "vibration") }),
create_suboption("OFF", function() { save_option(0, "vibration") })]),

create_option("ESCAPE TILT", global.option_escapetilt, [
create_suboption("OFF", function() { save_option(0, "tilt") }),
create_suboption("ON", function() { save_option(1, "tilt") }),
]),


create_option("PERFORMANCE MODE", global.option_performance, [
create_suboption("OFF", function() { save_option(0, "performance") }),
create_suboption("ON", function() { save_option(1, "performance") }),
]),
]

// Normal Options Menu
var normal_options = [ 
create_option("GAME OPTIONS", 0, function() { selected_page = 5 }),
create_option("AUDIO OPTIONS", 0, function() { selected_page = 3 }),
create_option("MOD OPTIONS", 0, function() { selected_page = 2 }),
create_option("CHARACTER OPTIONS", 0, function() { selected_page = 4 alarm[3] = 450 pal_text = 0 instance_create(x, y, obj_d3Palette) }),
create_option("CHEATS", 0, function() { selected_page = 6 })
]

// Mod options Menu
var mod_options = [
create_option("ATTACK STYLE", global.attackstyle, [
create_suboption("GRAB", function() { save_option(0, "attackstyle") }),
create_suboption("SHOULDER BASH", function() { save_option(1, "attackstyle") }),
create_suboption("PUMMEL", function() { save_option(2, "attackstyle") }),
]),

create_option("SJUMP STYLE", global.sjumpstyle, [
create_suboption("FINAL", function() { save_option(0, "sjumpstyle") }),
create_suboption("ALPHA", function() { save_option(1, "sjumpstyle") }),
create_suboption("DX", function() { save_option(2, "sjumpstyle") }),
]),

create_option("SIDE ATTACK", global.sidemove, [
create_suboption("KUNG FU", function() { save_option(0, "sidemove") }),
create_suboption("PISTOL & CHAINSAW", function() { 
	save_option(1, "sidemove") 
	txt_out = 180
	txt = "HOLD UP FOR PISTOL"
	
}),
create_suboption("BREAKDANCE", function() { save_option(2, "sidemove") }),
]),



create_option("HEATMETER", global.option_heatmeter, [
create_suboption("OFF", function() { save_option(0, "heatmeter") scr_heatdown() }),
create_suboption("ON", function() { save_option(1, "heatmeter") scr_heatup() }),
]),

/*create_option("MUSIC NOTIFIER", global.option_musicnotifier, [
create_suboption("OFF", function() { save_option(0, "musicnotifier") }),
create_suboption("ON", function() { save_option(1, "musicnotifier") }),
]),
*/
create_option("OLD HUD", global.option_funnyhud, [
create_suboption("OFF", function() { save_option(0, "funnyhud") }),
create_suboption("ON", function() { save_option(1, "funnyhud") }),
]),

create_option("PETER PLUS", global.peterplusmode, [
create_suboption("OFF", function() { save_option(0, "peter") }),
create_suboption("ON", function() { save_option(1, "peter")  txt_out = 180 txt = "SCROLL WHELL TO CHANGE SPRITES" }),
]),

]

var cheats_options = [
create_option("SKIP ROUND", 0, [
create_suboption("BACK", function() { global.arenaphase -= 1 }),
create_suboption("FORWARD", function() { global.arenaphase += 1 }),
]),
create_option("CHAINSAW POGO KILLS RATS", 0, [
create_suboption("OFF", function() { global.cheat_pogoratkill = 0 }),
create_suboption("ON", function() { global.cheat_pogoratkill = 1 }),
]),
create_option("INFINITE AMMO", 0, [
create_suboption("OFF", function() { global.cheat_infammo = 0 }),
create_suboption("ON", function() { global.cheat_infammo = 1 }),
]),
create_option("ADD LAP", 0, function() { global.laps++ global.cheat_disable = true }),
create_option("GOOCH MODE", 0, [
create_suboption("OFF", function() { global.cheat_pizzagooch = false txt_out = 180 txt = "THE PIZZA IS AGRESSIVE" }),
create_suboption("ON", function() { global.cheat_pizzagooch = true txt_out = 180 txt = "THE PIZZA IS DOCILE" }),
]),

create_option("ARENA PERKS", 0, [
create_suboption("RESET", function() { 
	global.arena_perks = {
		staminup : 0,
		impact : 0,
		blaze: 0,
		autoparry : 0,
		time : 0,
		final : 0,
		slam : 0,
		money : 0,
		flight : 0,
		pepper : 0,
	}
	global.perklist = []
	queue_cheating = false
}),
create_suboption("SPEEDY SPAGHETTI", function() { global.arena_perks.staminup = 1 array_push_unique(global.perklist, perks.speed_spaghetti) queue_cheating = 1 }),
create_suboption("FLYING FETTUCCINE", function() { global.arena_perks.impact = 1 array_push_unique(global.perklist, perks.flying_fettuccine) queue_cheating = 1 }),
create_suboption("BLAZE BRUSCHETTA", function() { global.arena_perks.blaze = 1 array_push_unique(global.perklist, perks.blaze_bruschetta) queue_cheating = 1 }),
create_suboption("PARRY PASTA", function() { global.arena_perks.parry = 1 array_push_unique(global.perklist, perks.parry_pasta) queue_cheating = 1 }),
create_suboption("SLAMMER SANGUINE", function() { global.arena_perks.slam = 1 array_push_unique(global.perklist, perks.slammer_sanguine) queue_cheating = 1 }),
create_suboption("POINT PEPPERONI", function() { global.arena_perks.money = 1 array_push_unique(global.perklist, perks.point_power) queue_cheating = 1 }),
create_suboption("FLIGHTY FORMAGGIO", function() { global.arena_perks.flight = 1 array_push_unique(global.perklist, perks.flighty_formaggio) queue_cheating = 1 }),
create_suboption("PIZZA PEPPER", function() { global.arena_perks.pepper = 1 array_push_unique(global.perklist, perks.pizza_pepper) queue_cheating = 1 }),
create_suboption("MASTER CHEF", function() { global.arena_perks.final = 2 array_push_unique(global.perklist, perks.master_class) queue_cheating = 1 }),

]),


]

angel_index = 0
angel_tgtx = 0
angel_tgty = 0
angel_x = 0
angel_y = 0
selected_page = 0
pages = [
create_optionpage("PAUSE", 0, 0, pause_options),
create_optionpage("OPTIONS", 1000, 0, normal_options),
create_optionpage("MOD OPTIONS", 2000, 0, mod_options),
create_optionpage("AUDIO OPTIONS", 1000, 1000, -4),
create_optionpage("CHARACTER OPTIONS", 1000, -1000, -4),
create_optionpage("VIDEO OPTIONS", 2000, -1000, vid_options),
create_optionpage("CHEATS", 2000, 1000, cheats_options)
]

audio_select = 0
audio_levels = [global.option_master_volume * 100, global.option_music_volume * 100, global.option_sfx_volume * 100]


dont_draw = false
queue_fullscreen = 0
lerp_x = 0
lerp_y = 0
real_option_selected = 0


mod_option_selected = 0
sfx_sample = -4
tv_index = 0
selected_char = 0
selected_pal = 1
char_index = 0
char_offset_y = 0
char_offset_x = 0
custom_paletting = false
saved_char = 20
char_options[characters.peppino] = {
	name : "PEPPINO",
	tv_spr : spr_tv_idleanim1,
	idle_spr : spr_player_idle,
	sel_spr : spr_player_taunt,
	pal_spr : spr_peppalette,
	sel_pal : 1,
	pal_details : [
	["CUSTOM : NOT EDITING", "Press up to start editing palettes!"],
	["PEPPINO", "Proud owner of Peppino's Pizza"],
	["SAGE", "In the wrong demo"],
	["RED", "hahah... he mixed the colors in thge wash!"],
	["Green", "Like a bush."],
	["Sea Green", "Like a bush, but underwater."],
	["Macaroon", "Pretty Peppino in Pink"],
	["Purple", "It's ALMOST a grape."],
	["Darkened", "feelin' gloomy today..."],
	["Greener", "You sound so much further on the phone..."],
	["Rocky", "It's a stone Peppino, you didn't make it!"],
	["Discord", "Better than Whatsapp"],
	["Grape", "And thus, another one of His miracles!"],
	["Aqua", "Straight from the Cambrian Period"],
	["Thepartle", "WARNING. May lead to increased roleplay."],
	["Mint", "9 / 10 player approved!"],
	["Moss", "Great flavor"],
	["Networking", "A good businessman does networking from time to time"],
	["Mercenary", "[#78a8f8]PEPPINO[/color] has earned the achievement [#60d048]Runnin'a Thousand[/color]"],
	["Gutter", "A city now?"]
	]
}

char_options[characters.jetpack_noise] = {
	name : "THE NOISE",
	tv_spr : spr_tv_idleanim1N,
	idle_spr : spr_playerN_pogofall,
	sel_spr : spr_playerN_taunt,
	pal_spr : spr_noisepalette,
	sel_pal : 1,
	pal_details : [
	["CUSTOM : NOT EDITING", "Press up to start editing palettes!"],
	["THE NOISE", "Mischevious entity who hates pizza, on his ride of choice!"],
	["Boneless Spaghetti", "Just how I like them!"],
	["Ghastly", "Is it all in your head?"],
	["Naked", "and free."],
	["SAGE", "You've never seen a porcupine before?"],
	["Grunch", "Choose wisely."],
	["The Doise", "Do not steal!"],
	["BO NOISE", "bo unlock the noise On eggplant go on data file change level select add character screen and save"],
	["Discord", "I'm howling at the moon"],
	["Networking", "The cartoon kind!"],
	["Mercenary", "[#78a8f8]THENOISE[/color] has earned the achievement [#60d048]Batter Up[/color]"],
	["Gutter", "Specifically John's"],
	]
}

char_options[characters.noise] = {
	name : "SKATEBOARD NOISE",
	tv_spr : spr_tv_idleanim1N,
	idle_spr : spr_playerN_mach,
	sel_spr : spr_playerN_taunt,
	pal_spr : spr_noisepalette,
	sel_pal : 1,
	pal_details : [
	["CUSTOM : NOT EDITING", "Press up to start editing palettes!"],
	["SKATEBOARD NOISE", "The worse mischevious pizza-hating entity."],
	["Boneless Spaghetti", "Just how I like them!"],
	["Ghastly", "Is it all in your head?"],
	["Naked", "and free."],
	["SAGE", "You've never seen a porcupine before?"],
	["Grunch", "[#0000ff]Have I truly become a monster?[/color]"],
	["The Doise", "Do not steal!"],
	["BO NOISE", "bo unlock the noise On eggplant go on data file change level select add character screen and save"],
	["Discord", "I'm howling at the moon"],
	["Networking", "The cartoon kind!"],
	["Mercenary", "[#78a8f8]THENOISE[/color] has earned the achievement [#60d048]Batter Up[/color]"],
	["Gutter", "Specifically John's"],
	]
}
// note, please only edit the normal noise stuff and just copy it over 2 jetpacks....

char_options[characters.snick] = {
	name : "SNICK",
	tv_spr : spr_pizzy_tv,
	idle_spr : spr_playerS_idle,
	sel_spr : spr_playerS_taunt,
	pal_spr : spr_peppalette,
	sel_pal : 1,
	pal_details : [
	["CUSTOM : NOT EDITING", "Press up to start editing palettes!"],
	["SNICK", "It's him!"],
	]
}

char_options[characters.pizzelle] = {
	name : "PIZZELLE",
	tv_spr : spr_pizzy_tv,
	idle_spr : spr_pizzelle_idle,
	sel_spr : spr_pizzelle_taunt,
	pal_spr : spr_pizzypalette,
	sel_pal : 1,
	pal_details : [
	["CUSTOM : NOT EDITING", "Press up to start editing palettes!"],
	["PIZZELLE", "The glorious candyman"],
	["SUGAR", "You know... iconic green sugar"],
	["FAMILIAR GREMLIN", "Hey... this looks like some guy I know!"],
	["MASSACRE", "Pizzelle but without sunscreen"],
	["RIVALS", "Ironic, considering he didnt get in"],
	["GUM", "Pretty Pizzy Pink"],
	["OLD SCHOOL", "Make it retro"],
	["ZOMBIFIED", "I bless the rains"],
	["FORESTATION", "Pretty sure that scooter gives of carbon emmisions... not good."],
	["LAMDA", "Not to be confused with Lambda, y'know... the symbol."],
	["GOLDEN", "[#E09000]$$$[/color]"],
	["GNOME WIZARD", "More gnome than wizard"],
	["GUTTER", "Hold on a second..."]
	]
}

char_options[characters.gus] = {
	name : "GUSTAVO",
	tv_spr : spr_tv_idleG,
	idle_spr : spr_player_ratmountidle,
	sel_spr : spr_player_ratmounttaunt,
	pal_spr : spr_guspalette,
	sel_pal : 1,
	pal_details : [
	["CUSTOM : NOT EDITING", "Press up to start editing palettes!"],
	["GUSTAVO AND BRICK", "OH YEA!"],
	["Blue", "Feeling a little antsy!"],
	["Red", "With a chance of blues!"],
	["Green", "With a crusty surprise!"],
	["Red Plumber", "The famous of the bunch!"],
	["Green Plumber", "Living in the red's shadow."],
	["Crustavo and Prick", "Fan favourites, now playable!"],
	["Terepy", ">:?"],
	["Discord", "The fastest way to get to your customers!"],
	["Networking", "Saturday morning, always on time!"],
	["Mercenary", "[#78a8f8]BRICK[/color] has accepted [#78a8f8]GUSTAVO[/color]'s [#60d048]Chargin' Targe[/color]"],
	["Familiar Faces", "How would we get these two along otherwise?"],
	["Gutter", "Only for the most fierce of explorers."],
	]
}
/* char_options[characters.bo_noise] = {
	name : "noise",
	tv_spr : spr_tv_idleBN,
	idle_spr : spr_playerBN_idle,
	sel_spr : spr_playerBN_taunt,
	pal_spr : spr_bnpalette,
	sel_pal : 1,
	pal_details : [
	["CUSTOM : NOT EDITING", "Press up to start editing palettes!"],
	["noise", "that was mid"],
	]
} */



pal_text = 0
alarm[3] = 450
custom_pal_text = [
"Change colors by pressing up and down",
"Use the mouse to easily change color values",
"Holding jump allows you to edit colors without the mouse",
"Pressing left and right allows you to change palette slots",
"Press slap to exit and save changes",
"When done, do not forget to select the custom slot!",
]





master_gain = 1
function set_audio_config() //set_audio_config_gml_Object_obj_audioconfig_Create_0
{

	ini_open("saveData.ini")
	ini_write_real("Option", "master_volume", global.option_master_volume)
	ini_write_real("Option", "music_volume", global.option_music_volume)
	ini_write_real("Option", "sfx_volume", global.option_sfx_volume)
	ini_close()
	if audio_is_playing(global.music)
		audio_sound_gain(global.music, (0.6 * global.option_music_volume), 0)
	if audio_is_playing(global.secretmusic)
		audio_sound_gain(global.secretmusic, (0.6 * global.option_music_volume), 0)

	if audio_is_playing(musicID)
		audio_sound_gain(musicID, (0.6 * global.option_music_volume), 0)
	set_master_gain(global.option_master_volume)
	exit;
}

