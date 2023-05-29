prevhsp = hsp
prevmove = move
prevmovespeed = movespeed
previcemovespeed = icemovespeed
prevxscale = xscale
scr_player_state()

var a = instance_place(x, y, obj_secret_tiles)
secret_array = a != -4 ? a.tiles : ["-4"]

if object_index == obj_player1
{
	switch keyboard_lastkey
	{
		case vk_up:
			konami += "U";
			break;
		case vk_down:
			konami += "D";
			break;
		case vk_left:
			konami += "L";
			break;
		case vk_right:
			konami += "R";
			break;
		case ord("A"):
			konami += "A";
			break;
		case ord("B"):
			konami += "B";
			break;
	}
	if konami != "" && string_copy(konamiend, 1, string_length(konami)) != konami
		konami = "";
		
	if konami == konamiend
	{
		scr_soundeffect(sfx_taunt);
		super_mario = !super_mario
		if !super_mario state = states.normal
		if place_meeting_collision(x, y) while place_meeting_collision(x, y) y--
		
		
		
		keyboard_clear(keyboard_lastkey);
		konami = "";
	}
	keyboard_lastkey = -1;
}



if (prevstate != state)
{
	if (prevstate == states.trashroll && prevsprite != spr_player_corpsestart && prevsprite != spr_player_corpsesurf)
		create_debris(x, y, spr_player_trashlid)
}
if (!(place_meeting(x, (y + 1), obj_railparent)))
{
	if state == states.shotgunshoot 
		railmovespeed = Approach(railmovespeed, 0, 0.3)
	else if (state == states.mach3 or state == states.mach2 or state == states.tumble)
		railmovespeed = Approach(railmovespeed, 0, 0.1)
	else
		railmovespeed = Approach(railmovespeed, 0, 0.5)
}
if (state != states.handstandjump && state != states.tumble)
	crouchslipbuffer = 0
if (state != states.mach3 && state != states.chainsaw) {
	mach4mode = 0
	jetpackin = false	
}
if (ratshootbuffer > 0)
	ratshootbuffer--
if state != states.chainsawpogo && state != states.chainsaw hammer_vault = 0
	
if (state != states.animatronic)
{
	animatronic_buffer = 360
	animatronic_collect_buffer = 0
}
if (state == states.boxxedpep && grounded && vsp > 0)
	boxxedpepjump = boxxedpepjumpmax
if (verticalbuffer > 0)
	verticalbuffer--
if (superchargecombo_buffer > 0)
	superchargecombo_buffer--
if (red_stew > 0)
	red_stew--
if (superchargecombo_buffer == 0)
{
	superchargecombo_buffer = -1
	//global.combotime = 4
}
if (state != states.normal)
	breakdance_speed = 0.25
if ((!grounded) && (state == states.trickjump or state == states.jump or state == states.mach1 or state == states.mach2 or state == states.mach3) && key_jump && global.noisejetpack == 1)
{
	vsp = -14
	movespeed = hsp
	state = states.jetpackjump
	sprite_index = spr_player_jetpackstart
	doublejump = 0
	with (instance_create(x, y, obj_highjumpcloud2))
		sprite_index = spr_player_firemouthjumpdust
	scr_soundeffect(sfx_woosh)
	scr_soundeffect(sfx_jetpackjump)
}
if ((!grounded) && (state == states.trickjump or state == states.jump or state == states.mach1 or state == states.mach2 or state == states.mach3) && key_jump && mortGun)
{
	scr_soundeffect(sfx_jump)
	jumpstop = 0
	input_buffer_jump = 8
	doublejump = 1
	state = states.mortjump
	hsp = xscale * movespeed
	sprite_index = spr_player_mortdoublejump
	image_index = 0
	vsp = -11
	repeat (4)
		create_debris(x, y, spr_feather)
}
if (walljumpbuffer > 0)
	walljumpbuffer--
if (grounded && vsp > 0 && state != states.noisejetpack)
	jetpackfuel = jetpackmax
if tauntstoredisgustavo
{
	isgustavo = 1
	if (state != states.backbreaker && state != states.parry && state != states.graffiti)
		tauntstoredisgustavo = 0
}
if !isgustavo ratmount_movespeed = 8
var noise_c = ((state != states.pogo && state != states.Sjump && state != states.Sjumpprep && state != states.normal && state != states.jump) && if_char(characters.jetpack_noise)) || !if_char(characters.jetpack_noise)
if (state != states.mach3 && noise_c && (state != states.machslide or sprite_index != spr_mach3boost))
{
	launch = 0
	launched = 0
	launch_buffer = 0
}
if (launch_buffer > 0)
	launch_buffer--
