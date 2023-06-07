if (instance_number(object_index) > 1)
{
	instance_destroy()
	exit;
}
pizzacoindelay = 0


dead_timer = 0
konami = "";
global.has_towersecret6_key = 0
konamiend = "UUDDLRLRBA";
state_delay = 0
lose_shotty_on_hit = 0
input_buffer_jump2 = 0
super_mario = false
mariojump = 0
grabclimbbuffer = 0
global.perklist = []
bo_noise = 0
hammer_vault = 0
//global.seen_champ_cutscene = false
red_stew = 0
local_grab_list = ds_list_create()
thrown_enem = false
backto = 0
shot = 0
can_auto_parry = 0
jetpackin = 0
stateName = ""
substate = 0
global.debugmode = 0
custom_pep_surf = -4
global.showhud = 1
mort_speed = 3
sjump_time = 0
mort_delay = 3
mortGun = false;

secret_array = ["none"]

custom_palette = false
custom_update = true
custom_slot = 0
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

global.arena_scroll = 0
paletteselectGus = 1
lungebaddieID = -4
scr_collision_init()
global.throwarc = 1
global.hidetiles = 0
global.leveltosave = -4
global.leveltorestart = -4
global.peterplusmode = false
global.exitlevel = 0
drawn_sprite = 0
ghost_pepper = 0
dir_h = 0
dir_v = 0
jetpackdash = 0
flamecloud_buffer = 0
rankpos_x = x
rankpos_y = y
transformationlives = 0
punch_afterimage = 0
superchargecombo_buffer = -1
superattackstate = states.normal
afterimagedebris_buffer = 0
scale_xs = 1
scale_ys = 1
verticalbuffer = 0
verticalstate = states.normal
webID = -4
float = 0
boxxedpepjump = 10
boxxedpepjumpmax = 10
icemovespeed = 0
prevmove = 0
prevhsp = 0
prevstate = states.normal
prevxscale = 1
prevsprite = sprite_index
move = 0
prevmovespeed = 0
previcemovespeed = 0
icedir = 1
icemomentum = 0
savedicedir = 1
ispeppino = 1
isgustavo = 0
jumped = 1
grav = 0.5
hsp = 0
vsp = 0
vsp_carry = 0
hsp_carry = 0
rocketvsp = 0
sticking = 0
platformid = -4
xscale = 1
yscale = 1
facehurt = 0
steppy = 0
depth = -7
movespeed = 19
jumpstop = 0
ramp = 0
ramp_points = 0
bombup_dir = 1
knightmomentum = 0
grabbingenemy = 0
blur_effect = 0
firemouth_dir = 1
firemouth_max = 10
firemouth_buffer = firemouth_max
firemouth_afterimage = 0
cow_buffer = 0
balloonbuffer = 0
shoot_buffer = 0
shoot_max = 20
dynamite_inst = -4
golfid = -4
bombgrabID = -4
barrelslope = 0
barrel_maxmovespeed = 16
barrel_maxfootspeed = 10
barrel_rollspeed_threshold = 10
barrel_accel = 1
barrel_deccel = 1
barrel_slopeaccel = 0.25
barrel_slopedeccel = 0.5
barrelroll_slopeaccel = 0.5
barrelroll_slopedeccel = 0.35
hurt_buffer = -1
hurt_max = 120
invhurt_buffer = 0
invhurt_max = 30
ratmount_movespeed = 8
ratmount_fallingspeed = 0
ratgrabbedID = -4
ratpowerup = -4
ratshootbuffer = 0
rateaten = 0
gustavodash = 0
brick = 0
ratmountpunchtimer = 25
gustavokicktimer = 5
cheesepep_buffer = 0
cheesepep_max = 10
pepperman_accel = 0.25
pepperman_deccel = 0.5
pepperman_accel_air = 0.15
pepperman_deccel_air = 0.25
pepperman_maxhsp_normal = 6
pepperman_jumpspeed = 11
pepperman_grabID = -4
shoulderbash_mspeed_start = 12
shoulderbash_mspeed_loop = 10
shoulderbash_jumpspeed = 11
visible = true
state = states.titlescreen
jumpAnim = 1
landAnim = 0
machslideAnim = 0
moveAnim = 1
stopAnim = 1
crouchslideAnim = 1
crouchAnim = 1
machhitAnim = 0
stompAnim = 0
inv_frames = 0
hurted = 0
autodash = 0
mach2 = 0
stop_buffer = 8
slope_buffer = 8
stop_max = 16
parry = 0
parry_inst = -4
taunt_to_parry_max = 10
parry_count = 0
parry_max = 8
is_firing = 0
input_buffer_jump = 8
input_buffer_secondjump = 8
input_buffer_highjump = 8
input_buffer_walljump = 0
input_buffer_slap = 8
input_attack_buffer = 0
input_finisher_buffer = 0
input_up_buffer = 0
input_down_buffer = 0
hit_connected = 0
player_x = x
player_y = y
targetRoom = sewer_5
targetDoor = "A"
flash = 0
key_particles = 0
barrel = 0
bounce = 0
a = 0
idle = 0
attacking = 0
slamming = 0
superslam = 0
grounded = true
grinding = 0
machpunchAnim = 0
punch = 0
machfreefall = 0
shoot = 0
instakillmove = 0
stunmove = 0
windingAnim = 0
facestompAnim = 0
ladderbuffer = 0
toomuchalarm1 = 0
toomuchalarm2 = 0
idleanim = 0
momemtum = 0
cutscene = 0
grabbing = 0
dir = xscale
shotgunAnim = 0
goingdownslope = 0
goingupslope = 0
fallinganimation = 0
bombpeptimer = 100
suplexmove = 0
suplexhavetomash = 0
anger = 0
angry = 0
baddiegrabbedID = 0
extra_baddiegrabbedID = ds_list_create()
spr_palette = spr_peppalette
character = characters.peppino
scr_characterspr()
paletteselect = 1
colorchange = 0
treasure_x = 0
treasure_y = 0
treasure_room = 0
wallspeed = 0
tauntstoredstate = states.normal
tauntstoredmovespeed = 6
tauntstoredsprite = spr_player_idle
taunttimer = 20
tauntstoredvsp = 0
tauntstoredisgustavo = 0
tube_id = -1
backtohubstartx = x
backtohubstarty = y
backtohubroom = Realtitlescreen
slapcharge = 0
slaphand = 1
slapbuffer = 8
slapflash = 0
freefallsmash = 0
costumercutscenetimer = 0
heavy = 0
lastroom_x = 0
lastroom_y = 0
lastroom = 0
lastTargetoor = "A"
hallway = 0
savedhallway = 0
hallwaydirection = 0
savedhallwaydirection = 0
vhallwaydirection = 0
savedvhallwaydirection = 0
verticalhallway = 0
savedverticalhallway = 0
vertical_x = x
verticalhall_vsp = 0
box = 0
roomstartx = 0
roomstarty = 0
swingdingbuffer = 0
swingdingdash = 0
lastmove = 0
backupweapon = 0
stickpressed = 0
spotlight = 1
macheffect = 0
chargeeffectid = obj_null
dashcloudid = obj_null
crazyruneffectid = obj_null
fightball = 0
superslameffectid = obj_null
speedlineseffectid = obj_null
angryeffectid = obj_null
thrown = false
mach1snd = -1
mach2snd = -1
mach3snd = -1
knightslide = -1
bombpep1snd = -1
mach4snd = -1
tumble2snd = -1
tumble1snd = -1
tumble3snd = -1
rocketsnd = -1
flipsnd = -1
superjumpholdsnd = -1
superjumpprepsnd = -1
suplexdashsnd = -1
cheeseballsnd = -1
ghostsnd = -1
barrelsnd = -1
trashrollsnd = -1
currentsnd = -1
pogospeed = 2
pogocharge = 100
pogochargeactive = 0
wallclingcooldown = 10
bombcharge = 0
flashflicker = 0
flashflickertime = 0
kickbomb = 0
doublejump = 0
pogospeedprev = 0
fightballadvantage = 0
coopdelay = 0
supercharged = 0
superchargedeffectid = obj_null
used_supercharge = 0
pizzashield = 0
pizzashieldid = obj_null
pizzapepper = 0
transformation = [
states.bombpep,
states.knightpep,
states.knightpepslopes,
states.knightpepattack,
states.knightpepbump,
states.boxxedpep,
states.cheeseball,
states.cheesepep,
states.cheesepepstick,
states.cheesepepstickup,
states.cheesepepstickside,
states.firemouth,
states.fireass,
states.stunned,
states.rideweenie,
states.gameover,
states.door,
states.ghost,
states.ghostpossess,
states.mort,
states.tube,
states.actor,
states.rocket,
states.gotoplayer,
states.bombgrab,
states.bombpepside,
states.bombpepup,
states.barrelslide,
states.barreljump,
states.barrel,
states.cheeseballclimbwall,
states.motorcycle,
states.knightpepbump,
states.knightpepattack,
states.mortattack,
states.morthook,
states.mortjump,
states.boxxedpepjump,
states.boxxedpepspin,
states.rocketslide,
states.flick,
states.victory,
states.cotton,
states.spindash,
states.hangin
]
c = 0
stallblock = 0
breakdance = 50
skateboarding = 0
hitX = x
hitY = y
hithsp = 0
hitvsp = 0
hitstunned = 0
hitxscale = 1
stunned = 0
hitLag = 25
supercharge = 0
mort = 0
sjumpvsp = -12
freefallvsp = 15
hitlist = ds_list_create()
animlist = ds_list_create()
lungeattackID = -4
lunge_hits = 0
lunge_hit_buffer = 0
lunge_buffer = 0
finisher = 0
finisher_buffer = 0
finisher_hits = 0
uplaunch = 0
downlaunch = 0
dash_doubletap = 0
finishingblow = 0
launch = 0
launched = 1
launch_buffer = 0
jetpackfuel = 0
jetpackmax = 200
walljumpbuffer = 0
farmerpos = 0
clowntimer = 0
knightmiddairstop = 0
knightmove = -1
if (!variable_global_exists("saveroom"))
{
	global.pizzaboy_name = "findme.sav"
	if file_exists(global.pizzaboy_name) global.pizzaboy_quest = ds_map_secure_load(global.pizzaboy_name)
	else global.pizzaboy_quest = ds_map_create()
	var window_names = [
		"With even frenzier worlds!",
		"With even friendlier worlds!",
		"Demo 3D",
		"They've trapped me in the window title, please help!",
		"FEATURING: Snotty!",
		"Frenzy Loco Scoutdemo 3 Plus Reborn Overcooked Special Delivery Online Worlds +",
		"Stop looking up here!",
		"Also try Demo 3!",
		"Also try Frenzy Worlds!",
		"Also try Loco Tower!",
		"Also try Sugary Spire!",
		"Also try PT Plus!",
		"Also try PT Preview!      ...wait.",
		"Mach 5 Exists",
		"The fourth boss is...",
		"Me on top of the tower:",
		"No more wallrunning",
		"Scalp Edition",
		"Bye Bye There",
		"Scoutdigo DX: Scoutdigo DX:",
		"You'll never get my secret treasure!",
		"You'll grow tired of me, cause",
		"If I gave you the moon",
		"What do you think YOU'RE looking at pal?",
		"Calculator Head",
		"Who could this be?",
		"There are no secret hub rooms",
		"sfx_toppinhelp1",
		"Gravestone Missouri",
		"I just can't wait to collect all this glorious candy!",
		"Don't go to the last Peter Plus sprite",
		"Open me for a surprise!",
		"My 10 minute rant on why the Pepperoni Goblin SUCKS!!!",
		"There is no \"Meat Street\"",
		"The worlds greatest league of Recreators.",
		"where are you",
		"find him",
		"another day in paradise",
		"the key the key"
		
		
		
	
	
	]
	randomize()
	randomize()
	randomize()
	randomize()

	var total_names = array_length(window_names) - 1
	var random_name = irandom_range(0, total_names)
	var random_rare = irandom_range(0, 100)
	global.window_title = (random_rare == 0 ? "Scoutdingo XD: " : "Scoutdigo DX: ") + string(window_names[random_name])
	window_set_caption(global.window_title)
	global.mario_mach = irandom_range(0, 20) == 0
	
	global.arena_box_list = ds_list_create()
	global.arenaroom = ds_list_create()
	global.arenaphase = 1
	global.arenaintensity = 0
	global.shellactivate = 0
	global.combodropped = 0
	global.exit_cutscene = 0
	global.mort_powerups = {
		pierce : 0,
		fire_rate : 1,
		dmg : 1,
		speed : 1,
		life : 1,
		flame : 0,
		grenade : 0,
		shotgun : 0,
		laser : 0,
	}
	global.saveroom = ds_list_create()
	global.escaperoom = ds_list_create()
	global.lap = 0
	global.pizzashieldbuffer = 0
	global.dialogmsg = -4
	global.dialogchoices = -4
	global.choiced = -4
	global.laps = 0
	global.ammobox = 0
	global.cheeseburger = 0
	global.tradgedymask = 0
	global.floatyfeather = 0
	global.waterskin = 0
	global.strongcoldprogress = 0
	global.pinballprogress = 0
	global.clownprogress = 0
	global.lightsoutprogress = 0
	global.kungfuprogress = 0
	global.towerarenaprogress = 0
	global.playerhealth = 100
	global.instancelist = ds_list_create()
	global.followerlist = ds_list_create()
	global.maxrailspeed = 2
	global.railspeed = global.maxrailspeed
	global.levelreset = 0
	global.temperature = 0
	global.temperature_spd = 0.01
	global.temp_thresholdnumber = 5
	global.use_temperature = 0
	global.timedgatetimer = 0
	global.timedgatetime = 0
	global.key_inv = 0
	global.musicstr = ""
	global.shroomfollow = 0
	global.cheesefollow = 0
	global.tomatofollow = 0
	global.sausagefollow = 0
	global.pineapplefollow = 0
	global.pepanimatronic = 0
	global.keyget = 0
	global.collect = 0
	global.collectN = 0
	global.treasure = 0
	global.combo = 0
	global.previouscombo = 0
	global.combotime = 0
	global.comboscore = 0
	global.savedcomboscore = 0
	global.savedcombo = 0
	global.heattime = 0
	global.toppintotal = 1
	global.hit = 0
	global.baddieroom = ds_list_create()
	global.hp = 2
	global.gotshotgun = 0
	global.showgnomelist = 1
	global.panic = false
	global.snickchallenge = 0
	global.golfhit = 0
	ini_open("saveData.ini")
	
	global.option_fullscreen = ini_read_real("Option", "fullscreen", 0)
	global.option_funnyhud = ini_read_real("Option", "funnyhud", 0)
	global.option_resolution = ini_read_real("Option", "resolution", 1)
	global.option_master_volume = ini_read_real("Option", "master_volume", 1)
	global.option_music_volume = ini_read_real("Option", "music_volume", 1)
	global.option_sfx_volume = ini_read_real("Option", "sfx_volume", 1)
	global.option_vibration = ini_read_real("Option", "vibration", 1)
	global.option_heatmeter = ini_read_real("Option", "heatmeter", 0)
	global.option_musicnotifier = 0
	
	global.attackstyle = ini_read_real("Option", "attackstyle", 0)
	global.sjumpstyle = ini_read_real("Option", "sjumpstyle", 0)
	global.sidemove = ini_read_real("Option", "sidemove", 0)
	global.option_performance = ini_read_real("Option", "performance", 0)
	global.option_doubleenem = 0//ini_read_real("Option", "double", 0)
	global.cheat_pizzagooch = 0
	global.cheat_infammo = 0
	global.cheat_pogoratkill = 0
	global.cheat_arenaperk = 0
	global.hardmode = 0//ini_read_real("Option", "hardmode", 0)
	global.option_escapetilt = ini_read_real("Option", "tilt", 1)
	global.heatmeter_threshold = 0
	global.heatmeter_count = 0
	global.heatmeter_threshold_max = 3
	global.heatmeter_threshold_count = 2

	
	
	
	ini_close()
	

	
	window_set_fullscreen(global.option_fullscreen)

	var _os_r = global.option_resolution
	if (_os_r == 0)
	{
		var resolutionX = 480
		var resolutionY = 270
	}
	else if (_os_r == 1)
	{
		resolutionX = 960
		resolutionY = 540
	}
	else
	{
		resolutionX = 1920
		resolutionY = 1080
	}
	window_set_size(resolutionX, resolutionY)
	set_master_gain(global.option_master_volume)
	global.style = -1
	global.secretfound = 0
	global.shotgunammo = 0
	global.monsterspeed = 0
	global.monsterlives = 3
	global.giantkey = 0
	global.coop = false
	global.baddiespeed = 1
	global.baddiepowerup = 0
	global.baddierage = 0
	global.style = 0
	global.stylethreshold = 0
	global.pizzadelivery = 0
	global.failcutscene = 0
	global.pizzasdelivered = 0
	global.spaceblockswitch = 1
	global.gerome = 0
	global.bullet = 5
	global.fuel = 5
	global.bigfont = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:%", 1, 0)
	global.collectfont = font_add_sprite_ext(spr_font_collect, "0123456789", 1, 0)
	global.collectfont_sugary = font_add_sprite_ext(spr_ss_collectfont, "0123456789", 1, 0)
	global.combofont = font_add_sprite_ext(spr_font_combo, "0123456789/:", 1, 0)
	global.combofont2 = font_add_sprite_ext(spr_tv_combobubbletext, "0123456789", 1, 0)
	global.smallfont = font_add_sprite_ext(spr_smallerfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.:?1234567890", 1, 0)
	global.wartimerfont1 = font_add_sprite_ext(spr_wartimer_font1, "1234567890", 1, 0)
	global.wartimerfont2 = font_add_sprite_ext(spr_wartimer_font2, "1234567890", 1, 0)
	global.buttonfont = font_add_sprite_ext(spr_buttonfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ&()*$%", 1, 1) //last 6 chars: shift, space, up, right, down, left
	global.promptfont = font_add_sprite_ext(spr_promptfont, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ,.!?:;/-'|1234567890", 1, 1)
	global.ammorefill = 0
	global.ammoalt = 1
	global.mort = 0
	global.stylelock = 0
	
	global.pummeltest = 1
	global.horse = 0
	global.checkpoint_room = -4
	global.checkpoint_door = "A"
	global.kungfu = 0
	global.graffiticount = 0
	global.graffitimax = 20
	global.noisejetpack = 0
	global.hasfarmer = array_create(3, 0)
	global.savedattackstyle = -4
	global.ghostkiller = false
	
}
angle = 0
mach4mode = 0
railmomentum = 0
railmovespeed = 0
savedmvsp = 0
raildir = 1
boxxed = 0
boxxeddash = 0
cheesepeptimer = -1
cheeseballbounce = 0
slopejump = 0
slopejumpx = 0
hooked = 0
swingdingendcooldown = 0

crouchslipbuffer = 0
breakdance_speed = 0.25
notecreate = 50
jetpackbounce = 0
laddervsp = 10
storedvsp = 0
terminalVelocity = 20
oldComboTitle = 0
combo_title = -4
audio_listener_orientation(0, -1, 0, 0, 0, -1)