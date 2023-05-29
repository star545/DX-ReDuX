function Instakill(_xscale = xscale)
{
	if state == states.punch && !grounded {
		vsp = -6
	}
	var bID = other.baddieID
	if (other.baddieID.elitegrab == 0)
	{
		
		var lag = 5
		if state == states.handstandjump || state == states.punch || state = states.chainsawbump
			lag = 10
		bID.grabbedby = 1
		bID.invtime = 25
		scr_soundeffect(sfx_punch)
		if (!other.baddieID.important) {
			global.combotime = 60
			global.heattime = 60
		}
		global.hit += 1
		if state == states.mach3 && sprite_index != spr_mach3hit {
			sprite_index = spr_mach3hit
			image_index = 0
		}
		/* man i HATE this little slice of code this shit Sucks let's remove it - me
		if (state == states.chainsawbump && sprite_index != spr_player_chainsawhit) {
			image_index = 0
			sprite_index = spr_player_chainsawhit
		}
		*/
		if !grounded && state != states.boxxedpepspin && state != states.chainsawpogo && state != states.freefall && (key_jump2 or input_buffer_jump == 0)
		{
			if (state == states.mach3 && fightball == 0)
				sprite_index = spr_mach2jump
			suplexmove = 0
			vsp = -11
		}
		if (state == states.boxxedpepspin)
		{
			if key_jump2
				vsp = -10
			boxxedpepjump = 10
		}
		if (character == characters.pepperman && state == states.freefall)
		{
			vsp = -11
			state = states.jump
			sprite_index = spr_jump
		}
		if (state != states.chainsaw)
		{
			tauntstoredmovespeed = movespeed
			tauntstoredsprite = sprite_index
			tauntstoredstate = state
			tauntstoredvsp = vsp
		}
		if (state == states.handstandjump)
        {
            other.baddieID.thrown = 1
            other.baddieID.kill_throw = 1
            tauntstoredstate = states.jump
            tauntstoredvsp = -5
            jumpAnim = 1
            jumpstop = 1
            if grounded
                sprite_index = spr_player_groundedattack
            else
                sprite_index = spr_player_ungroundedattack
			image_index = irandom(image_number - 1)		
            tauntstoredsprite = spr_player_backflip
			if global.arena_perks.final == 2 {
				with obj_baddie {
					if id != bID && distance_to_object(obj_player1)	< 120 {
						hitLag = lag
						kill_throw = 1
						thrown = 1
						if (elite && global.laps < 4 && object_index != obj_robot && object_index != obj_noisey && object_index != obj_thug_elite) elitehit = 0
						if !important global.style += (2 + global.combo)
						instance_create(x, y, obj_parryeffect)
						with instance_create(x, y, obj_parryeffect) sprite_index = spr_kungfueffect
						alarm[3] = 3
						state = states.hit
						image_xscale = (-_xscale)
						grabbedby = 1
						invtime = 25
						hithsp = (_xscale * (other.movespeed + 2))
						if (abs(hithsp) < 10) hithsp = (_xscale * 10)
						hitvsp = -5
						if global.arena_perks.impact hithsp *= 1.5
						
						if other.state == states.handstandjump && other.key_up {
							hithsp = 0
							hitvsp = -20
							shoulderbashed++
							if shoulderbashed > 1 baddie_destroy_points(id)
			
						}
						
					}
					
					
				}
				
			}
			
			
        }
		if (state == states.chainsawbump && (!global.kungfu))
		{
			sprite_index = spr_player_chainsawhit
			image_index = 0
		}
		
		other.baddieID.hitLag = lag
		other.baddieID.hitX = other.baddieID.x
		other.baddieID.hitY = other.baddieID.y
		other.baddieID.hp -= 1
	
		
		
		
		
		if (other.baddieID.elite && global.laps < 4 && other.baddieID.object_index != obj_robot && bID.object_index != obj_noisey && bID.object_index != obj_thug_elite)
			other.baddieID.elitehit = 0
			
		if bID.elite && !bID.kill_throw {
			bID.elitehit--
			if state == states.chainsawbump { 
				bID.elitehit = 0
				bID.kill_throw = true
			}
			if bID.elitehit > 0	
				baddie_destroy_points(bID)
		}	
			
		if (!other.baddieID.important)
			global.style += (2 + global.combo)
		if (!other.baddieID.elite || other.baddieID.elitehit <= 0) && state != states.handstandjump
			other.baddieID.mach3destroy = 1
		if (!other.baddieID.killprotection && !global.kungfu && (!other.baddieID.elite || other.baddieID.elitehit <= 0) && state != states.handstandjump)
			other.baddieID.instakilled = 1
		
		
		hitLag = lag
		hitX = x
		hitY = y
		instance_create(other.baddieID.x, other.baddieID.y, obj_parryeffect)
		other.baddieID.alarm[3] = 3
		other.baddieID.state = states.hit
		other.baddieID.image_xscale = (-_xscale)
	
		repeat (6) create_baddiedebris()
		shake_cam(3)
		if (state != states.mach2 && state != states.tumble)
		{
			with (instance_create(other.baddieID.x, other.baddieID.y, obj_parryeffect))
				sprite_index = spr_kungfueffect
		}
		
		other.baddieID.hithsp = (_xscale * (movespeed + 2))
		if (abs(other.baddieID.hithsp) < 10)
			other.baddieID.hithsp = (_xscale * 10)
		other.baddieID.hitvsp = -5
		if global.arena_perks.impact {
			bID.kill_throw = 1
			bID.hithsp *= 1.5
			
		}
		
		if bID.object_index == obj_meatball { 
			bID.kill_throw = true
			bID.thrown = true
			bID.image_xscale = _xscale
			bID.movespeed = abs(bID.hithsp)
		}
		
		if state == states.handstandjump && key_up {
			bID.hithsp = 0
			bID.hitvsp = -20
			bID.shoulderbashed++
			if bID.shoulderbashed > 1 baddie_destroy_points(bID)
			
		}
		state = states.chainsaw
		
	}
	else
	{
		other.baddieID.state = states.stun
		other.baddieID.vsp = -4
		other.baddieID.stunned = 40
		scr_hurtplayer(id)
	}
	exit;
}

