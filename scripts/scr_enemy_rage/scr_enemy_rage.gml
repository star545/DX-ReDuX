function scr_enemy_rage()
{
	var targetplayer = instance_nearest(x, y, obj_player)
	switch object_index
	{
		case obj_ghost:
			image_speed = 0.5
			if sprite_index == spr_portrait_heatstart {
				hsp = 0
				vsp = 0
				if anim_end() {
					sprite_index = spr_portrait_heatloop
					image_index = 0
					ragecooldown = 180
				}
			}
			if sprite_index = spr_portrait_heatloop {
				ragedash--
				var dir = point_direction(x, y, obj_player1.x, obj_player1.y)
				hsp = lengthdir_x(5, dir)
				vsp = lengthdir_y(5, dir)
				if ragedash <= 0 {
					sprite_index = spr_portrait_heatend
					image_index = 0
					
				}
					
			}
			if sprite_index == spr_portrait_heatend {
				hsp = Approach(hsp, 0, 0.1)	
				vsp = Approach(vsp, 0, 0.1)	
				if anim_end() {
					state = states.walk
					sprite_index = walkspr
					ragecooldown = 500
					
				}
				
			}
		
		break
		
		case obj_forknight:
			image_speed = 0.6
			if (sprite_index == spr_forknight_ragestart)
			{
				hsp = 0
				if (image_index > (image_number - 1))
				{
					sprite_index = spr_forknight_rageloop
					image_index = 0
				}
			}
			else if (sprite_index == spr_forknight_rageloop)
			{
				hsp = (image_xscale * (4 + (global.baddiespeed - 1)))
				with (instance_place((x + hsp), y, obj_destructibles))
					instance_destroy()
				if bump_wall(hsp)
				{
					state = states.stun
					stunned = 100
					vsp = -8
					hsp = ((-image_xscale) * 5)
				}
			}
			break
		case obj_soldier:
			hsp = 0
			if (!hitboxcreate)
			{
				hitboxcreate = 1
				with (instance_create(x, y, obj_forkhitbox))
				{
					image_xscale = other.image_xscale
					ID = other.id
				}
			}
			if (floor(image_index) == (image_number - 1))
			{
				ragebuffer = 100
				state = states.walk
				sprite_index = walkspr
			}
			break
		case obj_smokingpizzaslice:
			if (floor(image_index) == 12 && (!shot))
			{
				shot = 1
				with (instance_create(x, y, obj_enemybullet))
					image_xscale = other.image_xscale
			}
			if (floor(image_index) == (image_number - 1))
			{
				shot = 0
				sprite_index = spr_pizzaslug_walk
				state = states.walk
				ragecooldown = 100
			}
			break
		case obj_indiancheese:
			ragedash--
			if (ragedash == 0)
			{
				ragecooldown = 200
				ragedash = 50
				shot = 0
				state = states.walk
				sprite_index = walkspr
			}
			if ((!shot) && ragedash < 30)
			{
				shot = 1
				with (instance_create(x, y, obj_arcprojectile))
				{
					image_xscale = other.image_xscale
					hsp = (image_xscale * 6)
					vsp = -8
					elite = other.elite
				}
			}
			break
		case obj_miniufo:
			hsp = 0
			if !instance_exists(beamID) {
				beamID = instance_create(x, y + 65, obj_laserbeam)
				with beamID 
					baddieID = other.id
				
			}
		break
		case obj_cheeseslime:
			if (floor(image_index) > 10)
			{
				hsp = (image_xscale * 8)
				with (instance_create(x, y, obj_baddieragehitbox))
				{
					ID = other.id
					image_xscale = other.image_xscale
				}
			}
			else
				hsp = 0
			if (floor(image_index) == (image_number - 1))
			{
				state = states.walk
				sprite_index = walkspr
			}
			break
		case obj_minijohn:
			hsp = (movespeed * image_xscale)
			if (sprite_index == spr_minijohn_rage1 && floor(image_index) == (image_number - 1))
				sprite_index = spr_minijohn_rage2
			if (grounded && vsp > 0)
			{
				//var targetplayer = obj_player1
				movespeed = 4
				image_xscale = (-(sign((x - targetplayer.x))))
				state = states.chase
				sprite_index = spr_minijohn_charge
			}
			break
		case obj_fencer:
			var thespeed = 0
			if (image_index > 7)
				thespeed = 12
			hsp = (image_xscale * thespeed)
			if (floor(image_index) == (image_number - 1))
			{
				with (instance_create(x, y, obj_forkhitbox))
					ID = other.id
				charging = 1
				state = states.charge
				movespeed = 5
				vsp = -7
				sprite_index = spr_fencer_chargestart
			}
			break
		case obj_ancho:
			hsp = 0
			if (sprite_index == spr_ancho_rage1)
				vsp = 0
			if (sprite_index == spr_ancho_rage2)
				vsp = 10
			if (floor(image_index) == (image_number - 1) && sprite_index == spr_ancho_rage1)
				sprite_index = spr_ancho_rage2
			if (grounded && sprite_index == spr_ancho_rage2)
			{
				shake_cam(10, 30 / room_speed)
				image_index = 0
				sprite_index = spr_ancho_rage3
			}
			if (floor(image_index) == (image_number - 1) && sprite_index == spr_ancho_rage3)
			{
				state = states.walk
				sprite_index = spr_ancho
			}
			break
		case obj_pepgoblin:
			image_speed = 0.5
			if sprite_index == spr_pepgoblin_kickcharge  {
				image_speed = 0.35
				if anim_end(5)
					movespeed -= 0.5
				if anim_end() {
					state = states.walk
					sprite_index = walkspr
					movespeed = 1
					bombreset = 200
				}
				hsp = (image_xscale * movespeed)
				
			
				
			} 
			if sprite_index == spr_pepgoblin_kickchargestart {
				hsp = 0
				if anim_end() {
					with (instance_create(x, y, obj_pepgoblin_kickhitbox))
					{
						baddieID = other.id
						image_xscale = other.image_xscale
					}
					movespeed = 8
					if face_obj(plyr) != 0 image_xscale = face_obj(plyr)
					sprite_index = spr_pepgoblin_kickcharge
					image_index = 0
				}
				
			} 
			
		break
		
		
		case obj_spitcheese:
			ragedash--
			if anim_end(4) && bombreset <= 0
			{
				bombreset = 100
				with (instance_create(x, y, obj_bigspitcheesespike))
				{
					other.ragedash = 50
					hsp = (other.image_xscale * 5)
					vsp = -7
				}
			}
			if anim_end()
			{
				state = states.walk
				bombreset = 100
				sprite_index = spr_spitcheese_idle
			}
			break
		case obj_tank:
			if (sprite_index != spr_tank_chargestart)
			{
				if ((x + hsp) == xprevious)
					slope_buffer--
				else
					slope_buffer = 12
			}
			if (sprite_index == spr_tank_chargestart)
				hsp = 0
			if (sprite_index == spr_tank_charge)
				hsp = (image_xscale * 8)
			if (floor(image_index) == (image_number - 1) && sprite_index == spr_tank_chargestart)
				sprite_index = spr_tank_charge
			with (instance_place((x + hsp), y, obj_destructibles))
				instance_destroy()
			if ((place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!scr_slope())) || slope_buffer <= 0)
			{
				slope_buffer = 8
				state = states.stun
				hsp = ((-image_xscale) * 7)
				vsp = -6
				sprite_index = spr_tank_hitwall
				stunned = 200
				bombreset = 200
			}
			break
		case obj_thug_red:
		case obj_thug_elite:
		case obj_thug_blue:
		case obj_thug_green:
			if ((!shot) && floor(image_index) == 9)
			{
				shot = 1
				with (instance_create((x + (8 * image_xscale)), y, obj_robotknife))
				{
					image_xscale = other.image_xscale
					hsp = (other.image_xscale * 5)
				}
			}
			if (floor(image_index) == (image_number - 1))
			{
				ragecooldown = 100
				state = states.walk
			}
			break
		case obj_coolpineapple:
			if (sprite_index == spr_coolpinea_ragestart)
	        {
	            hsp = 0
	            inv_timer = 0
	            invincible = 0
	            killbyenemy = 1
	            if (floor(image_index) == (image_number - 1))
	            {
	                sprite_index = spr_coolpinea_rage
	                breakdance_movespeed = 15
	                hsp = (breakdance_movespeed * image_xscale)
	            }
		    }
	        else
	        {
	            breakdance_movespeed = Approach(breakdance_movespeed, 0, 0.25)
	            hsp = (image_xscale * breakdance_movespeed)
	            if place_meeting_solid(x + sign(hsp), y)
	            {
	                image_xscale *= -1
	                if (breakdance_movespeed < 3)
	                    breakdance_movespeed = 5
	                hsp = (breakdance_movespeed * image_xscale)
	            }
	            inv_timer = inv_max
	            invincible = 1
	            killbyenemy = 0
	            if (trail_count > 0)
	                trail_count--
	            else
	            {
	                with (create_afterimage(x, y, sprite_index, (image_index - 1)))
	                    image_xscale = other.image_xscale
	                trail_count = trail_max
	            }
	            if (breakdance > 0)
	                breakdance--
	            else
	            {
	                sprite_index = walkspr
	                invincible = 0
	                killbyenemy = 1
					ragecooldown = 120
	                state = states.walk
	                breakdanceinst = -4
	            }
	        }
		break
	}

	if place_meeting(x, (y + 1), obj_railparent)
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		hsp += (_railinst.movespeed * _railinst.dir)
	}
	exit;
}

