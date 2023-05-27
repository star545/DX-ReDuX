function scr_collide_destructibles()
{
	for (var i = 0; i < 2; i++)
	{
		var _obj_player = asset_get_index(concat("obj_player", (i + 1)))
		with (_obj_player)
		{
			
			// Omni-Directional
			
			if (state == states.jump && sprite_index == spr_playerN_noisebombspinjump) || 
			state == states.slipbanan || state == states.rideweenie || state == states.trickjump || 
			state == states.ratmountbounce || (state == states.ghost && ghost_pepper >= 1) || 
			(state == states.pogo && pogochargeactive == 1) || state = states.chainsawpogo || (states.cotton && sprite_index = spr_cotton_drill  && sprite_index = spr_cotton_maxrun  && sprite_index = spr_cotton_attack)
			{
				
				scr_destroy_destructibles(hsp, vsp)
				scr_destroy_destructibles(sign(hsp), sign(vsp))
			}
			
			// Specialty
			
			if (state == states.tumble)
			{
				with (instance_place((x + xscale), y, obj_rollblock))
					instance_destroy()
			}
			if (state == states.mach3 && sprite_index == spr_player_fightball)
			{
				with (instance_place((x + xscale), y, obj_fightballblock))
					instance_destroy()
			}
			if (state == states.ratmountattack && place_meeting((x + hsp), y, obj_gustavodestroyable))
			{
				with (instance_place((x + hsp), y, obj_gustavodestroyable))
				{
					GamepadSetVibration(0, 0.8, 0.8, 0.5)
					instance_destroy()
				}
			}
			
			// Side to Side
			if state == states.trashroll || state == states.boxxedpepspin || ratmount_movespeed > 10 || 
			state == states.ratmountpunch || state == states.ratmounttumble || state == states.punch || state == states.mach2 ||
			state == states.handstandjump || state == states.ratmountattack || state == states.lungeattack || 
			state == states.cheeseball || state == states.bombpepside || state == states.rocket || state == states.shotgundash || 
			state == states.faceplant || state == states.slipnslide || state == states.tacklecharge || sprite_index == spr_barrelroll || 
			state == states.chainsawbump || state == states.flick || state == states.mach3 || state == states.knightpep || state == states.machroll || 
			state == states.knightpepslopes || state == states.knightpepattack || state == states.flick || state == states.tumble || state == states.hookshot || state == states.shoulderbash ||
			(state == states.hurt && thrown == true)  || (states.cotton && sprite_index = spr_cotton_attack && sprite_index = spr_cotton_maxrun)
			{
				
				if ((scr_meeting_destructibles(hsp, 0) || scr_meeting_destructibles(sign(hsp), 0)))
				{
					scr_destroy_destructibles(hsp, 0)
					scr_destroy_destructibles(sign(hsp), 0)
					if (state == states.mach2)
						machpunchAnim = 1
				}
				
			}
			if (state == states.hurt && thrown == true)
			{
				if place_meeting((x - hsp), y, obj_destructibles)
				{
					with (instance_place((x - hsp), y, obj_destructibles))
					{
						GamepadSetVibration(0, 0.8, 0.8, 0.5)
						instance_destroy()
					}
				}
			}
			if (state == states.knightpep || sprite_index == spr_lonegustavo_groundpoundstart || sprite_index == spr_lonegustavo_groundpound || 
			state == states.jetpackjump || state == states.firemouth || state == states.slipbanan || state == states.superslam || state == states.hookshot || 
			(state == states.bombpepup && bombup_dir == 1)) && vsp > 0
			{
				if scr_meeting_destructibles(,1) || scr_meeting_destructibles(,vsp) {
					scr_destroy_destructibles(,vsp)
					scr_destroy_destructibles(,1)
					if (state == states.firemouth || state == states.jetpackjump)
					{
						with (instance_place(x, (y + 1), obj_tntblock))
						{
							GamepadSetVibration(0, 0.8, 0.8, 0.5)
							instance_destroy()
						}
						if (vsp > -11)
							vsp = -11
						jumpstop = 0
					}
					
				}
			}
			var num = instance_place_list(x, (y + 1), obj_destructibleplatform, global.instancelist, 0)
			for (var k = 0; k < num; k++)
			{
				with (ds_list_find_value(global.instancelist, k))
				{
					falling = 1
					if (falling == 1)
						image_speed = 0.35
				}
			}
			ds_list_clear(global.instancelist)
			
			// Upways
			
			if vsp <= 0.5 && (state == states.jump || state == states.mariowalk || state == states.ratmountjump || state == states.mach3 || 
			state == states.mach2 || state == states.antigrav || state == states.pogo || (state == states.bombpepup && bombup_dir == -1) || 
			state == states.punch || state == states.climbwall || state == states.fireass || state == states.Sjump || 
			state == states.cheeseballclimbwall || state == states.mach3 || (state == states.punch && 
			(sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend)))
			{
				var vy = -1
				if (state == states.punch && (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend))
					vy = vsp
				if scr_meeting_destructibles(,vy) || (scr_meeting_destructibles(,vsp) && state == states.Sjump)
				{
					scr_destroy_destructibles(,vy)
					if state == states.Sjump scr_destroy_destructibles(,vsp)
					
					if (state != states.Sjump && state != states.punch && state != states.climbwall)
						vsp = 0
					if (state == states.Sjump)
						vsp = -11
						
				
				}
			}
			
			// Freefall Collision
			
			if (vsp >= 0 && (state == states.freefall || state == states.superslam || state == states.freefallland || state == states.ratmountgroundpound || (state == states.slipbanan && vsp >= 10)))
			{
				
				scr_destroy_destructibles(0, vsp + 2)
				scr_destroy_destructibles(0, vsp)
				if place_meeting_collision(x, y) {
					while place_meeting_collision(x, y)
					y--
				}
			}
			
			// Sideway Metalblock
			var gus_metal = ((state == states.ratmount || state == states.ratmountjump) && abs(hsp) >= 12)
			if (state == states.mach3 || state == states.rocket || state == states.knightpepslopes || state == states.shoulderbash || state == states.flick || gus_metal) scr_destroy_metal(hsp, 0)
			// Allways Metal
			if state == states.ghost && ghost_pepper >= 3 {
				scr_destroy_metal(1)	
				scr_destroy_metal(-1)	
				scr_destroy_metal(,1)	
				scr_destroy_metal(,-1)	
				
			}
			
			
			// Freefall Metalblock
			if ((state == states.freefall || state == states.freefallland || (state == states.ratmountgroundpound && obj_player1.brick)) && freefallsmash >= 10) || state == states.slipbanan || state == states.knightpep scr_destroy_metal(,1)
			/*
			if (state == states.crouchslide || state == states.machroll || state == states.mach2 || state == states.punch)
			{
				with (obj_destructibles)
				{
					if place_meeting((x - _obj_player.hsp), y, _obj_player)
					{
						var _destroyed = 0
						with (_obj_player)
						{
							if (place_meeting((x + hsp), y, obj_bigdestructibles) && state != states.crouchslide && state != states.mach2 && state != states.machroll)
							{
								state = states.finishingblow
								sprite_index = spr_player_lungehit
								image_index = 0
								instance_destroy(other)
								_destroyed = 1
							}
							else if (other.object_index != obj_bigdestructibles)
							{
								instance_destroy(other)
								_destroyed = 1
							}
							if (_destroyed && state == states.lungeattack)
								hit_connected = 1
						}
					}
				}
			}
			*/
		}
	}
}
