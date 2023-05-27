if (room == rm_editor)
	exit;
switch state
{
	case states.idle:
		scr_enemy_idle()
		break
	case states.turn:
		scr_enemy_turn()
		break
	case states.walk:
		sprite_index = spr_meatball_roll
		scr_enemy_walk()
		if grounded movespeed = Approach(movespeed, 1, 0.02)
		image_speed = clamp((movespeed / 20) * 0.7, 0, 0.7)
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
	case states.charge:
		scr_enemy_charge()
		break
	case states.chase:
		scr_enemy_chase()
		break
}

if (state == states.stun && stunned > 100 && birdcreated == 0)
{
	birdcreated = 1
	with (instance_create(x, y, obj_enemybird))
		ID = other.id
}
if state != states.walk image_speed = 0.35
if (state != states.stun)
	birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = (0.15 * room_speed)



if (state == states.walk && grounded && vsp > 2) vsp = -3

if (state != states.grabbed)
	depth = 0
if (state != states.stun)
	thrown = false
if (boundbox == 0)
{
	with (instance_create(x, y, obj_baddiecollisionbox))
	{
		sprite_index = other.sprite_index
		mask_index = other.sprite_index
		baddieID = other.id
		other.boundbox = 1
	}
}
