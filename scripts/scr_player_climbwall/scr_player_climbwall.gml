function scr_player_climbwall()
{
	switch character
	{
		default:
			if (windingAnim < 200)
				windingAnim++
			move = (key_left + key_right)
			suplexmove = 0
			vsp = (-wallspeed)
			var upto = 20
			if (character == characters.noise || character == characters.pizzelle || character == characters.jetpack_noise) upto = 24
			if (wallspeed < upto)
				wallspeed += 0.15
			if (wallspeed < 0)
			{
				if (mach4mode == 0)
					movespeed += 0.2
				else
					movespeed += 0.4
			}
			crouchslideAnim = 1
			if (vsp < -5)
				sprite_index = spr_machclimbwall
			else
				sprite_index = spr_player_clingwall
			if skateboarding
				sprite_index = spr_clownwallclimb
			if (grabclimbbuffer > 0)
                grabclimbbuffer--				
			if ((!key_attack) && (!skateboarding) && grabclimbbuffer <= 0)
			{
				grabclimbbuffer = 0
				state = states.normal
				movespeed = 0
				railmovespeed = 6
				raildir = (-xscale)
			}
			if (verticalbuffer <= 0 && place_meeting_solid(x, y - 1) && !place_meeting(x, y - 1, obj_verticalhallway) && !place_meeting(x, y - 1, obj_destructibles))
			{
				trace("climbwall hit head")
				if (!skateboarding)
				{
					sprite_index = spr_superjumpland
					scr_soundeffect(sfx_groundpound)
					image_index = 0
					state = states.Sjumpland
					machhitAnim = 0
				}
				else if (!key_jump)
				{
					state = states.bump
					hsp = (-2.5 * xscale)
					vsp = -3
					mach2 = 0
					image_index = 0
				}
			}
			if (verticalbuffer <= 0 && !place_meeting_solid(x + xscale, y) && !place_meeting_slopeSolid(x + xscale, y) && !place_meeting(x, y, obj_verticalhallway) && !place_meeting(x, y - 12, obj_verticalhallway) && !place_meeting_slope(x, y - 1))
			{
				trace("climbwall out")
				instance_create(x, y, obj_jumpdust)
				vsp = 0
				ledge_bump(32)
				if (wallspeed < 6)
					wallspeed = 6
				if ((wallspeed >= 6 && wallspeed < 12) or skateboarding)
				{
					state = states.mach2
					movespeed = wallspeed
				}
				else if (wallspeed >= 12)
				{
					state = states.mach3
					sprite_index = spr_mach4
					movespeed = wallspeed
				}
			}
			if (wallspeed < 0 && place_meeting_solid(x, y + 12))
				wallspeed = 0
			if key_jump
			{
				key_jump = 0
				movespeed = 10
				state = states.mach2
				if (wallspeed >= 12 && !skateboarding && character == characters.pizzelle || character == characters.vigilante || character == characters.snick)
				{
					state = states.mach3
					sprite_index = spr_mach4
					movespeed = wallspeed
					if character == characters.vigilante || character == characters.snick {
						if movespeed - 2 < 12 {
							state = states.mach2
							sprite_index = spr_mach
						}
						else {
							sprite_index = spr_mach4
							movespeed -= 2
						}
					}
				}
				image_index = 0
				if character != characters.vigilante sprite_index = spr_walljumpstart
				if skateboarding
					sprite_index = spr_clownjump
				vsp = -11
				if global.arena_perks.flight vsp = -15
				xscale *= -1
				jumpstop = 0
				walljumpbuffer = 4
			}
			image_speed = 0.6
			if (!instance_exists(obj_cloudeffect))
				instance_create(x, (y + 43), obj_cloudeffect)
			break
		case characters.jetpack_noise:
			hsp = 0
			if (sprite_index == spr_playerN_wallclingstart && floor(image_index) == (image_number - 1))
				sprite_index = spr_playerN_wallcling
			if (sprite_index == spr_playerN_wallcling)
				vsp = 2
			else
				vsp = 0
			wallclingcooldown = 0
			if (floor(image_index) == (image_number - 1) or (!key_jump2))
			{
				vsp = -15
				state = states.jump
				sprite_index = spr_playerN_jump
				image_index = 0
			}
			if key_jump
			{
				vsp = -15
				state = states.jump
				sprite_index = spr_playerN_jump
				image_index = 0
			}
			image_speed = 0.35
			break
	}

	exit;
}
/*
// Possible rewrite might be needed to replace this whole thing with something a lot more sonic-y. [Four Modes anyone? (three modes tbh)]
function scr_pizzelle_climbwall() {
	if (windingAnim < 200) {
		windingAnim++;
	}
	suplexmove = 0;
	vsp = (-wallspeed)
	if (wallspeed > 0) {
			wallspeed -= 0.25;
		
	} else {
		var _decc = 0.15 + (0.35 * (-wallspeed / 5));
		wallspeed -= clamp(_decc, 0.15, 0.35);
		wallspeed = max(-30, wallspeed);
	}
	
	crouchslideAnim = 1;
	sprite_index = spr_climbwall;
	
	if (wallspeed <= 0) {
		movespeed = 0;
		mach2 = 0;
	}
	if ((!key_attack) && (!skateboarding))
	{
		state = states.normal
		movespeed = 0
		railmovespeed = 6
		raildir = (-xscale)
	}
	//When wall ends
	if (!scr_solid((x + xscale), y)) {
	    instance_create(x, y, obj_jumpdust);
	    vsp = 0;
		if mach2 < 100 && wallspeed > 0 { //Reset Speed
			state = states.mach2;
			//movespeed = 8;
		} else if mach2 >= 100 && wallspeed > 0 {
			state = states.mach3;
			sprite_index = spr_mach4;
			//movespeed = 12;
		} else { 
			state = states.jump;
			sprite_index = spr_fall;			
			vsp = -wallspeed;
		}			
	}
	//Hit Ceiling
	if place_meeting_collision(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles)
	{
	    sprite_index = spr_superjumpland
	    scr_soundeffect(sfx_groundpound)
	    image_index = 0
	    state = states.Sjumpland
	    machhitAnim = 0
	    with (obj_camera) {
	        shake_mag = 10;
	        shake_mag_acc = (30 / room_speed);
	    }		
	}
	//Jump out of wall
	if (key_jump && key_attack) {
	    if (mach2 >= 100 ) {
	        mach2 = 100;
	        instance_create(x, y, obj_jumpdust);
	        vsp = -9;
	        sprite_index = spr_crazyrun;
	        state = states.mach3
	    } else {
	        sprite_index = spr_mach2jump;
			movespeed = 10;
			mach2 = 35;
	        instance_create(x, y, obj_jumpdust);
	        vsp = -9;
	        state = states.mach2;			
		}
		walljumpbuffer = 4
		xscale *= -1
	}
	if grounded && wallspeed <= 0 {
		state = states.jump;
		sprite_index = spr_fall;			
		vsp = -wallspeed;	
	}
	//Effects and Image Speed
	image_speed = 0.6;
	if (!instance_exists(obj_cloudeffect)) 
		instance_create(x, (y + 43), obj_cloudeffect);	
}
/*
function scr_player_climbceiling() {
	if (windingAnim < 200) {
		windingAnim++;
	}
	hsp = (movespeed * -xscale)
	vsp = 0;
	draw_angle += 180;
	
	if !scr_solid(x, y - 1) {
		xscale *= -1
		draw_angle -= 180;
		if movespeed < 12 {
			state = states.mach2;
		} else if movespeed >= 12 {
			state = states.mach3;
			sprite_index = spr_mach4;
		} else { 
			state = states.jump;
		}			
	}

	//Hit Wall
	if ((place_meeting_slope(x, y - 1)) && scr_solid(x - xscale, y, true) && !place_meeting(x - xscale, y, obj_destructibles) && !place_meeting(x - xscale, y, obj_metalblock)) {
		wallspeed = movespeed;
		state = states.climbdownwall;
	} else if scr_solid(x - xscale, y, true) && !place_meeting(x - xscale, y, obj_destructibles) && !place_meeting(x - xscale, y, obj_metalblock) {
		#region Bump Wall
		scr_sound(sound_maximumspeedland);
		camera_shake(20, 40);
		image_speed = 0.35;
		with (obj_baddie) {
			if bbox_in_camera(view_camera[0]) && grounded {
				stun = 1;
			    alarm[0] = 200;
			    ministun = 0;
			    vsp = -5;
			    hsp = 0;
			}
		}
		flash = 0;
		combo = 0;
		sprite_index = spr_hitwall;
		state = states.bump;
		hsp = -2.5 * -xscale;
		vsp = -3;
		mach2 = 0;
		image_index = 0;
		instance_create((x + 10 * -xscale), (y + 10 ), obj_bumpeffect);
		#endregion
	}	

	//Effects and Image Speed
	image_speed = 0.6;	
	if (sprite_index == spr_mach4) image_speed = 0.4;
	if (sprite_index == spr_crazyrun) image_speed = 0.55;
}

function scr_player_climbdownwall() {
	if (windingAnim < 200) {
		windingAnim++;
	}
	draw_angle += 180;
	suplexmove = 0;
	vsp = (wallspeed);
	if vsp != 0 && place_meeting(x - xscale, y, obj_molassesWall) {
		if (floor(image_index) % 4) == 0
		{
			with instance_create(x + 16 * -xscale, y + 43, obj_debris) {
				sprite_index = spr_molassesgoop;
				image_index = irandom_range(0, 5);
			}			
		}
	}
	if place_meeting(x - xscale, y, obj_molassesWall) {
		wallspeed += 0.15;
	} else {
		wallspeed += 0.25;
	}
	wallspeed = min(30, wallspeed);
	 
	crouchslideAnim = 1;
	sprite_index = spr_climbwall;
	
	if (character = "P" || character = "N") && !key_attack	{
	    state = states.jump;
	    sprite_index = spr_fall;
		xscale *= -1;
		slideHsp = -6 * xscale;
	}	
	//When wall ends
	if (!scr_solid((x - xscale), y)) {
	    instance_create(x, y, obj_jumpdust);
		xscale *= -1;
		vsp = wallspeed;
	    state = states.freefall;
		freefallsmash = 10;		
		/*
		if mach2 < 100 && wallspeed > 0 { //Reset Speed
			state = states.mach2;
			//movespeed = 8;
		} else if mach2 >= 100 && wallspeed > 0 {
			state = states.mach3;
			sprite_index = spr_mach4;
			//movespeed = 12;
		} else { 
			state = states.jump;
			sprite_index = spr_fall;			
			vsp = -wallspeed;
		}	
		
	}
	//Hit Floor
	if (scr_solid(x, y + 1) && !place_meeting(x, y + 1, obj_metalblock) && !place_meeting(x, y + 1, obj_destructibles)) {
		if scr_slope_ext(x, y + 1) {
			if mach2 < 100 { 
				state = states.mach2;
			} else if mach2 >= 100 {
				state = states.mach3;
				sprite_index = spr_mach4;
			}		
		} else {
			xscale *= -1;
			scr_sound(sound_maximumspeedland);
			image_index = 0;
			state = states.freefallland;
			jumpAnim = 1
			jumpstop = 0
			with (obj_baddie) {
				if bbox_in_camera(view_camera[0]) && grounded {
					vsp = -7;
					hsp = 0;
				}
			}
			with (obj_camera) {
				shake_mag = 10;
				shake_mag_acc = (30 / room_speed);
			}
			combo = 0;
			bounce = 0;
			instance_create(x, y, obj_landcloud);
			freefallstart = 0;
			image_index = 0;
			sprite_index = spr_bodyslamland;
		}
	}
	//Jump out of wall
	if (key_jump && key_attack) {
	    if (mach2 >= 100 ) {
	        mach2 = 100;
	        instance_create(x, y, obj_jumpdust);
	        vsp = -9;
	        sprite_index = spr_crazyrun;
	        state = states.mach3
	    } else {
	        sprite_index = spr_player_mach2jump;
			movespeed = 10;
			mach2 = 35;
	        instance_create(x, y, obj_jumpdust);
	        vsp = -9;
	        state = states.mach2;			
		}
	}
	//Effects and Image Speed
	image_speed = 0.6;
	if (!instance_exists(obj_cloudeffect)) 
		instance_create(x, (y + 43), obj_cloudeffect);	
}