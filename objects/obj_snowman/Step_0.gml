switch state
{
	case states.idle:
		scr_enemy_idle()
		break
	case states.charge:
		scr_enemy_charge()
		break
	case states.turn:
		scr_enemy_turn()
		break
	case states.walk:
		scr_enemy_walk()
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
}
if sprite_index == spr_newpizzice_turn && anim_end() { state = states.walk sprite_index = walkspr }

if (state == states.stun && stunned > 40 && birdcreated == 0)
{
	birdcreated = 1
	with (instance_create(x, y, obj_enemybird))
		ID = other.id
}

if (hitboxcreate == 0 && state == states.walk && (obj_player1.state != states.mach3 || use_heat()) )
{
	hitboxcreate = 1
	with (instance_create(x, y, obj_forkhitbox))
		ID = other.id
}
if state = states.walk movespeed = 5
if use_heat() { 
	walkspr = spr_newpizzice_heat
	turnspr = -4
	
}
else {
	walkspr = spr_newpizzice_walk
	turnspr = spr_newpizzice_turn	
}
if (state != states.stun)
	birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = (0.15 * room_speed)
if (state != states.grabbed)
	depth = 0
if (state != states.stun)
	thrown = false
if !use_heat() scr_scareenemy()	
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
