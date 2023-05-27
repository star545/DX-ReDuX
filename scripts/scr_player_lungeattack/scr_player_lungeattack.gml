
function scr_player_lungeattack() //gml_Script_scr_player_lungeattack
{	
	scr_dograb()
	var bID = -4
	if sprite_index != spr_player_pummel_kick vsp = 0
	
    move = (key_left + key_right)
	hsp = xscale * movespeed
	
	if anim_end() image_speed = 0
	else image_speed = 0.35
	
	if sprite_index = spr_player_pummel_kick {
		movespeed = Approach(movespeed, (move * 8) * xscale, 0.5)
		if grounded
			state = states.mach2
		
	}
	else if input_attack_buffer <= 0 
		state = states.mach2
	if key_slap && input_attack_buffer < 25 input_attack_buffer = 40
	if key_slap2 input_attack_buffer = 25
	baddie_pummel()
	
	
	if input_attack_buffer <= 0 && sprite_index != spr_player_pummel_kick {
		state = states.normal	
	}

    return;
}

function randomize_animations(argument0) //gml_Script_randomize_animations
{
    if (ds_list_size(animlist) >= array_length(argument0))
        ds_list_clear(animlist)
    sprite_index = argument0[irandom((array_length(argument0) - 1))]
    while (ds_list_find_index(animlist, sprite_index) != -1)
        sprite_index = argument0[irandom((array_length(argument0) - 1))]
    ds_list_add(animlist, sprite_index)
    return;
}

function baddie_pummel() {
	if input_attack_buffer == 25 && sprite_index != spr_player_pummel_kick {
		input_attack_buffer = 15
		
		if sprite_index = spr_player_lungehit sprite_index = spr_player_pummel_kick	
		if sprite_index = spr_player_suplexmash1 sprite_index = spr_player_lungehit
		DoFinisher()
		var set_throw = sprite_index == spr_player_pummel_kick
		scr_soundeffect(sfx_killingblow)
		image_index = 0	
		trace("Lungeattack2")
		with obj_baddie {
			var bID = id
			var p = other.id
			
			if lunged {
				lungeHP--
				flash = true
				with (instance_create(bID.x, bID.y, obj_parryeffect))
					sprite_index = spr_kungfueffect
					
				trace("hit!")
				if bID.elite {
					bID.elitehit--
					if bID.elitehit > 0	
						baddie_destroy_points(bID)	
					
				}
				if global.arena_perks.final == 2 {
					repeat(2) {
						with instance_create(x, y, obj_hurtbaddiegibs) {
							hsp = (obj_player1.xscale * 24) + irandom_range(-4, 4)
						}
					}
				}
				state = states.lungeattack
				image_xscale = -obj_player1.xscale
				if set_throw {
					trace("thrown?")
					thrown = true
					linethrown = true
					kill_throw = true
					lunge_throw = true
					lunged = false
					hsp = image_xscale * -25
					hithsp = image_xscale * -25
					vsp = 0
					state = states.stun
					obj_player1.vsp = -6
				}
				if (!bID.important) {
					global.style += 2
					global.combotime += 10
					global.heattime += 10
						
				}
				with obj_player1 {
					lunge_hits++
					var lag = 5
					if set_throw lag = 15
					repeat (6) create_baddiedebris()
					var redo_lunge = 0
					if bID.state == states.lungeattack redo_lunge = 1
					if set_throw bcb_doHitstun(lag, bID)
					if redo_lunge bID.state = states.lungeattack
						
				}
				shake_cam(3)
				if set_throw {
					hithsp = image_xscale * -25	
				}
				hitX = (obj_player1.x + (obj_player1.xscale * 30))
				hitY = obj_player1.y
			}
			
		}	
	}
	
	
}