else
	launched = 0
if (state != states.finishingblow) {
	thrown_enem = false
	finishingblow = 0
	backto = 0	
}
if (dash_doubletap > 0)
	dash_doubletap--
if (cow_buffer > 0)
	cow_buffer--
if (state == states.lungeattack)
	lunge_buffer = 14
if (blur_effect > 0)
	blur_effect--
else if (breakdance_speed >= 0.6 or mach4mode == 1 or boxxeddash == 1 or state == states.ghost or state == states.tumble or state == states.ratmountbounce or state == states.ratmountattack or state == states.handstandjump or state == states.barrelslide or (state == states.grab && sprite_index == spr_swingding && swingdingdash <= 0) or (state == states.punch && (sprite_index == spr_player_breakdanceuppercut or sprite_index == spr_player_breakdanceuppercutend)) or state == states.freefall or state == states.lungeattack)
{
	if (visible && (!(place_meeting(x, y, obj_secretportal))) && (!(place_meeting(x, y, obj_secretportalstart))))
	{
		blur_effect = 2

		with (create_blur_afterimage(x, y, sprite_index, (image_index - 1), xscale))
			playerid = other.id
		
	}
}
if (state != states.chainsaw && state != states.bump && state != states.boxxedpep && state != states.boxxedpepspin && state != states.boxxedpepjump)
{
	boxxed = 0
	boxxeddash = 0
}
if (state != states.grab)
	grabbingenemy = 0
if (state != states.mach2 && state != states.mach3 && state != states.trickjump && state != states.ratmounttumble && state != states.ratmounttrickjump)
{
	ramp = 0
	ramp_points = 0
}
if (state != states.door && state != states.chainsaw && state != states.hit && place_meeting(x, y, obj_boxofpizza))
	state = states.crouch
if (shoot_buffer > 0)
	shoot_buffer--
if (cheesepep_buffer > 0)
	cheesepep_buffer--
if (state != states.cheesepepstickside)
	yscale = 1
if (invhurt_buffer > 0)
	invhurt_buffer--
if (state == states.hurt)
{
	if (hurt_buffer > 0)
		hurt_buffer--
	else
	{
		invhurt_buffer = invhurt_max
		hurt_buffer = -1
	}
}
else
{
	if (hurt_buffer > 0)
		invhurt_buffer = invhurt_max
	hurt_buffer = -1
}
if state != states.jetpackjump && state != states.chainsaw {
	jetpackdash = 0
	jetpackbounce = 0
}

if (room == hub_hall || room == Realtitlescreen || room = credits) && state != states.titlescreen && !instance_exists(obj_fadeout) {
	state = states.titlescreen
	x = -100
	y = -100
}
if state != states.chainsaw && state != states.climbwall grabclimbbuffer = 0

if (wallclingcooldown < 10)
	wallclingcooldown++
if ((!instance_exists(superchargedeffectid)) && supercharged)
{
	with (instance_create(x, y, obj_superchargeeffect))
	{
		playerid = other.id
		other.superchargedeffectid = id
	}
}
if (state != states.Sjump && state != states.Sjumpprep) nerfed_sjump = 0
if (state != states.Sjump) {
	sjumpvsp = -12
	sjump_time = 0	
}
	
if (state != states.freefall)
	freefallvsp = 20
if (supercharge > 9 && state != states.backbreaker)
	supercharged = 1
if ((!instance_exists(pizzashieldid)) && pizzashield >= 1)
{
	with (instance_create(x, y, obj_pizzashield))
	{
		playerid = other.object_index
		other.pizzashieldid = id
	}
}
if (visible == false && state == states.comingoutdoor)
{
	coopdelay++
	image_index = 0
	if (coopdelay == 50)
	{
		visible = true
		coopdelay = 0
	}
}
if (global.coop == true)
{
	if ((state == states.punch or state == states.handstandjump) && (!((obj_player2.state == states.punch or obj_player2.state == states.handstandjump))))
		fightballadvantage = 1
	else if (!((obj_player2.state == states.punch or obj_player2.state == states.handstandjump)))
		fightballadvantage = 0
}
if (state != states.pogo && state != states.backbreaker)
{
	pogospeed = 6
	pogospeedprev = 0
}
scr_playersounds()
if grounded
	doublejump = 0
