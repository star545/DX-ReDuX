function scr_player_mach2()
{
	if (windingAnim < 2000)
		windingAnim++
	if global.arena_perks.pepper  && !skateboarding && grounded{
		movespeed = 14
			
	}
		
	if place_meeting(x, (y + 1), obj_railparent)
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		railmovespeed = _railinst.movespeed
		raildir = _railinst.dir
	}
	hsp = ((xscale * movespeed) + (railmovespeed * raildir))
	move2 = (key_right2 + key_left2)
	move = (key_right + key_left)
	crouchslideAnim = 1
	if ((!key_jump2) && jumpstop == 0 && vsp < 0.5)
	{
		vsp /= 20
		jumpstop = 1
	}
	if (grounded && vsp > 0)
		jumpstop = 0
	if (input_buffer_jump < 8 && grounded && sprite_index != spr_secondjump1 && sprite_index != spr_clownjump && move != -xscale)
	{
		image_index = 0
		sprite_index = spr_secondjump1
		scr_soundeffect(sfx_jump)
		if skateboarding
			sprite_index = spr_clownjump
		vsp = -11
		if global.arena_perks.flight vsp = -15
	}
	var mortjump = 0
	if (key_jump && global.mort == 1 && sprite_index != spr_mortdoublejump && (!grounded) && (!skateboarding))
	{
		state = states.jump
		repeat (6)
			create_debris(x, y, spr_feather)
		scr_soundeffect(sfx_woosh)
		sprite_index = spr_mortdoublejump
		image_index = 0
		grav = 0.25
		with (instance_create(x, y, obj_highjumpcloud2))
			image_xscale = other.xscale
		mort = 1
		mortjump = 1
	}
	if (grounded && vsp > 0)
	{
		if (machpunchAnim == 0 && sprite_index != spr_mach && sprite_index != spr_mach1 && sprite_index != spr_mach4 && sprite_index != spr_player_machhit)
		{
			if (sprite_index != spr_player_machhit && sprite_index != spr_rollgetup && sprite_index != spr_suplexdash && sprite_index != spr_taunt && ((sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_pizzelle_Sjumpcancel) && sprite_index != spr_pizzelle_Sjumpcancel))
				sprite_index = spr_mach
		}
		if (machpunchAnim == 1)
		{
			if (punch == 0)
				sprite_index = spr_machpunch1
			if (punch == 1)
				sprite_index = spr_machpunch2
			if (floor(image_index) == 4 && sprite_index == spr_machpunch1)
			{
				punch = 1
				machpunchAnim = 0
			}
			if (floor(image_index) == 4 && sprite_index == spr_machpunch2)
			{
				punch = 0
				machpunchAnim = 0
			}
		}
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_mach1)
		sprite_index = spr_mach
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_longjump)
		sprite_index = spr_player_longjumpend
	if (!grounded)
		machpunchAnim = 0
	if grounded
	{
		if (scr_slope() && hsp != 0 && movespeed > 8 && movespeed < 24)
			scr_player_addslopemomentum(skateboarding ? 0.35 : 0.1, 0)
		if (movespeed < 12)
		{
			if (mach4mode == 0)
				movespeed += 0.1
			else
				movespeed += 0.2
		}
		if (abs(hsp) >= 12 && skateboarding == 0 && sprite_index != spr_suplexdash)
		{
			machhitAnim = 0
			state = states.mach3
			flash = 1
			if (sprite_index != spr_rollgetup)
				sprite_index = spr_mach4
			particle_set_scale(particle.jumpdust, xscale, 1)
			create_particle(x, y, particle.jumpdust, 0)
		}
	}
	if key_jump
		input_buffer_jump = 0
		
	if ((!instance_exists(dashcloudid)) && grounded)
	{
		with (instance_create(x, y, obj_dashcloud))
		{
			image_xscale = other.xscale
			other.dashcloudid = id
		}
	}
	if (grounded && floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup or sprite_index == spr_trickramp))
		sprite_index = spr_mach
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_suplexdash)
		sprite_index = spr_mach
	if ((!grounded) && sprite_index != spr_secondjump2 && sprite_index != spr_clownjump && sprite_index != spr_clownfall && sprite_index != spr_mach2jump && sprite_index != spr_mach2jump && sprite_index != spr_walljumpstart && sprite_index != spr_taunt && (sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_pizzelle_Sjumpcancel) && sprite_index != spr_walljumpend && sprite_index != spr_player_longjump && sprite_index != spr_player_longjumpend)
	{
		sprite_index = spr_secondjump1
		if skateboarding
			sprite_index = spr_clownfall
	}
	if (skateboarding && sprite_index != spr_clownjump && grounded && !key_down)
		sprite_index = spr_clown
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_secondjump1)
		sprite_index = spr_secondjump2
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_walljumpstart)
		sprite_index = spr_walljumpend
	if ((!grounded) && sprite_index != spr_clownfall && sprite_index == spr_clownjump && floor(image_index) == (image_number - 1))
		sprite_index = spr_clownfall
	if (key_down && (!(place_meeting(x, y, obj_dashpad))))
	{
		
		
		
		vsp = 10
		if !skateboarding {
			particle_set_scale(particle.jumpdust, xscale, 1)
			create_particle(x, y, particle.jumpdust, 0)
			flash = 0
			state = states.tumble
			image_index = 0
			if (!grounded)
				sprite_index = spr_dive
			else {
				sprite_index = spr_machroll
				if (character == characters.vigilante)
					sprite_index = spr_playerV_divekickstart	
			}
		} else if grounded && sprite_index != spr_clowncrouch {
			sprite_index = spr_clowncrouch
			//particle_set_scale(particle.jumpdust, xscale, 1)
			//create_particle(x, y, particle.jumpdust, 0)
			flash = 0
		}
		else if !grounded {
			vsp  =	20
			sprite_index = spr_clownfall
			//particle_set_scale(particle.jumpdust, xscale, 1)
			//create_particle(x, y, particle.jumpdust, 0)
			flash = 0
			
		}
		
			
		
	}
	if bump_wall(hsp)
	{
		if (!grounded || groundedSlope) {
			wallspeed = movespeed
			state = states.climbwall	
		}

		else
		{
			var _bump = ledge_bump((vsp >= 0 ? 32 : 22))
			if _bump
			{
				if skateboarding
					xscale *= -1
				else {
					state = states.bump
					image_index = 0
					sprite_index = spr_wallsplat
				}
			}
		}
	}
	if (((!key_attack) && sprite_index != spr_playerS_spindash && movespeed >= 8 && grounded && skateboarding == 0))
	{
		image_index = 0
		state = states.machslide
		scr_soundeffect(sfx_break)
		sprite_index = spr_machslidestart
	}
	else if ((!key_attack) && movespeed < 8 && grounded && skateboarding == 0)
		state = states.normal
	if !key_attack && if_char(characters.noise) && grounded && move == xscale
		state = states.normal
	if (move == (-xscale) && movespeed >= 8 && grounded)
	{
		scr_soundeffect(sfx_machslideboost)
		image_index = 0
		state = states.machslide
		sprite_index = spr_machslideboost
		if skateboarding sprite_index = spr_clownturn
	}
	else if (move == (-xscale) && movespeed < 8 && grounded && skateboarding == 0)
	{
		xscale *= -1
		movespeed = 6
	}

	
	if (sprite_index == spr_rollgetup or sprite_index == spr_suplexdash)
		image_speed = 0.4
	else
		image_speed = (abs(movespeed) / 15)
	
	
	if mortjump
		sprite_index = spr_player_mortjumpstart
	if !skateboarding {	
		scr_dograb()
		scr_dotaunt()
		if (key_shoot2)
			scr_shotgunshoot()
		if (key_up && fightball == 0 && grounded && global.arena_perks.flight)
		{
			sprite_index = spr_superjumpprep
			state = states.Sjumpprep
			//	nerfed_sjump = true
			hsp = 0
			image_index = 0
		}	
		if if_char(characters.jetpack_noise) && grounded state = states.pogo
	}
	exit;
}

