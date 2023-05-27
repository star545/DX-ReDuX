function string_extract(str, sep, index) {


    var len;
    len = string_length(sep)-1;
    repeat (index) { 
		str = string_delete(str,1,string_pos(sep,str)+len); 
	}
    str = string_delete(str,string_pos(sep,str),string_length(str));
    return str;
}
function scr_player_state() {

	var _stateFunction = undefined
	switch state
	{
		case states.normal:
			_stateFunction = scr_player_normal;
			break
		case states.spindash:
			_stateFunction = scr_player_spindash;
			break
		case states.mariowalk:
			_stateFunction = scr_player_mario;
			break
		case states.marioslide:
			_stateFunction = scr_mario_wallslide;
			break
		case states.talkto:
			_stateFunction = scr_player_dialog;
			break
		case states.mortshoot:
			_stateFunction = scr_player_mortshoot;
			break
		case states.exit_level:
			_stateFunction = scr_player_exitlevel;
			break
		case states.flick:
			_stateFunction = scr_player_flick;
			break
		case states.revolver:
			_stateFunction = scr_player_revolver;
			break
		case states.dynamite:
			_stateFunction = scr_player_dynamite;
			break
		case states.boots:
			_stateFunction = scr_player_boots;
			break
		case states.grabbed:
			_stateFunction = scr_player_grabbedclone;
			break
		case states.finishingblow:
			_stateFunction = scr_player_finishingblow;
			break
		case states.tumble:
			_stateFunction = scr_player_tumble;
			break
		case states.titlescreen:
			_stateFunction = scr_player_titlescreen;
			break
		case states.ejected:
			_stateFunction = scr_player_ejected;
			break
		case states.firemouth:
			_stateFunction = scr_player_firemouth;
			break
		case states.fireass:
			_stateFunction = scr_player_fireass;
			break
		case states.transitioncutscene:
			_stateFunction = scr_player_transitioncutscene;
			break
		case states.hookshot:	
			_stateFunction = scr_playerN_hookshot;
			break
		case states.slap:
			_stateFunction = scr_player_slap;
			break
		case states.tacklecharge:
			_stateFunction = scr_player_tacklecharge;
			break
		case states.cheesepep:
			_stateFunction = scr_player_cheesepep;
			break
		case states.cheesepepjump:
			_stateFunction = scr_player_cheesepepjump;
			break
		case states.cheesepepfling:
			_stateFunction = scr_player_cheesepepfling;
			break
		case states.cheeseball:
			_stateFunction = scr_player_cheeseball;
			break
		case states.cheeseballclimbwall:
			_stateFunction = scr_player_cheeseballclimbwall;
			break
		case states.cheesepepstickside:
			_stateFunction = scr_player_cheesepepstickside;
			break
		case states.cheesepepstickup:
			_stateFunction = scr_player_cheesepepstickup;
			break
		case states.cheesepepstick:
			_stateFunction = scr_player_cheesepepstick;
			break		
		case states.cheesepeplaunch:
			_stateFunction = scr_player_cheesepeplaunch;
			break
		case states.boxxedpep:
			_stateFunction = scr_player_boxxedpep;
			break
		case states.boxxedpepjump:
			_stateFunction = scr_player_boxxedpepjump;
			break
		case states.boxxedpepspin:
			_stateFunction = scr_player_boxxedpepspin;
			break
		case states.pistolaim:
			_stateFunction = scr_player_pistolaim;
			break
		case states.climbwall:
			_stateFunction = scr_player_climbwall;
			break
		case states.knightpepslopes:
			_stateFunction = scr_player_knightpepslopes;
			break
		case states.portal:
			_stateFunction = scr_player_portal;
			break
		case states.secondjump:
			_stateFunction = scr_player_secondjump;
			break
		case states.chainsawbump:
			_stateFunction = scr_player_chainsawbump;
			break
		case states.handstandjump:
			_stateFunction = scr_player_handstandjump;
			break
		case states.lungeattack:
			_stateFunction = scr_player_lungeattack;
			break
		case states.lungegrab:
			_stateFunction = scr_player_lungegrab;
			break
		case states.dashtumble:
			_stateFunction = scr_player_dashtumble;
			break
		case states.shoulderbash:
			_stateFunction = scr_player_shoulderbash;
			break
		case states.gottreasure:
			_stateFunction = scr_player_gottreasure;
			break
		case states.knightpep:
			_stateFunction = scr_player_knightpep;
			break
		case states.knightpepattack:
			_stateFunction = scr_player_knightpepattack;
			break
		case states.knightpepbump:
			_stateFunction = scr_player_knightpepbump;
			break
		case states.meteorpep:
			_stateFunction = scr_player_meteorpep;
			break
		case states.bombpep:
			_stateFunction = scr_player_bombpep;
			break
		case states.bombpepup:
			_stateFunction = scr_player_bombpepup;
			break
		case states.bombpepside:
			_stateFunction = scr_player_bombpepside;
			break
		case states.bombgrab:
			_stateFunction = scr_player_bombgrab;
			break
		case states.grabbing:
			_stateFunction = scr_player_grabbing;
			break
		case states.chainsawpogo:
			_stateFunction = scr_player_chainsawpogo;
			break
		case states.shotgunjump:
			_stateFunction = scr_player_shotgunjump;
			break
		case states.stunned:
			_stateFunction = scr_player_stunned;
			break
		case states.highjump:
			_stateFunction = scr_player_highjump;
			break
		case states.chainsaw:
			_stateFunction = scr_player_chainsaw;
			break
		case states.hit:
			_stateFunction = scr_player_hit;
			break
		case states.thrown:
			_stateFunction = scr_player_thrown;
			break
		case states.facestomp:
			_stateFunction = scr_player_facestomp;
			break
		case states.timesup:
			_stateFunction = scr_player_timesup;
			break
		case states.machroll:
			_stateFunction = scr_state_machroll;
			break
		case states.pistol:
			_stateFunction = scr_player_pistol;
			break
		case states.shotgun:
			_stateFunction = scr_player_shotgun;
			break
		case states.shotguncrouch:
			_stateFunction = scr_player_shotguncrouch;
			break
		case states.shotguncrouchjump:
			_stateFunction = scr_player_shotguncrouchjump;
			break
		case states.shotgunshoot:
			_stateFunction = scr_player_shotgunshoot;
			break
		case states.shotgunfreefall:
			_stateFunction = scr_player_shotgunfreefall;
			break
		case states.shotgundash:
			_stateFunction = scr_player_shotgundash;
			break
		case states.machfreefall:
			_stateFunction = scr_player_machfreefall;
			break
		case states.throwing:
			_stateFunction = scr_player_throwing;
			break
		case states.superslam:
			_stateFunction = scr_player_superslam;
			break
		case states.slam:
			_stateFunction = scr_player_slam;
			break
		case states.skateboard:
			_stateFunction = scr_player_skateboard;
			break
		case states.grind:
			_stateFunction = scr_player_grind;
			break
		case states.grab:
			_stateFunction = scr_player_grab;
			break
		case states.punch:
			_stateFunction = scr_player_punch;
			break
		case states.backkick:
			_stateFunction = scr_player_backkick;
			break
		case states.uppunch:
			_stateFunction = scr_player_uppunch;
			break
		case states.shoulder:
			_stateFunction = scr_player_shoulder;
			break
		case states.backbreaker:
			_stateFunction = scr_player_backbreaker;
			break
		case states.graffiti:
			_stateFunction = scr_player_graffiti;
			break
		case states.bossdefeat:
			_stateFunction = scr_player_bossdefeat;
			break
		case states.bossintro:
			_stateFunction = scr_player_bossintro;
			break
		case states.smirk:
			_stateFunction = scr_player_smirk;
			break
		case states.pizzathrow:
			_stateFunction = scr_player_pizzathrow;
			break
		case states.gameover:
			_stateFunction = scr_player_gameover;
			break
		case states.Sjumpland:
			_stateFunction = scr_player_Sjumpland;
			break
		case states.freefallprep:
			_stateFunction = scr_player_freefallprep;
			break
		case states.runonball:
			_stateFunction = scr_player_runonball;
			break
		case states.boulder:
			_stateFunction = scr_player_boulder;
			break
		case states.keyget:
			_stateFunction = scr_player_keyget;
			break
		case states.tackle:
			_stateFunction = scr_player_tackle;
			break
		case states.slipnslide:
			_stateFunction = scr_player_slipnslide;
			break
		case states.ladder:
			_stateFunction = scr_player_ladder;
			break
		case states.jump:
			_stateFunction = scr_player_jump;
			break
		case states.victory:
			_stateFunction = scr_player_victory;
			break
		case states.comingoutdoor:
			_stateFunction = scr_player_comingoutdoor;
			break
		case states.Sjump:
			_stateFunction = scr_player_Sjump;
			break
		case states.Sjumpprep:
			_stateFunction = scr_player_Sjumpprep;
			break
		case states.crouch:
			_stateFunction = scr_player_crouch;
			break
		case states.crouchjump:
			_stateFunction = scr_player_crouchjump;
			break
		case states.crouchslide:
			_stateFunction = scr_player_crouchslide;
			break
		case states.mach1:
			_stateFunction = scr_player_mach1;
			break
		case states.mach2:
			_stateFunction = scr_player_mach2;
			break
		case states.mach3:
			_stateFunction = scr_state_mach3;
			break
		case states.machslide:
			_stateFunction = scr_player_machslide;
			break
		case states.bump:
			_stateFunction = scr_player_bump;
			break
		case states.hurt:
			_stateFunction = scr_player_hurt;
			break
		case states.freefall:
			_stateFunction = scr_player_freefall;
			break
		case states.freefallland:
			_stateFunction = scr_player_freefallland;
			break
		case states.hang:
			_stateFunction = scr_player_hang;
			break
		case states.door:
			_stateFunction = scr_player_door;
			break
		case states.barrel:
			_stateFunction = scr_player_barrel;
			break
		case states.barreljump:
			_stateFunction = scr_player_barreljump;
			break
		case states.barrelslide:
			_stateFunction = scr_player_barrelslide;
			break
		case states.barrelclimbwall:
			_stateFunction = scr_player_barrelclimbwall;
			break
		case states.current:
			_stateFunction = scr_player_current;
			break
		case states.taxi:
			_stateFunction = scr_player_taxi;
			break
		case states.policetaxi:
			_stateFunction = scr_player_taxi;
			break
		case states.pogo:
			_stateFunction = scr_player_pogo;
			break
		case states.rideweenie:
			_stateFunction = scr_player_rideweenie;
			break
		case states.motorcycle:
			_stateFunction = scr_player_motorcycle;
			break
		case states.faceplant:
			_stateFunction = scr_player_faceplant;
			break
		case states.ghost:
			_stateFunction = scr_player_ghost;
			break
		case states.ghostpossess:
			_stateFunction = scr_player_ghostpossess;
			break
		case states.mort:
			_stateFunction = scr_player_mort;
			break
		case states.mortjump:
			_stateFunction = scr_player_mortjump;
			break
		case states.mortattack:
			_stateFunction = scr_player_mortattack;
			break
		case states.morthook:
			_stateFunction = scr_player_morthook;
			break
		case states.hook:
			_stateFunction = scr_player_hook;
			break
		case states.arenaintro:
			_stateFunction = scr_player_arenaintro;
			break
		case states.actor:
			_stateFunction = scr_player_actor;
			break
		case states.parry:
			_stateFunction = scr_player_parry;
			break
		case states.golf:
			_stateFunction = scr_player_golf;
			break
		case states.tube:
			_stateFunction = scr_player_tube;
			break
		case states.pummel:
			_stateFunction = scr_player_pummel;
			break
		case states.slipbanan:
			_stateFunction = scr_player_slipbanan;
			break
		case states.bombdelete:
			_stateFunction = scr_player_bombdelete;
			break
		case states.rocket:
			_stateFunction = scr_player_rocket;
			break
		case states.rocketslide:
			_stateFunction = scr_player_rocketslide;
			break
		case states.gotoplayer:
			_stateFunction = scr_player_gotoplayer;
			break
		case states.trickjump:
			_stateFunction = scr_player_trickjump;
			break
		case states.ridecow:
			_stateFunction = scr_player_ridecow;
			break
		case states.ratmount:
			_stateFunction = scr_player_ratmount;
			break
		case states.ratmounthurt:
			_stateFunction = scr_player_ratmounthurt;
			break
		case states.ratmountjump:
			_stateFunction = scr_player_ratmountjump;
			break
		case states.ratmountattack:
			_stateFunction = scr_player_ratmountattack;
			break
		case states.ratmountspit:
			_stateFunction = scr_player_ratmountspit;
			break
		case states.ratmountclimbwall:
			_stateFunction = scr_player_ratmountclimbwall;
			break
		case states.ratmountgroundpound:
			_stateFunction = scr_player_ratmountgroundpound;
			break
		case states.ratmountbounce:
			_stateFunction = scr_player_ratmountbounce;
			break
		case states.ratmountballoon:
			_stateFunction = scr_player_ratmountballoon;
			break	
		case states.ratmountgrind:
			_stateFunction = scr_player_ratmountgrind;
			break
		case states.ratmounttumble:
			_stateFunction = scr_player_ratmounttumble;
			break
		case states.ratmountpunch:
			_stateFunction = scr_player_ratmountpunch;
			break
		case states.ratmounttrickjump:
			_stateFunction = scr_player_ratmounttrickjump;
			break
		case states.ratmountskid:
			_stateFunction = scr_player_ratmountskid;
			break
		case states.blockstance:
			_stateFunction = scr_player_blockstance;
			break
		case states.balloon:
			_stateFunction = scr_player_balloon;
			break
		case states.debugstate:
			_stateFunction = scr_player_debugstate;
			break
		case states.trashjump:
			_stateFunction = scr_player_trashjump;
			break
		case states.trashroll:
			_stateFunction = scr_player_trashroll;
			break
		case states.stringfling:
			_stateFunction = scr_player_stringfling;
			break
		case states.stringjump:
			_stateFunction = scr_player_stringjump;
			break
		case states.stringfall:
			_stateFunction = scr_player_stringfall;
			break
		case states.noisejetpack:
			_stateFunction = scr_player_noisejetpack;
			break
		case states.spiderweb:
			_stateFunction = scr_player_spiderweb;
			break
		case states.animatronic:
			_stateFunction = scr_player_animatronic;
			break
		case states.playersuperattack:
			_stateFunction = scr_player_playersuperattack;
			break
		case states.jetpackjump:
			_stateFunction = scr_player_jetpackjump;
			break
		case states.bee:
			_stateFunction = scr_player_bee;
			break
		case states.ratmountcrouch:
			_stateFunction = scr_player_ratmountcrouch;
			break
		case states.ratmountladder:
			_stateFunction = scr_player_ratmountladder;
			break
		case states.antigrav:
			_stateFunction = scr_player_antigrav;
			break
			case states.cotton:
			_stateFunction = scr_player_cotton;
			break
	}
	stateName = "states.undefined"
	if !is_undefined(_stateFunction)
		_stateFunction()
		//stateName = "states." + string_extract(script_get_name(_stateFunction), "_" ,1) + string_extract(script_get_name(_stateFunction), "_" , 3)
}