if (pogochargeactive == 1)
{
	if (flashflicker == 0)
	{
		if (pogochargeactive == 1 && sprite_index == spr_playerN_pogofall)
			sprite_index = spr_playerN_pogofallmach
		if (pogochargeactive == 1 && sprite_index == spr_playerN_pogobounce)
			sprite_index = spr_playerN_pogobouncemach
	}
	flashflicker = 1
	pogocharge--
}
else if global.ghostkiller
	flashflicker = 1
else
	flashflicker = 0
if (state != states.throwing)
	kickbomb = 0
if (pogocharge == 0)
{
	pogochargeactive = 0
	pogocharge = 100
}
if (flashflicker == 1)
{
	flashflickertime++
	if (flashflickertime == 20)
	{
		flash = 1
		flashflickertime = 0
	}
}
if (state != states.mach3 && state != states.grabbed)
	fightball = 0
if (state != states.grabbed && state != states.hurt && state != states.punch && grounded)
	suplexmove = 0
if mort_delay > 0 
	mort_delay--
if state != states.freefall && state != states.ratmountgroundpound && ((state != states.chainsaw && state != states.backbreaker) || (tauntstoredstate != states.freefall && tauntstoredstate != states.ratmountgroundpound))
freefallsmash = -14


if (global.playerhealth <= 0 && state != states.gameover)
{
	image_index = 0
	sprite_index = spr_playerV_dead
	state = states.gameover
}
if (object_index == obj_player1 && state == states.gameover && y > (room_height * 2))
{
	//targetDoor = "A"
	scr_playerreset()
	var rm = Realtitlescreen
	if !(room == Realtitlescreen || room == rm_levelselect)
		rm = rm_levelselect
	if obj_player1.backtohubroom != -4
		rm = obj_player1.backtohubroom
	global.exitlevel = 1
	global.levelreset = 1
	targetDoor = "A"
	if room_exists(rm)
		scr_room_goto(rm)
	else {
		scr_room_goto(tower_1)
			
	}
	obj_player1.state = states.actor
	instance_create(x, y, obj_fakeFade)
}
/*
if (baddiegrabbedID == obj_null && (state == states.grab or state == states.superslam or state == states.tacklecharge))
	state = states.normal
if (!((state == states.grab or state == states.superslam or state == states.mach2)))
{
	baddiegrabbedID = obj_null
	heavy = 0
}
*/

var size = ds_list_size(local_grab_list)
for (var i = 0; i < size; i++) {
	var entry = ds_list_find_value(local_grab_list, i)
	if !instance_exists(entry) ds_list_delete(local_grab_list, i)
	
}

if (cutscene == 1 && state != states.gotoplayer)
	global.heattime = 60
if (anger == 0)
	angry = 0
if (anger > 0)
{
	angry = 1
	anger -= 1
}
if (sprite_index == spr_winding && state != states.normal)
	windingAnim = 0
if (state != states.grab)
	swingdingbuffer = 0
var noise_check = state == states.mach3 && if_char(characters.jetpack_noise)

if (state == states.antigrav or state == states.rocket or state == states.rocketslide || noise_check)
	grav = 0
else if (state == states.barrel)
	grav = 0.6
else if (state == states.ghost or state == states.ghostpossess)
	grav = 0
else if (boxxed && state != states.boxxedpepspin)
	grav = 0.3
else if (state == states.jetpackjump)
	grav = 0.5
else if (state == states.boxxedpepspin)
	grav = 0.6
else
	grav = 0.5
if (state == states.barrel && key_jump2 && (!jumpstop))
	grav = 0.4
if (state = states.mariowalk || state = states.marioslide) grav = 0	
	
if (sprite_index == spr_player_idlevomit && image_index > 28 && image_index < 43)
	instance_create((x + random_range(-5, 5)), (y + 46), obj_vomit)