function scr_pizelle_mach2() {
	if (windingAnim < 2000)
	    windingAnim++;
	if place_meeting(x, (y + 1), obj_railparent)
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		railmovespeed = _railinst.movespeed
		raildir = _railinst.dir
	}
	hsp = ((xscale * movespeed) + (railmovespeed * raildir))
	move2 = (key_right2 + key_left2);
	move = (key_right + key_left);
	crouchslideAnim = 1;
	do_jumpstop(2)
	if key_jump && sprite_index != spr_playerS_spindash && grounded && move != -xscale && (key_attack || skateboarding) {
		image_index = 0;
		sprite_index = spr_secondjump1;
		vsp = -9;
		if global.arena_perks.flight vsp = -12
		scr_soundeffect(sfx_jump)
	}
	if grounded {
		if (machpunchAnim == 0 && sprite_index != spr_mach && sprite_index != spr_player_mach3 && sprite_index != spr_player_machhit && sprite_index != spr_player_machhit && sprite_index != spr_player_rollgetup) sprite_index = spr_mach;
		if (machpunchAnim == 1) {	
			if (punch == 0) && sprite_index != spr_machpunch1 {
				sprite_index = spr_machpunch1;
				image_index = 0;
			}
			if (punch == 1) && sprite_index != spr_machpunch2 {
				sprite_index = spr_machpunch2;
				image_index = 0;
			}
					
			if anim_end() {
			    punch = !punch;
			    machpunchAnim = 0;
			}
					
		}
	}
	if (!grounded) machpunchAnim = 0;
				
	if (mach2 < 100) 
		mach2 += 1.5;
				
	if (mach2 >= 100) && grounded {
		machhitAnim = 0;
		state = states.mach3;
		flash = 1;
		sprite_index = spr_mach4;
		instance_create(x, y, obj_jumpdust);
		if (movespeed < 12) movespeed = 12;
	}
	if ((!key_attack) && grounded) {
		//alarm[0] = 240;
		scr_soundeffect(sfx_break);
		sprite_index = spr_machslidestart;
		state = states.machslide;
		image_index = 0;
		mach2 = 0;
	}
	if (move == -xscale && grounded) {
		scr_soundeffect(sfx_machslideboost);
		sprite_index = spr_machslideboost;
		state = states.machslide;
		image_index = 0;
		mach2 = 35;
	}
	if (key_down2 && grounded) {
		sprite_index = spr_crouchslip;
		machhitAnim = 0;
		state = states.tumble;
	}
	//if (!grounded && (place_meeting_collision(x + hsp, y, Exclude.SLOPES) || place_meeting_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles)) || (grounded && place_meeting(x + sign(hsp), y - 16, Exclude.SLOPES) && place_meeting_slope(x + sign(hsp), y) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_metalblock) && groundedSlope
	
	if (!grounded && (place_meeting_collision(x + hsp, y, Exclude.SLOPES) || place_meeting_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles)) || (grounded && (place_meeting_collision(x + sign(hsp), y - 16, Exclude.SLOPES) || place_meeting_slope(x + sign(hsp), y - 16)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_metalblock) && groundedSlope)
	{
		wallspeed = movespeed

		state = states.climbwall
	}
	else if scr_solid(x + xscale, y) && !place_meeting(x + xscale, y, obj_destructibles) {
	    movespeed = 0
	    state = states.normal
	}
	
	if ((!instance_exists(obj_dashcloud)) && grounded) 
		with instance_create(x, y, obj_dashcloud) {
			sprite_index = spr_dashcloud2;
		}
	if ((!grounded) && sprite_index != spr_secondjump2 && sprite_index != spr_mach2jump && sprite_index != spr_playerS_spindash) && sprite_index != spr_null && sprite_index != spr_player_bump
		sprite_index = spr_secondjump1;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_secondjump1)
		sprite_index = spr_secondjump2;
	if (grounded && ((floor(image_index) == (image_number - 1)) && (sprite_index == spr_player_rollgetup)))
		sprite_index = spr_mach;
	scr_dotaunt()
	/*if key_shoot2
	{
		vsp = -4
		sprite_index = spr_player_pistolair
		state = states.pistol
		image_index = 0
		shoot = 1
	}*/
	if (sprite_index == spr_player_rollgetup) image_speed = 0.4;
	else image_speed = 0.65;
	if character == characters.jetpack_noise && grounded state = states.pogo

	scr_dograb()


	
}
