if (room == rm_editor)
	exit;
var _att = sprite_index == spr_attack && (floor(image_index) >= 10) && (floor(image_index) < image_number - 10)
targetplayer = instance_nearest(x, y, obj_player)
if (ceiling && (state == states.crouch or state == states.punch))
	grav = 0
else if (ceiling && state != states.crouch && state != states.punch)
	grav = 0.5
switch state
{
	case states.idle:
		scr_enemy_idle()
		break
	case states.turn:
		scr_enemy_turn()
		break
	case states.walk:
		ceiling = 0
		state = states.crouch
		grav = 0.5
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
	case states.punch:
		hidden = 0
		cooldown = 100
		if (sprite_index != spr_attack)
		{
			sprite_index = spr_attack
			image_index = 0
			
		}
		else if _att && !instance_exists(hitboxID) {
			with (instance_create(x, y, obj_forkhitbox))
				{
					visible = false
					sprite_index = other.sprite_index
					other.hitboxID = id
					ID = other.id
				}
		}
		if anim_end()
		{
			image_speed = 0.35
			state = states.crouch
			instance_destroy(hitboxID)
			sprite_index = spr_hidden
		}
		break
	case states.crouch:
		if hidden
		{
			sprite_index = spr_hidden
			if (targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y < (y + 300) && targetplayer.y > (y - 300))
			{
				hidden = 0
				state = states.punch
			}
		}
		else
		{
			sprite_index = spr_hidden
			if (cooldown > 0)
				cooldown--
			else
				state = states.punch
		}
		break
}

if (state == states.stun && stunned > 100 && birdcreated == 0)
{
	birdcreated = 1
	with (instance_create(x, y, obj_enemybird))
		ID = other.id
}
if (state != states.stun)
	birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = (0.15 * room_speed)
if _att
	invincible = 1
else
	invincible = 0
if (state != states.grabbed)
	depth = 0
if (state != states.stun)
	thrown = false
scr_scareenemy()
if boundbox == 0 && !_att
{
	with (instance_create(x, y, obj_baddiecollisionbox))
	{
		sprite_index = other.sprite_index
		mask_index = other.sprite_index
		baddieID = other.id
		other.boundbox = 1
	}
}	