if (sprite_index == spr_player_idlevomitblood && image_index > 28 && image_index < 43)
{
	with (instance_create((x + random_range(-5, 5)), (y + 46), obj_vomit))
		sprite_index = spr_vomit2
}
if (get_heat_player() >= 2 && (!instance_exists(angryeffectid)) && state == states.normal && character != "V")
{
	with (instance_create(x, y, obj_angrycloud))
	{
		playerid = other.object_index
		other.angryeffectid = id
	}
}
if (object_index == obj_player1)
{
	// Combo Titles
	var _cTitle = floor(global.combo / 5)
	var a = get_chardetail("combotitle")
	_cTitle = clamp(_cTitle, 0, floor(((sprite_get_number(a[0]) - 1) / 2)))
	if oldComboTitle != _cTitle && _cTitle != 0 {
		oldComboTitle = _cTitle
		instance_destroy(combo_title)
		combo_title = -4
		combo_title = instance_create(830, 250, obj_combotitle)
		combo_title.title = _cTitle
	
}
	if (!((state == states.door or state == states.chainsaw || state == states.tube or state == states.taxi or state == states.gottreasure or state == states.victory or state == states.gottreasure or state == states.actor or state == states.comingoutdoor or (state == states.knightpep && (sprite_index == spr_knightpepstart or sprite_index == spr_knightpepthunder)) or instance_exists(obj_fadeout) or place_meeting(x, y, obj_secretportal) or place_meeting(x, y, obj_secretportalstart))))
	{
		if (global.combotime > 0)
			global.combotime -= 0.15
	}
	if (global.heattime > 0)
		global.heattime -= 0.15
	if (global.combotime <= 0 && global.combo != 0)
	{
		global.savedcombo = global.combo
		global.combotime = 0
		global.combo = 0
		obj_camera.alarm[4] = 2
		supercharge = 0
	}
	if (global.heattime <= 0 && global.style > -1 && global.stylelock == 0)
		global.style -= 0.05
}
if lunge_hits >= 2 && finisher == false {
	finisher = true
	instance_create(x, y, obj_finishereffect)	
}

if state != states.lungeattack && state != states.chainsaw {
	lunge_hits = 0
	finisher = false	
}


if (key_jump && (!grounded) && (state == states.mach2 or state == states.mach3) && (state != (states.climbwall & walljumpbuffer)) <= 0)
	input_buffer_walljump = 24
if (input_buffer_jump < 8)
	input_buffer_jump++
if key_jump input_buffer_jump2 = 0	
else if (input_buffer_jump2 < 8)
	input_buffer_jump2++
if (input_buffer_secondjump < 8)
	input_buffer_secondjump++
if (input_buffer_highjump < 8)
	input_buffer_highjump++
if (input_attack_buffer > 0)
	input_attack_buffer--
if (input_finisher_buffer > 0)
	input_finisher_buffer--
if (input_up_buffer > 0)
	input_up_buffer--
if (input_down_buffer > 0)
	input_down_buffer--
if (input_buffer_walljump > 0)
	input_buffer_walljump--
if (input_buffer_slap < 8)
	input_buffer_slap++
if (key_particles == 1 || global.ghostkiller)
	create_particle((x + random_range(-25, 25)), (y + random_range(-35, 25)), particle.keyparticles, 0)
if (inv_frames == 0 && hurted == 0 && state != states.ghost)
	image_alpha = 1
if (state == states.punch or (state == states.jump && sprite_index == spr_playerN_noisebombspinjump) or state == states.tacklecharge or state == states.skateboard or state == states.knightpep or state == states.cheesepep or state == states.knightpepslopes or state == states.knightpepattack or state == states.bombpep or state == states.facestomp or state == states.machfreefall or state == states.facestomp or state == states.mach3 or state == states.freefall or state == states.Sjump)
	attacking = 1
else
	attacking = 0
if (state == states.throwing or state == states.backkick or state == states.shoulder or state == states.uppunch)
	grabbing = 1
else
	grabbing = 0
if ((image_index == spr_mach2jump || state == states.ratmountbounce && vsp >= 0) or state == states.chainsawpogo || state == states.flick || (state == states.mach2 && skateboarding) || (state = states.ghost && ghost_pepper >= 1) || (state == states.machroll && if_char(characters.jetpack_noise)) || sprite_index == spr_mach3boost ||((sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_pizzelle_Sjumpcancel) && sprite_index != spr_pizzelle_Sjumpcancel) or sprite_index == spr_swingding or sprite_index == spr_tumble or state == states.boxxedpepspin or state == states.trashroll or state == states.trashjump or state == states.shotgundash or (state == states.shotgunfreefall && (sprite_index == spr_shotgunjump2 or sprite_index == spr_shotgunjump3)) or state == states.Sjump or state == states.rocket or state == states.rocketslide or state == states.chainsawbump or state == states.punch or state == states.faceplant or state == states.rideweenie or state == states.mach3 or (state == states.jump && sprite_index == spr_playerN_noisebombspinjump) or state == states.freefall or state == states.fireass or state == states.jetpackjump or state == states.firemouth or state == states.hookshot or state == states.jetpackjump or state == states.skateboard or state == states.mach4 or state == states.Sjump or state == states.machfreefall or state == states.tacklecharge or (state == states.superslam && sprite_index == spr_piledriver) or state == states.knightpep or state == states.knightpepattack or state == states.knightpepslopes or state == states.trickjump or state == states.cheesepep or state == states.cheeseball or state == states.ratmounttumble or state == states.ratmountgroundpound or state == states.ratmountpunch or state == states.antigrav or ratmount_movespeed >= 12 or state == states.slipbanan or state == states.shoulderbash)
	instakillmove = 1
