var a = object_index
if (instance_number(a) > 1) {
	var _first = instance_find(a, 0);
	if (id != _first) {
		instance_destroy(); 
		exit; 
	}
}
notifprevmu = -4
prevmuID = -4
unforce_cont = false
pausedmusic = 0
fadeoff = 0
global.music = 0
roomname = obj_null
arena = 0
global.mu = -4
forest_progress = 0
music = -4
secretmusic = -4
musicID = -4
force_cont = false
global.secretmusic = -4
pillarmusicID = -4
default_escapemusic = mu_pizzatime
escapemusic = -4
secret = 0
secretend = 0
pillar_on_camera = 0
prevpillar_on_camera = 0
room_detials = [Realtitlescreen, mu_title, mu_medievalsecret, false]
music_type = "escape"
// room, song, secret song, cont, loop start, title
// we could prolly just make some function for song names
room_arr = [
	// Hub and Title
	[Realtitlescreen, mu_title, mu_medievalsecret, false],
	[tower_entrancehall, mu_hub, mu_medievalsecret, false],
	[tower_entrancesmip, mu_hubsecret, mu_medievalsecret, false],
	[tower_smipsfunhouse, mu_smiphub, mu_medievalsecret, false],
	[tower_pizzaboybossroom, mu_pizzaboybossroom, mu_medievalsecret, false],
	[boss_pizzaboy, noone, mu_medievalsecret, false],
	
	[tower_1, mu_hub, mu_medievalsecret, true],
	[tower_2, mu_hub, mu_medievalsecret, true],
	[tower_3, mu_hub3, mu_medievalsecret, true], 
	[tower_4, mu_hub3, mu_medievalsecret, true], 
	[tower_5, mu_hub5, mu_medievalsecret, true], 
	
	[tower_secret1, mu_hubsecret, mu_medievalsecret, true], 
	[tower_secret2, mu_hubsecret, mu_medievalsecret, true], 
	[tower_snick, mu_hubsecret, mu_medievalsecret, true], 
	[tower_secret3, mu_hubsecret, mu_medievalsecret, true], 
	[tower_secret4, mu_hubsecret, mu_medievalsecret, true], 
	[tower_secret5, mu_hubsecret, mu_medievalsecret, true], 
	[tower_secret6, mu_pizzaboy, mu_medievalsecret, true], 
	[tower_pizzaboy1, mu_pizzaboy, mu_medievalsecret, true], 
	[tower_pizzaboy2, mu_pizzaboy, mu_medievalsecret, true], 
	[tower_pizzaboy3, mu_pizzaboy, mu_medievalsecret, true], 
	[tower_pizzaboy4, mu_pizzaboy, mu_medievalsecret, true], 
	[tower_arenatutorial, mu_arenatutorial, mu_medievalsecret, false], 
	
	[tower_quickwarp, mu_hubsecret, mu_medievalsecret, true],
	[tower_finale, mu_towertop, mu_medievalsecret, true],
	[tower_finale2, mu_towertop, mu_medievalsecret, true],
	[tower_top, mu_top, mu_medievalsecret, true],
	[tower_top2, mu_top, mu_medievalsecret, true],
	[tower_greenroom, noone, mu_medievalsecret, true],
	[tower_stew, mu_stew, mu_medievalsecret, false],
	[rm_levelselect, mu_title, mu_medievalsecret, false],
	// W1
	[entrance_1, mu_entrance, mu_medievalsecret, false],
	[medieval_1, mu_medievalentrance, mu_medievalsecret, false, function() { 
		var _s = obj_player1.state == states.chainsaw ? obj_player1.tauntstoredstate : obj_player1.state
		if _s == states.knightpep || _s == states.knightpepbump || _s == states.knightpepslopes return mu_medievalremix
		else return mu_medievalentrance	
	}],
	[medieval_5, mu_medievalentrance, mu_medievalsecret, true],
	//[medieval_3, mu_medievalremix, mu_medievalsecret, true],
	//[medieval_5, mu_medievalremix, mu_medievalsecret, true],
	[medieval_6, mu_medieval, mu_medievalsecret, true],
	[ruin_1, mu_ruin, mu_ruinsecret, false], 
	[ruin_6, mu_ruin, mu_ruinsecret, true], 
	[ruin_7, mu_ruinremix, mu_ruinsecret, true],
	[dungeon_1, mu_dungeon, mu_dungeonsecret, false],
	[dungeon_8, mu_dungeon, mu_dungeonsecret, true],
	[dungeon_9, mu_dungeonbottom, mu_dungeonsecret, true],
	[strongcold_1, mu_chateau, mu_medievalsecret, false],
	[strongcold_2, mu_strongcold, mu_medievalsecret, false],
	[strongcold_9, mu_dungeondepth, mu_medievalsecret, false],
	
	// W2
	[badland_1, mu_desert, mu_desertsecret, false], 
	[badland_8, mu_desert, mu_desertsecret, true],
	[badland_9, mu_ufo, mu_desertsecret, true],
	[badland_mart4, mu_ufo, mu_desertsecret, true],
	[badland_10, mu_desert, mu_desertsecret, true], 
	[graveyard_1, mu_graveyard, mu_graveyardsecret, false], 
	[graveyard_3, mu_graveyard, mu_graveyardsecret, true], 
	[graveyard_4, mu_tombstone, mu_graveyardsecret, true], 
	
	[farm_2, mu_farm, mu_farmsecret, false],
	[saloon_1, mu_saloon, mu_saloonsecret, false, function() {
		var _s = obj_player1.state == states.chainsaw ? obj_player1.tauntstoredstate : obj_player1.state
		if _s == states.rideweenie return mu_saloonalt
		else return mu_saloon	
	}],
	// W3
	[plage_entrance, mu_beach, mu_pinballsecret, false],
	[forest_1, mu_forestOld, mu_forestsecret, false],
	[forest_G1, mu_forestOld, mu_forestsecret, true, function() {
		if obj_player1.isgustavo || forest_progress return mu_forest
		else return mu_forestOld
	}],
	//[forest_G1, mu_forestOld, mu_medievalsecret, true],
	[forest_G1b, mu_arenatutorial, mu_forestsecret, false],
	[forest_5, mu_forest, mu_forestsecret, true],
	[space_1, mu_pinball, mu_pinballsecret, false],
	[minigolf_1, mu_minigolf, mu_pinballsecret, false],
	// W4
	[street_intro, noone, mu_sewersecret, false],
	[street_1, mu_street, mu_sewersecret, false],
	[street_jail, mu_gustavo, mu_sewersecret, true],
	[street_4, mu_kungfu, mu_sewersecret, true],
	[sewer_1, mu_sewer, mu_sewersecret, false],
	[sewer_4, mu_sewer, mu_sewersecret, true],
	[sewer_5, mu_toxic, mu_sewersecret, true],
	
	[industrial_1, mu_industrial, mu_sewersecret, false],
	[industrial_2, mu_industrial, mu_sewersecret, true],
	[industrial_3, mu_industrialinside, mu_sewersecret, true],
	
	[freezer_1, mu_freezer, mu_sewersecret, false], 
	[freezer_13, mu_freezer, mu_sewersecret, true], 
	[freezer_15, mu_freezerinside, mu_sewersecret, true], 
	
	//W5
	[chateau_1, mu_chateau, mu_medievalsecret, false], 
	[mansion_start, mu_mansion, mu_mansionsecret, false],
	[mansion_b1_1, mu_graveyardOLD, mu_graveyardsecretOLD, false],
	[kidsparty_1, mu_kidsparty, mu_medievalsecret, false], 
	[war_1, mu_war, mu_warsecret, false], 
	
	
	[champ_1, mu_champ, mu_champsecret, false],
	[credits, mu_champ, mu_champsecret, false],
	
	// Extra
	[strongcold_arena, mu_strongcold, mu_strongcold, false],
	[pinball_arena, mu_pinball_arena, mu_strongcold, false],
	[kungfu_arena, mu_kungfu, mu_kungfu, false],
	[clown_arena, mu_clown, mu_clown, false],
	[lightsout_arena, mu_lightsout, mu_lightsout, false],
	[tower_arena, mu_meatlover, mu_lightsout, false],
	[ufo_1, mu_ufo, mu_pinballsecret, false],
	[dragonlair_1, mu_dungeondepth, mu_dungeondepth, false],
	
	// Basement
	
	// DXtras
	[mania_1, mu_dungeondepth, mu_pinballsecret, false],
	[bath_1, mu_bath, mu_medievalsecret, false],
	[calzone_1, mu_calzone, mu_medievalsecret, false],
	[cheeser_1, mu_entrance_pc, mu_entrancesecret_pc, false],
	[tower_dark, mu_pizzaboy, mu_medievalsecret, false],
	[tower_quickwarpdark, mu_pizzaboy, mu_medievalsecret, false],
	[tower_smipsfunhouse, mu_hubsecret, mu_medievalsecret, false],
	[tower_entrancesmip, mu_hubsecret, mu_medievalsecret, false],
	[tower_smiparenasecret, mu_arenatutorial, mu_arenatutorial, false],
	[demozero_1, mu_ruinremix, mu_ruinsecret, false],
	[tower_arenaroom, mu_gustavo, mu_gustavo, false]
	
	
	//[tower_finalhallway, mu_finalescape, mu_dungeonsecret, false]
]
global.lowpassEffect = audio_effect_create(AudioEffectType.LPF2);
global.lowpassEffect.cutoff = 600
global.lowpassEffect.q = 0
global.lowpassEffect.bypass = true
global.musicemitter = audio_emitter_create();
global.musicbus = audio_bus_create();

//global.sfxemitter = audio_emitter_create()
//global.sfxbus = audio_bus_create()
master_gain = 1
global.musicbus.effects[0] = global.lowpassEffect
audio_emitter_bus(global.musicemitter, global.musicbus);
//audio_emitter_bus(global.musicemitter, global.musicbus);