function InstakillOther(_xscale = image_xscale, lag = 35, bID = baddieID) {
	scr_soundeffect(sfx_punch)
	var og = other.id
	// Baddie Hurt
	bID.grabbedby = 1
	if (bID.elite && global.laps < 4 && bID.object_index != obj_robot) bID.elitehit = 0
	if (!bID.important) {
		global.style += (2 + global.combo)
		global.combotime = 60
		global.heattime = 60	
	}
	bID.mach3destroy = 1
	if (!bID.killprotection && (!bID.elite || bID.elitehit <= 0)) bID.instakilled = 1
	//Hitstun INIT
	bID.hitLag = lag
	bID.hitX = bID.x
	bID.hitY = bID.y
	bID.hp -= 1
	if bID.elite && !bID.kill_throw {
		bID.elitehit--
		if bID.elitehit > 0	
			baddie_destroy_points(bID)
	}	
	bID.invtime = 25
	
	with obj_player {
		hitLag = lag
		hitX = x
		hitY = y
		if (state != states.chainsaw)
		{
			tauntstoredmovespeed = movespeed
			tauntstoredsprite = sprite_index
			tauntstoredstate = state
			tauntstoredvsp = vsp
		}
	}
	// Effects
	instance_create(bID.x, bID.y, obj_parryeffect)
	with instance_create(bID.x, bID.y, obj_parryeffect)
		sprite_index = spr_kungfueffect
	bID.alarm[3] = 3
	
	bID.image_xscale = (-_xscale)
	repeat (6) create_baddiedebris(og.x, og.y)
	shake_cam(3)
	// To Hitstun
	bID.hithsp = (-bID.image_xscale * 6)
	if (abs(bID.hithsp) < 10)
		bID.hithsp = (-bID.image_xscale)
	bID.hitvsp = -5
	bID.state = states.hit
	obj_player1.state = states.chainsaw
	
	
}
function bcb_doHitstun(lag = 10, bID = other.baddieID) {
	
	with obj_player {
		hitLag = lag
		hitX = x
		hitY = y
		if (state != states.chainsaw)
		{
			tauntstoredmovespeed = movespeed
			tauntstoredsprite = sprite_index
			tauntstoredstate = state
			tauntstoredvsp = vsp
		}
	}
	bID.hitLag = lag
	bID.hitX = bID.x
	bID.hitY = bID.y
	//bID.hp -= 1
	bID.invtime = 25
	
	bID.hithsp = (-bID.image_xscale * (abs(hsp) + 2))
	if (abs(bID.hithsp) < 10)
		bID.hithsp = (-bID.image_xscale)
	bID.hitvsp = -5
	bID.state = states.hit
	obj_player1.state = states.chainsaw
}