else
	instakillmove = 0
if (state == states.ratmountbounce && vsp < 0)
	stunmove = 1
else
	stunmove = 0
if (flash == 1 && alarm[0] <= 0)
	alarm[0] = (0.15 * room_speed)
if (state != states.ladder)
	hooked = 0
if (state != states.mach3 && state != states.machslide)
	autodash = 0
if ((state != states.jump && state != states.crouchjump && state != states.slap) or vsp < 0)
	fallinganimation = 0
if (state != states.freefallland && state != states.normal && state != states.machslide && state != states.jump)
	facehurt = 0
if (state != states.normal && state != states.machslide)
	machslideAnim = 0
if (state != states.normal && state != states.ratmount)
{
	idle = 0
	dashdust = 0
}
if (state != states.mach1 && state != states.cheesepepjump && state != states.jump && state != states.hookshot && state != states.handstandjump && state != states.normal && state != states.mach2 && state != states.mach3 && state != states.freefallprep && state != states.knightpep && state != states.shotgun && state != states.knightpepslopes)
	momemtum = 0
if (state != states.Sjump && state != states.Sjumpprep)
	a = 0
if (state != states.facestomp)
	facestompAnim = 0
if (state != states.freefall && state != states.facestomp && state != states.superslam && state != states.freefallland)
	superslam = 0
if (state != states.mach2)
	machpunchAnim = 0
if (ladderbuffer > 0)
	ladderbuffer--
if (state != states.jump)
	stompAnim = 0
if (state == states.mach3 or state == states.mach2 or ratmount_movespeed >= 12 || state == states.chainsawpogo || state == states.chainsawbump)
{
	if toomuchalarm1 > 0 toomuchalarm1--
	else {
		toomuchalarm1 = 6
		with (create_mach3effect(x, y, sprite_index, (image_index - 1)))
		{
			playerid = other.object_index
			image_xscale = other.xscale
		}
		
	}
	
	
	
} else toomuchalarm1 = 0
if is_pizzaboyroom() {
	var prefix = [
		["$", "S", "s", "5"],
		["(", "C", "c", "{"],
		["0", "O", "o", "()"],
		["V", "U", "u", "v"],
		["7", "T", "t"],
		["|)", "D", "d", "p"],
		["1", "I", "i", "l", "^"],
		["G", "g", "q"],
		["0", "O", "o", "()"],
		[":"],
		[" "],
	]
	var letters = ["!", "@", "#", "$", "%", "^", "&", "*", "(", ")", ".", "?", ":", "Z", "X", "G", "L", "V", "M", "N", "Q", "T", "Y", "A"]
	var _string = ""
	for (var aa = 0; aa < array_length(prefix); aa++) {
		var length = array_length(prefix[aa]) - 1
		var randd = irandom(length)
		var the_char = string(prefix[aa, randd])
		_string += the_char
	}
	repeat (25) _string += letters[irandom(array_length(letters) - 1)]
	window_set_caption(_string)
} else window_set_caption(global.window_title)

if ((y > (room_height + 300) or y < -800) && state != states.bossdefeat && (!(place_meeting(x, y, obj_verticalhallway))) && (!verticalhallway) && room != custom_lvl_room && room != timesuproom && state != states.gameover && state != states.exit_level && state != states.gotoplayer)
{
	scr_technicaldifficulties()
}



if (character != characters.pepperman)
{
	if !place_meeting_collision(x, y)
	{
		if (state != states.ratmountcrouch && sprite_index != spr_playerN_jetpackslide && state != states.boxxedpepjump && state != states.boxxedpepspin && (!((state == states.bump && sprite_index == spr_tumbleend))) && state != states.barrelslide && state != states.barrelclimbwall && sprite_index != spr_player_breakdancesuper && sprite_index != spr_player_barrelslipnslide && sprite_index != spr_player_barrelroll && sprite_index != spr_bombpepintro && sprite_index != spr_knightpepthunder && state != states.stunned && state != states.crouch && state != states.shotguncrouch && state != states.shotguncrouchjump && state != states.boxxedpep && state != states.pistol && sprite_index != spr_player_crouchshoot && state != states.Sjumpprep && state != states.crouchslide && state != states.chainsaw && state != states.machroll && state != states.hurt && state != states.crouchjump && state != states.cheesepepstickup && state != states.cheesepepstickside && state != states.tumble)
			mask_index = spr_player_mask
		else
			mask_index = spr_crouchmask
			
		if character == characters.snick mask_index = spr_crouchmask
	}

}
else
	mask_index = spr_pepperman_mask
