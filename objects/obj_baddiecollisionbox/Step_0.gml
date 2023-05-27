if ((!instance_exists(baddieID)) && room != custom_lvl_room)
	instance_destroy()
	
if instance_exists(baddieID)
{
	
	x = baddieID.x
	y = baddieID.y
	image_xscale = baddieID.image_xscale
	if baddieID.object_index == obj_fakepeplimb {
		with baddieID {
			var _att = sprite_index == spr_attack && (floor(image_index) >= 10) && (floor(image_index) < image_number - 10)
			if _att {
				instance_destroy(other.id)
				boundbox = 0
			}
		}
		
	}
	
	

	
}
for (var i = 0; i < 2; i++)
{
	var _obj_player = asset_get_index(concat("obj_player", (i + 1)))
	var _playerindex = (i + 1)
	if (instance_exists(baddieID) && place_meeting(x, y, _obj_player) && _obj_player.cutscene == 0)
	{
		var bID = baddieID
		if (baddieID.state != states.grabbed && baddieID.state != states.hit && (!baddieID.invincible) && baddieID.state != states.ghostpossess)
		{
			with (_obj_player)
			{
				
				var _x = xscale
				if isgustavo && sign(hsp) != 0
					_x = sign(hsp)
				if instance_exists(bID) && y < other.baddieID.y && substate == states.mariojump && state == states.mariowalk && vsp > 0 {
					instance_destroy(bID)
					vsp = -4.1 * 2
					jumpstop = false
					scr_soundeffect(sfx_mariokill)
					
				}
				if (instance_exists(other.baddieID) && y < other.baddieID.y && attacking == 0 && (!global.kungfu) && sprite_index != spr_player_mach2jump && ((state == states.boots && vsp > 0) or state == states.jump or state == states.mach1 or state == states.grab) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep && (!other.baddieID.invincible))
				{
					scr_soundeffect(sfx_stompenemy)
					image_index = 0
					if (other.baddieID.object_index != obj_tank)
					{
						if (x != other.baddieID.x)
							other.baddieID.image_xscale = (-(sign((other.baddieID.x - x))))
						other.baddieID.hsp = (xscale * 5)
						other.baddieID.vsp = -5
						other.baddieID.state = states.stun
						if (other.baddieID.stunned < 100)
							other.baddieID.stunned = 100
						other.baddieID.xscale = 1.4
						other.baddieID.yscale = 0.6
					}
					if (other.baddieID.object_index == obj_pizzaball)
					{
						with (other.baddieID)
						{
							scr_pizzaball_go_to_thrown(0, -5, 0)
							vsp = 5
						}
					} else if global.arena_perks.flight Instakill(_x)
					if key_jump2
					{
						instance_create(x, (y + 50), obj_stompeffect)
						stompAnim = 1
						vsp = -14
						if (state == states.jump)
							sprite_index = spr_stompprep
					}
					else
					{
						instance_create(x, (y + 50), obj_stompeffect)
						stompAnim = 1
						vsp = -9
						if (state == states.jump)
							sprite_index = spr_stompprep
					}
				}
				if (instance_exists(other.baddieID) && state == states.lungegrab)
				{
					other.baddieID.grabbedby = _playerindex
					other.baddieID.state = states.grabbed
					other.baddieID.hp = -99
					if key_down
					{
						sprite_index = spr_piledriver
						vsp = -5
						state = states.superslam
						image_index = 0
						image_speed = 0.35
					}
					else
					{
						sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5)
						image_index = 0
						hsp = 0
						movespeed = 0
						state = states.finishingblow
					}
				}
				if (instance_exists(other.baddieID) && other.baddieID.state != states.ratgrabbed && (!other.baddieID.invincible) && state == states.ratmountattack)
				{
					other.baddieID.ratplayerid = id
					other.baddieID.state = states.ratgrabbed
					ratgrabbedID = other.baddieID.id
					state = states.ratmount
				}
				if (instance_exists(other.baddieID) && other.baddieID.invtime == 0 && ((other.baddieID.object_index != obj_bigcheese && other.baddieID.object_index != obj_pepbat) or state != states.tumble) && ((state == states.handstandjump && global.attackstyle == 1 && bID.object_index != obj_pizzaball) or instakillmove == 1) && other.baddieID.state != states.grabbed && (!other.baddieID.invincible) && other.baddieID.instantkillable) {
					
					Instakill(_x)
					
				}
				else if (state == states.handstandjump && (global.attackstyle == 0 || bID.object_index == obj_pizzaball) && (ds_list_size(_obj_player.local_grab_list) < 1 || (global.arena_perks.final == 2)))
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
						other.baddieID.state = states.grabbed
						other.baddieID.grabbedby = _obj_player
						if bID.object_index != obj_pizzaball ds_list_add_unique(_obj_player.local_grab_list, bID)
						else scr_pizzaball_setgrabbed(bID)
						
					}
					else if key_up
					{
						//if bID.object_index != obj_pizzaball ds_list_add_unique(global.grab_list, bID)
						grabbingenemy = 1
						other.baddieID.state = states.grabbed
						other.baddieID.grabbedby = _obj_player
						sprite_index = spr_piledriver
						vsp = -14
						state = states.superslam
						image_index = 0
						image_speed = 0.35
						if bID.object_index != obj_pizzaball ds_list_add_unique(_obj_player.local_grab_list, bID)
						else scr_pizzaball_setgrabbed(bID)
					}
				}
				else if ((state == states.handstandjump || state == states.lungeattack) && sprite_index != spr_player_backflip && global.attackstyle == 2 && bID.state != states.lungeattack && bID.lunged = false)
				{
					scr_soundeffect(sfx_killingblow)
					bID.state = states.lungeattack
					bID.image_xscale = -xscale
					bID.lungeHP--
					bID.lunged = true
					trace("Lungeattack1")	
					//lungebaddieID = bID
					state = states.lungeattack
					if sprite_index != spr_player_pummel_kick && sprite_index != spr_player_lungehit sprite_index = spr_player_suplexmash1
					image_index = 0
					lunge_hits++
					
					bcb_doHitstun(10, bID)
					
				}
				if (place_meeting(x, (y + 1), other) && state == states.pogo && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_playerN_pogobounce && (!other.baddieID.invincible))
				{
					switch pogochargeactive
					{
						case 0:
							pogospeedprev = 0
							other.baddieID.vsp = -3
							scr_soundeffect(sfx_stompenemy)
							other.baddieID.state = states.stun
							if (other.baddieID.stunned < 100)
								other.baddieID.stunned = 100
							sprite_index = spr_playerN_pogobounce
							break
						case 1:
							pogospeedprev = 0
							scr_throwenemy()
							sprite_index = spr_playerN_pogobouncemach
							break
					}

					instance_create(x, (y + 50), obj_stompeffect)
					image_index = 0
					movespeed = 0
					vsp = 0
				}
				var pepp_grab = 0
				if (character == characters.pepperman && instance_exists(other.baddieID) && (state == states.normal or state == states.jump) && pepperman_grabID == -4 && sprite_index != spr_pepperman_throw && other.baddieID.state == states.stun && other.baddieID.stuntouchbuffer == 0 && (!other.baddieID.thrown) && (!other.baddieID.invincible))
				{
					other.baddieID.pepperman_grab = 1
					pepperman_grabID = other.baddieID.id
					other.baddieID.state = states.grabbed
					other.baddieID.grabbedby = _playerindex
					pepp_grab = 1
				}
				if (instance_exists(other.baddieID) && other.baddieID.object_index != obj_bigcheese && (state == states.tumble or state == states.mach2) && other.baddieID.state != states.punch && other.baddieID.state != states.hit && (!pepp_grab) && other.baddieID.thrown == false && other.baddieID.stuntouchbuffer <= 0 && other.baddieID.state != states.grabbed && other.baddieID.state != states.chainsawbump && other.baddieID.state != states.chainsaw && (!other.baddieID.invincible))
				{
					var lag = 0
					other.baddieID.stuntouchbuffer = 15
					with (other.baddieID)
					{
						xscale = 0.8
						yscale = 1.3
						instance_create(x, y, obj_bangeffect)
						state = states.hit
						image_xscale = (-other.xscale)
						hithsp = (other.xscale * 12)
						hitvsp = (((other.y - 180) - y) / 60)
						trace([hithsp, hitvsp])
						hitLag = lag
						hitX = x
						hitY = y
						invtime = (lag + 5)
						flash = 1
					}
					tauntstoredstate = state
					tauntstoredsprite = sprite_index
					tauntstoredmovespeed = movespeed
					tauntstoredvsp = vsp
					state = states.chainsaw
					hitLag = lag
					hitX = x
					hitY = y
					repeat (2)
					{
						with (create_debris(x, y, spr_slapstar))
							vsp = irandom_range(-6, -11)
					}
				}
				if (instance_exists(other.baddieID) && state == states.grabbing && (!other.baddieID.invincible))
				{
					if (instance_exists(other.baddieID) && y < (other.baddieID.y - 50) && attacking == 0 && state != states.handstandjump && other.baddieID.state != states.grabbed && sprite_index != spr_player_mach2jump && (state == states.jump or state == states.mach1 or (state == states.grab && sprite_index != spr_swingding)) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep && (!other.baddieID.invincible) && other.baddieID.object_index != obj_ghostknight)
					{
						scr_soundeffect(sfx_stompenemy)
						if (x != other.baddieID.x)
							other.baddieID.image_xscale = (-(sign((other.baddieID.x - x))))
						image_index = 0
						other.baddieID.state = states.stun
						if (other.baddieID.stunned < 100)
							other.baddieID.stunned = 100
						if key_jump2
						{
							instance_create(x, (y + 50), obj_stompeffect)
							stompAnim = 1
							other.baddieID.image_index = 0
							vsp = -14
							if (state != states.grab)
								sprite_index = spr_stompprep
						}
						else
						{
							instance_create(x, (y + 50), obj_stompeffect)
							stompAnim = 1
							other.baddieID.image_index = 0
							vsp = -9
							if (state != states.grab)
								sprite_index = spr_stompprep
						}
					}
					if (other.baddieID.thrown == false)
					{
						movespeed = 0
						image_index = 0
						sprite_index = spr_haulingstart
						state = states.grab
						other.baddieID.state = states.grabbed
						other.baddieID.grabbedby = _playerindex
					}
				}
			}
		}
	}
}