function DoFinisher() //gml_Script_DoFinisher
{
	var move2 = (key_left + key_right)
	if finisher {
		if key_up
	    {
	        state = states.punch
	        image_index = 0
	        sprite_index = spr_uppercut
	        vsp = -16
	        movespeed = hsp
			particle_set_scale(particle.highjumpcloud2, xscale, 1)
	        create_particle(x, y, particle.highjumpcloud2, 0)
	        lunge_hits = 0
	        finisher = 0
	    }
	    else if (key_down)
	    {
	        state = states.punch
	        sprite_index = spr_player_breakdancesuper
	        image_index = 0
	        movespeed = 8
	        with (instance_create(x, y, obj_superdashcloud))
	            image_xscale = other.xscale
	        particle_set_scale(particle.crazyrunothereffect, xscale, 1)
	        create_particle(x, y, particle.crazyrunothereffect, 0)
	        lunge_hits = 0
	        finisher = 0
	    }
		
	    else if move2 = xscale {
			sprite_index = spr_faceplant;
			image_index = 0;
			image_speed = 0.2;
			state = states.faceplant;		
		    with (instance_create(x, y, obj_jumpdust))
		        image_xscale = other.xscale;	
			
		}
		
		
	} else {
		input_attack_buffer = 15
		if sprite_index = spr_player_lungehit {
			sprite_index = spr_player_pummel_kick	
		}
		if sprite_index = spr_player_suplexmash1
			sprite_index = spr_player_lungehit
		var set_throw = sprite_index == spr_player_pummel_kick
		image_index = 0	
		trace("Lungeattack2")
		with obj_baddiecollisionbox {
			var bID = baddieID
			with baddieID {
				if lunged {
					lungeHP--
					trace("hit!")
					scr_soundeffect(sfx_killingblow)
					state = states.lungeattack
					image_xscale = -obj_player1.xscale
					if set_throw {
						trace("thrown?")
						thrown = true
						linethrown = true
						lunge_throw = true
						lunged = false
						hsp = image_xscale * -25
						vsp = 0
						state = states.stun
						obj_player1.vsp = -6
	
					}
					with obj_player1
						
						bcb_doHitstun(5, bID)
					if set_throw {
						hithsp = image_xscale * -25	
					}
					hitX = (obj_player1.x + (obj_player1.xscale * 30))
					hitY = obj_player1.y
					
					
				}
			}
		}
	}
    input_finisher_buffer = 0
    input_up_buffer = 0
    input_down_buffer = 0
    hit_connected = 0
    if (move == xscale)
    {
        state = 80
        sprite_index = spr_player_breakdance
        image_index = 0
        movespeed = 10
        with (instance_create(x, y, obj_superdashcloud))
            image_xscale = other.xscale
        particle_set_scale(2, xscale, 1)
        create_particle(x, y, 2, 0)
        lunge_hits = 0
        finisher = 0
    }
    else if key_down
    {
        sprite_index = spr_player_breakdancesmash
        image_index = 0
        machhitAnim = 0
        state = 80
        movespeed = 0
        vsp = 15
        lunge_hits = 0
        finisher = 0
        with (obj_baddie)
        {
            if (distance_to_object(other) < 128 && state != 137 && state != 4 && state != 138 && parryable && (!((state == 138 && thrown == 1))))
            {
                obj_player1.xscale = (-image_xscale)
                grabbedby = 1
                hitLag = 5
                hitX = x
                hitY = y
                if (!important)
                {
                    global.combotime = 60
                    global.heattime = 60
                }
                obj_player1.hitLag = 5
                obj_player1.hitX = obj_player1.x
                obj_player1.hitY = obj_player1.y
                mach3destroy = 1
                alarm[3] = 1
                state = 137
                image_xscale = (-obj_player1.xscale)
                instance_create(x, y, obj_slapstar)
                instance_create(x, y, obj_slapstar)
                instance_create(x, y, obj_slapstar)
                instance_create(x, y, obj_baddiegibs)
                instance_create(x, y, obj_baddiegibs)
                instance_create(x, y, obj_baddiegibs)
                with (obj_camera)
                {
                    shake_mag = 3
                    shake_mag_acc = (3 / room_speed)
                }
                stunned = 100
                other.hithsp = ((-other.image_xscale) * 6)
                other.hsp = ((-other.image_xscale) * 6)
                if (!other.grounded)
                {
                    other.vsp = -6
                    other.hitvsp = -6
                }
            }
        }
        return;
    }
}