if state == states.mariowalk mask_index = (sprite_index == spr_mario_crouch) ? spr_pixel : spr_mario_mask	
if character == characters.vigilante && state != states.mach2 && state != states.mach3 mask_index = spr_crouchmask
if (state == states.gottreasure or sprite_index = spr_keyget || state == states.bossdefeat || sprite_index == spr_knightpepstart or state == states.tube || sprite_index == spr_knightpepthunder || sprite_index == spr_player_trashstart or state == states.keyget or state == states.chainsaw or state == states.door or state == states.ejected or state == states.victory or state == states.comingoutdoor or state == states.gameover or state == states.gotoplayer or state == states.policetaxi or state == states.actor or place_meeting(x, y, obj_secretportal) or place_meeting(x, y, obj_secretportalstart))
	cutscene = 1
else
	cutscene = 0
	
var place_door = instance_place(x, y, obj_door)
var place_keydoor = instance_place(x, y, obj_keydoor)
var place_gate = instance_place(x, y, obj_exitgate)
if ((place_door > 0 && (place_door.sprite_index != place_door.closedspr && !place_door.locked)) ||
place_meeting(x, y, obj_taxi) || 
(place_keydoor > 0 && (place_keydoor.sprite_index != spr_doorkey || global.key_inv)) ||
(place_gate > 0 && (place_gate.image_index != 1 && global.panic)) ||
(place_meeting(x, y, obj_npc))) 
&& grounded && state == states.normal {
	if draw_uparrow < 0 draw_uparrow = 0
	draw_uparrow += 0.35
	
}
else draw_uparrow = -1

/*	
if (((place_meeting(x, y, obj_door) && (!(place_meeting(x, y, obj_doorblocked)))) or place_meeting(x, y, obj_taxi) or place_meeting(x, y, obj_dresser) or place_meeting(x, y, obj_keydoor) or place_meeting(x, y, obj_filedoor) or place_meeting(x, y, obj_optiondoor)  or (place_meeting(x, y, obj_exitgate) && global.panic == true)) && (!instance_exists(obj_uparrow)) && scr_solid(x, (y + 1)) && state == states.normal && obj_player1.spotlight == 1)
{
	with (instance_create(x, y, obj_uparrow))
		playerid = other.object_index
}
*/
//if abs(hsp) > 6 snap_to_solid(hsp, 640)

if (movespeed >= 16 && state == states.mach3 && (!instance_exists(speedlineseffectid)))
{
	with (instance_create(x, y, obj_speedlines))
	{
		playerid = other.object_index
		other.speedlineseffectid = id
	}
}
with (obj_ratblock)
	scr_ratblock_destroy()
scr_collide_destructibles()
if (state != states.ghostpossess && state != states.exit_level && state != states.gotoplayer && state != states.debugstate && state != states.titlescreen && state != states.tube && state != states.grabbed && state != states.door && state != states.ejected && state != states.comingoutdoor && state != states.boulder && state != states.keyget && state != states.victory && state != states.portal && state != states.timesup && state != states.gottreasure && state != states.gameover)
	scr_collision()
if (state == states.tube or state == states.gotoplayer or state == states.debugstate)
{
	x += hsp
	y += vsp
}
if super_mario && state != states.mariowalk && state != states.backbreaker && state != states.marioslide && !cutscene && state != states.gameover && state != states.debugstate && !instance_exists(obj_fadeout) && state != states.door
state = states.mariowalk



if (state == states.boulder)
	scr_collision(true)
	
if (state == states.cotton && sprite_index = spr_cotton_drill)
	scr_collision(true)
if (state != states.comingoutdoor)
	image_blend = c_white
if !grounded
	storedvsp = vsp
laddervsp = Approach(laddervsp, 10, 0.10)	
prevstate = state
prevsprite = sprite_index

audio_listener_position(x, y, 0);
audio_emitter_position(global.musicemitter, x, y, 0)
//audio_emitter_position(global.sfxemitter, x, y, 0)