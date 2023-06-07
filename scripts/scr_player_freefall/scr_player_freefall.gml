function scr_player_freefall()
{
	if key_slap2 {
		scr_soundeffect(sfx_machpunch)
		sprite_index = spr_player_slapdash
		state = states.handstandjump
	}
	landAnim = 1
	if (vsp >= 2)
		vsp += 0.5
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_bodyslamstart)
		sprite_index = spr_bodyslamfall
	if anim_end() && sprite_index == spr_shotgunjump1 sprite_index = spr_shotgunjump3	
	move = (key_left + key_right)
	if (!grounded)
    {
		if sprite_index = spr_rockethitwall || move == 0
			hsp = 0
		else {
			hsp = Approach(hsp, move * 7, 0.25)
		}
        if (move != 0)
            xscale = move
    }
    if (vsp > 0)
        freefallsmash += 3
    else if (vsp < 0)
        freefallsmash = 0
	if (freefallsmash >= 10 && (!instance_exists(superslameffectid)))
	{
		with (instance_create(x, y, obj_superslameffect))
		{
			playerid = other.object_index
			other.superslameffectid = id
		}
	}
	if (grounded && (freefallsmash < 10 or (!(place_meeting(x, (y + vsp), obj_metalblock)))) && (!(place_meeting(x, (y + vsp), obj_destructibles))))
	{
		if scr_slope()
		{
			var s = instance_place(x, y + 1, obj_slope)
			var s2 = instance_place(x, y + 1, obj_slopePlatform)
			if s2 != -4
				s = s2
			with s
			{
				other.xscale = (-sign(image_xscale))
				other.state = states.tumble
				other.sprite_index = other.spr_crouchslip
				if (other.freefallsmash > 30)
					other.movespeed = other.storedvsp * 0.6
				else
					other.movespeed = other.storedvsp * 0.45
				with (instance_create(other.x, other.y, obj_jumpdust))
					image_xscale = (-sign(other.image_xscale))
			}
		}
		else
		{
			//trace("trolled")
			scr_soundeffect(sfx_groundpound)
			shake_cam(5, 15 / room_speed)
			if (sprite_index == spr_bombdrop1)
				sprite_index = spr_bombdrop2
			else if (shotgunAnim == 0)
				sprite_index = spr_bodyslamland
			else
				sprite_index = spr_shotgunjump2
			image_index = 0
			state = states.freefallland
			jumpAnim = 1
			jumpstop = 0
			
			if (freefallsmash >= 10)
			{
				with (obj_baddie)
				{
					if (shakestun && grounded && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0 && (!invincible) && groundpound)
					{
						state = states.stun
						if (stunned < 60)
							stunned = 60
						if global.arena_perks.slam stunned = 300
						vsp = -11
						image_xscale *= -1
						hsp = 0
						momentum = 0
					}
				}
				with obj_pizzaball scr_pizzaball_go_to_thrown(0, -10)
				shake_cam(10, 30 / room_speed)
				combo = 0
				bounce = 0
			}
			if global.arena_perks.slam instance_create(x, y, obj_playerexplosion)
			create_particle(x, (y + 3), particle.groundpoundeffect, 0)
			freefallstart = 0
		}
	}
	image_speed = 0.35
	if (sprite_index == spr_bodyslamstart)
		image_speed = 0.4
	if (character == characters.pepperman)
	{
		if (!key_down)
		{
			state = states.jump
			sprite_index = spr_fall
			image_index = 0
		}
	}
	exit;
}

function scr_pizzelle_freefall() { 
	landAnim = 1;

	if wallspeed < 15
		wallspeed = 15;
	wallspeed = clamp(wallspeed + 0.5, 15, 30);

	vsp = wallspeed;
	freefallsmash += (wallspeed / 5);	
	
	move = (key_left + key_right);
	if (!grounded) {
		if sprite_index != spr_rockethitwall
			hsp = (move * movespeed);
		else
			hsp = 0
	    if (move != xscale && momemtum == 1 && movespeed != 0) 
			movespeed -= 0.05;
	    if (movespeed == 0) 
			momemtum = 0;
	    if ((move == 0 && momemtum == 0) || scr_solid((x + hsp), y)) {
	        movespeed = 0;
	        mach2 = 0;
	    }
	    if (move != 0 && movespeed < 7) movespeed += 0.25;
	    if (movespeed > 7) movespeed -= 0.05;
	    if ((scr_solid((x + 1), y) && move == 1) || (scr_solid((x - 1), y) && move == -1)) movespeed = 0;
	    if (dir != xscale) {
	        mach2 = 0;
	        dir = xscale;
	        movespeed = 0;
	    }
	    if (move == (-xscale)) {
	        mach2 = 0;
	        movespeed = 0;
	        momemtum = 0;
	    }
	    if (move != 0) xscale = move;
	}
	if sprite_index != spr_rockethitwall {

		sprite_index = spr_bodyslamfall
		
	}
	if (grounded && (!input_buffer_jump < 8)) && !place_meeting(x, y + 1, obj_destructibles) {
		//Slope Landage
		if scr_slope() && !place_meeting(x, y, obj_dashpad) {
			var s = instance_place(x, y + 1, obj_slope)
			var s2 = instance_place(x, y + 1, obj_slopePlatform)
			if s2 != -4
				s = s2
			with s
			{
				other.xscale = (-sign(image_xscale))
				other.state = states.machroll
				other.sprite_index = other.spr_crouchslip
				if (other.freefallsmash > 10)
					other.movespeed = 10
				else
					other.movespeed = 12
				with (instance_create(other.x, other.y, obj_jumpdust))
					image_xscale = (-other.image_xscale)
			}
		} else {
			scr_soundeffect(sfx_groundpound);
			image_index = 0;
			state = states.freefallland;
			jumpAnim = 1
			jumpstop = 0
			with (obj_baddie) {
				if bbox_in_camera(view_camera[0], 0) && grounded {
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
	image_speed = 0.35;
	if (freefallsmash >= 10 && (!instance_exists(superslameffectid)))
	{
		with (instance_create(x, y, obj_superslameffect))
		{
			playerid = other.object_index
			other.superslameffectid = id
		}
	}
	if (key_attack2) && !grounded && sprite_index != spr_rockethitwall && vsp > 10 && instance_exists(superslameffectid) {		
		if (move != 0) 
			xscale = move;
		movespeed = 10;
		machhitAnim = 0;
		state = states.mach2;
		flash = 1;
		vsp = -7;
		sprite_index = spr_mach2jump;
		with (instance_create(x, y, obj_jumpdust)) image_xscale = other.xscale;
		freefallsmash = 0;
	}
}