if (room == rm_editor)
	exit;
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
	case states.rage:
		scr_enemy_rage()
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
if (state == states.walk && y > ystart && (!(scr_solid(x, (y - 1)))))
	y--
if (state == states.walk && y < ystart && (!(scr_solid(x, (y + 1)))))
	y++
if (state == states.stun)
	grav = 0.5
else
	grav = 0
if (bombreset > 0)
	bombreset--
var player = instance_nearest(x, y, obj_player)
if (ragebuffer > 0)
	ragebuffer--
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = (0.15 * room_speed)
if (state == states.pizzagoblinthrow or state == states.rage)
{
	hsp = 0
	vsp = 0
}
if (state != states.grabbed)
	depth = 0
scr_scareenemy()
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

if state = states.walk && bombreset <= 0 && player_in_range(125, 250) && !scr_solid_line(obj_player1) && use_heat() {
	flash = 1
	alarm[4] = 5
	create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)	
	sprite_index = throwspr
	image_index = 0
	state = states.pizzagoblinthrow
	//bombreset = 120
	
	
}