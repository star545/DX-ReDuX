var playerid = obj_player1
if sprite_index != spr_pizzaface_dead && sprite_index != spr_pizzaface_stun {
	if global.death_mode {
		var has_time = instance_exists(obj_deathmode) && obj_deathmode.time > 0
		walkspr = has_time ? spr_pizzaface_docile : spr_pizzaface_angry
		if has_time && sprite_index == spr_pizzaface_angry {
			image_index = 0
			sprite_index = spr_pizzaface_todocile
			flash = true
			//with create_debris(x - 10, y - 30, spr_pizzaface_debris2) image_index = 0 
			//with create_debris(x+ 10, y - 30, spr_pizzaface_debris2) image_index = 1
			
			with create_debris(x, y, spr_pizzaface_debris2) image_index = 2
			with create_debris(x + 20, y, spr_pizzaface_debris2) image_index = 3
			with create_debris(x - 20, y, spr_pizzaface_debris2) image_index = 4
			with create_debris(x, y + 30, spr_pizzaface_debris2) image_index = 5
		}
		if !has_time && sprite_index == spr_pizzaface_docile {
			image_index = 0
			sprite_index = spr_pizzaface_toangry
			flash = true
			with create_debris(x, y, spr_pizzaface_debris) image_index = 0 
			with create_debris(x, y + 30, spr_pizzaface_debris) image_index = 1
		}
		if anim_end() && sprite_index == spr_pizzaface_toangry {
			image_index = 0
			sprite_index = spr_pizzaface_angry
			flash = true
		}
		if anim_end() && sprite_index == spr_pizzaface_todocile {
			image_index = 0
			sprite_index = spr_pizzaface_docile
			flash = true
		}
		
		
	} else {
		sprite_index = spr_pizzaface_angry
		walkspr = spr_pizzaface_angry
	}
}

if (flash && alarm[0] <= 0)
	alarm[0] = (0.15 * room_speed)
if (image_alpha >= 1 && playerid.state != states.chainsaw)
{	

		
	
	
	var mvsp = maxspeed + (abs(obj_player1.hsp) / 8)
	var multiplier = 1
	if global.death_mode && instance_exists(obj_deathmode) && obj_deathmode.time > 0 mvsp *= 0.44
	else if global.death_mode && instance_exists(obj_deathmode) && obj_deathmode.time <= 0 mvsp *= 1.75
	var hamkuff_nerf = 0 
	with obj_hamkuff {
		if state = states.blockstance hamkuff_nerf = 1	
	}
	
	if hamkuff_nerf multiplier = 0.2
	else if playerid.state == states.cheesepep || playerid.state == states.cheesepepjump || playerid.state == states.cheesepepstickside || playerid.state == states.cheesepepstick multiplier = 0.75
	
	mvsp *= multiplier
	var turnspd = mvsp / 50
	
	
	if !bbox_in_camera(view_camera[0], 100) {
		mvsp *= 1.75
		turnspd *= 2.5
	}
	var _cutscene = obj_player1.cutscene
	if (playerid.state == states.firemouth && playerid.sprite_index == playerid.spr_firemouthintro) _cutscene = 1
	 // distance_to_object(playerid) >= 1200 ? mvsp / 10 : (mvsp / 50)
	var inradius = point_in_circle(x, y, playerid.x, playerid.y, 250)
	
	var dir = point_direction(x, y, playerid.x + playerid.hsp, playerid.y + playerid.vsp)
	var next_pos = point_direction(x, y, x + hsp, y + vsp)
	
	switch state {
		
		case states.hit:	
			scr_enemy_hit()
		break
		case states.walk:	
		case states.chase:	
		
			if _cutscene {
				mvsp = 0
				turnspd = 0.3	
			}
			
			hsp = Approach(hsp, lengthdir_x(mvsp, dir), turnspd)
			vsp = Approach(vsp, lengthdir_y(mvsp, dir), turnspd)
			if inradius && !end_turn {
				state = states.turning
				saved_angle = dir
				if (saved_angle - 10 <= next_pos && saved_angle + 10 >= next_pos) state = states.chase
			} else if !inradius end_turn = 0
			x += hsp
			y += vsp
		break;
		case states.turning:
			hsp = Approach(hsp, 0, turnspd)
			vsp = Approach(vsp, 0, turnspd)
			if abs(hsp) <= 0 && abs(vsp) <= 0 {
				state = states.chase
				end_turn = 1
			}
			x += hsp
			y += vsp
		break
		case states.grabbed:
			if !global.cheat_pizzagooch state = states.chase
		break
		case states.stun:
			if !global.cheat_pizzagooch state = states.chase
			scr_enemy_stun() 
			if place_meeting_solid(x, y) {
				hsp = lengthdir_x(15, dir)
				vsp = lengthdir_y(15, dir)
				x += hsp
				y += vsp
			} else scr_collision()
				
			
			var a = instance_place(x, y, obj_player)
			with a {
				var bID = other.id
				if (state == states.handstandjump && (global.attackstyle == 0 || bID.object_index == obj_pizzaball) && (ds_list_size(a.local_grab_list) < 1 || (global.arena_perks.final == 2)))
				{
					image_index = 0
					if (!key_up || bID.object_index == obj_pizzaball)
					{
						if (movespeed <= 10 || character == characters.pizzelle)
							sprite_index = spr_haulingstart
						else
							sprite_index = spr_swingding
						if (!grounded)
							vsp = -6
						swingdingendcooldown = 0
						state = states.grab
						
						grabbingenemy = 1
						bID.state = states.grabbed
						bID.grabbedby = a
						if bID.object_index != obj_pizzaball ds_list_add_unique(a.local_grab_list, bID)
						else scr_pizzaball_setgrabbed(bID)
						
					}
					else if key_up
					{
						//if bID.object_index != obj_pizzaball ds_list_add_unique(global.grab_list, bID)
						grabbingenemy = 1
						bID.state = states.grabbed
						bID.grabbedby = a
						sprite_index = spr_piledriver
						vsp = -14
						state = states.superslam
						image_index = 0
						image_speed = 0.35
						if bID.object_index != obj_pizzaball ds_list_add_unique(a.local_grab_list, bID)
						else scr_pizzaball_setgrabbed(bID)
					}
				}
			}
			
		break
	
	}
	


	//trace(_r)
	
	
}
else
	image_alpha = Approach(image_alpha, 1, 0.01)

if (place_meeting(x, y, playerid) && (!playerid.cutscene) && playerid.state != states.actor && (!instance_exists(obj_fadeout)) && (!instance_exists(obj_endlevelfade)) && image_alpha == 1 && !instance_exists(obj_jumpscare) && (state == states.chase || state == states.turning))
{
	if (playerid.state != states.backbreaker && playerid.state != states.parry) || !global.cheat_pizzagooch {
		with (playerid)
		{
			//if other.state == states.chase || other.state == states.turning
			instance_destroy(obj_fadeout)
			instance_destroy(obj_deathmode)
			targetDoor = "A"
			room = timesuproom
			state = states.timesup
			sprite_index = spr_Timesup
			image_index = 0
			//audio_stop_all()
			audio_stop_all()
			scr_soundeffect(mu_timesup)
		}
		instance_destroy()
	}
}

if (maxspeed < 8 && image_alpha == 1)
	maxspeed += 0.005
