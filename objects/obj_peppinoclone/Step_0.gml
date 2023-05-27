if (room == rm_editor)
	exit;
targetplayer = instance_nearest(x, y, obj_player)
switch state
{
	case states.idle:
		scr_enemy_idle()
		break
	case states.turn:
		scr_enemy_turn()
		break
	case states.walk:
		if (targetplayer.x > (x - 700) && targetplayer.x < (x + 700) && targetplayer.y < (y + 500) && targetplayer.y > (y - 500))
		{
			if (grounded && x != targetplayer.x)
				image_xscale = sign((targetplayer.x - x))
			if (cooldown > 0)
				cooldown--
			if (targetplayer.x > (x - 100) && targetplayer.x < (x + 100) && (grounded || use_heat()))
			{
				hsp = Approach(hsp, 0, 0.5)
				if (cooldown <= 0)
				{
					state = use_heat() ? states.grabbing : states.punch
					sprite_index = spr_pepclone_attack
					image_index = 0
					shot = 0
					if use_heat() movespeed = 5
				}
			}
			else
				hsp = (image_xscale * 6)
			if (state != states.punch && state != states.grabbing)
			{
				if grounded
				{
					if (hsp != 0)
						sprite_index = walkspr
					else
						sprite_index = idlespr
				}
				else if (sprite_index != spr_player_jump && sprite_index != spr_player_fall)
					sprite_index = spr_player_fall
				else if (sprite_index == spr_player_jump && floor(image_index) == (image_number - 1))
					sprite_index = spr_player_fall
				var inst_front = collision_line(x, (y + 25), (x + (sign(hsp) * 78)), (y + 25), obj_solid, false, true)
				var inst_down = collision_line((x + (sign(hsp) * 16)), y, (x + (sign(hsp) * 16)), (y + 64), obj_solid, false, true)
				var inst_down2 = collision_line((x + (sign(hsp) * 16)), y, (x + (sign(hsp) * 16)), (y + 64), obj_platform, false, true)
				var inst_up = collision_line((x + (sign(hsp) * 96)), (y + 25), (x + (sign(hsp) * 96)), ((y - 78) + 50), obj_platform, false, true)
				if ((((!(place_meeting(x, (y + 1), obj_slope))) && (inst_front != -4 or inst_up != -4)) or (inst_down == -4 && inst_down2 == -4)) && targetplayer.y <= (y + 32) && grounded && state != states.charge)
				{
					vsp = -11
					sprite_index = spr_player_jump
					image_index = 0
				}
			}
		}
		break
	case states.grabbing:
		image_speed = 0.35
		sprite_index = spr_player_suplexdash
		if anim_end() state = states.walk
		movespeed = Approach(movespeed, 10, 0.5)
		hsp = (image_xscale * movespeed)
		if place_meeting(x, y, obj_player1) && !obj_player1.instakillmove && obj_player1.state != states.handstandjump && obj_player1.state != states.hurt && obj_player1.state != states.chainsaw {
			with obj_player1 {
				grabbedby = other.id
				state = states.grabbed
			}
			sprite_index = spr_player_haulingstart
			image_index = 0
			state = states.grab
			
		}
	break
	case states.grab:
		image_speed = 0.35
		if sprite_index == spr_player_haulingjump hsp = Approach(hsp, 0, 0.5)
		if (sprite_index == spr_player_haulingstart && anim_end() && grounded) || (grounded && sprite_index = spr_player_haulingland && anim_end()) {
			vsp = -11
			sprite_index = spr_player_haulingjump
			image_index = 0
		}
		if anim_end() && sprite_index = spr_player_haulingjump {
			state = states.finishingblow
			hsp = (image_xscale * movespeed)
			movespeed = hsp
			state = states.finishingblow
			sprite_index = choose(spr_player_finishingblow1, spr_player_finishingblow2, spr_player_finishingblow3, spr_player_finishingblow4, spr_player_finishingblow5)
			image_index = 0
			scr_soundeffect(sfx_punch)
			scr_soundeffect(sfx_killingblow)
			dir = choose(-1, 1)
			
		}
		if !grounded && sprite_index == spr_player_haulingstart sprite_index = spr_player_haulingfall
		if grounded && vsp > 0 && sprite_index == spr_player_haulingfall { sprite_index = spr_player_haulingland image_index = 0 }
	break
	case states.finishingblow:
		image_speed = 0.35
		if anim_end(4) {
			hsp = Approach(hsp, dir * 10, 0.5)
			if obj_player1.state == states.grabbed {
				vsp = -6
				with obj_player1 {
				repeat (6) create_baddiedebris()
				shake_cam(3)
				instance_create(x, y, obj_parryeffect)
				state = states.thrown
				movespeed = 26
				xscale = (-other.image_xscale)
				}
				
			}
			
			
		}
		else hsp = Approach(hsp, 0, 0.25)
		if anim_end() {
			state = states.walk
			cooldown = 600
			
			
		}
	break
	case states.punch:
		hsp = Approach(hsp, 0, 1)
		if ((!shot) && floor(image_index) > 14)
		{
			shot = 1
			hitboxID = instance_create(x, y, obj_forkhitbox)
			with (hitboxID)
			{
				ID = other.id
				sprite_index = spr_weeniesquire_hitbox
			}
		}
		if (floor(image_index) > 23)
			instance_destroy(hitboxID)
		if (floor(image_index) == (image_number - 1))
		{
			state = states.walk
			instance_destroy(hitboxID)
			cooldown = 100
		}
		break
	case states.underground:
		hsp = 0
		vsp = 0
		//invincible = 1
		if sprite_index != spr_pepclone_form sprite_index = spr_pepclone_hide
		if distance_to_object(obj_player1) < 300 && sprite_index != spr_pepclone_form {
			sprite_index = spr_pepclone_form
			image_index = 0
		}
		if anim_end() && sprite_index == spr_pepclone_form {
			
			state = states.walk	
			//movespeed = 8 
			//rangle = point_direction(x, y, obj_player1.x, obj_player1.y) 
			sprite_index = walkspr
			
		}
	break
	case states.land:
		scr_enemy_land()
		break
	case states.hit:
		scr_enemy_hit()
		break
	case states.stun:
		scr_enemy_stun()
		break
	case states.pizzagoblinthrow:
		scr_pizzagoblin_throw()
		break
	case states.grabbed:
		scr_enemy_grabbed()
		break
	case states.pummel:
		scr_enemy_pummel()
		break
	case states.staggered:
		scr_enemy_staggered()
		break
	case states.rage:
		scr_enemy_rage()
		break
	case states.ghostpossess:
		scr_enemy_ghostpossess()
		break
}

if (state == states.stun && stunned > 100 && birdcreated == 0)
{
	birdcreated = 1
	with (instance_create(x, y, obj_enemybird))
		ID = other.id
}
//if state == states.underground invincible = true
//else invincible = false
if (state != states.stun)
	birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = (0.15 * room_speed)
if (state != states.grabbed)
	depth = 0
if (state != states.stun)
	thrown = false
if (boundbox == 0 && state != states.underground)
{
	with (instance_create(x, y, obj_baddiecollisionbox))
	{
		sprite_index = other.sprite_index
		mask_index = other.sprite_index
		baddieID = other.id
		other.boundbox = 1
	}
}
