if (room == rm_editor)
	exit;

//grounded = false	

switch state
{
	case states.scared:
	case states.idle:
		if state != states.scared scr_enemy_idle()
		hsp = Approach(hsp, 0, 0.1)
		vsp = Approach(vsp, 0, 0.1)
		break
	case states.charge:
		scr_enemy_charge()
		break
	case states.turn:
		scr_enemy_turn()
		break
	case states.walk:
		sprite_index = walkspr
		if movespeed = 0 { 
			movespeed = 12
			rangle = point_direction(x, y, obj_player1.x, obj_player1.y) 
		}
		hsp = lengthdir_x(movespeed, rangle)
		vsp = lengthdir_y(movespeed, rangle)
		movespeed = Approach(movespeed, 0, 0.1)
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
	case states.underground:
		//var cam = new camera_get_position_struct(view_camera[0])
		if distance_to_object(obj_player1) < 300 && sprite_index != spr_portrait_activate {
			sprite_index = spr_portrait_activate
			image_index = 0
		}
		if anim_end() && sprite_index == spr_portrait_activate {
			state = states.walk	
			movespeed = 8 
			rangle = point_direction(x, y, obj_player1.x, obj_player1.y) 
			sprite_index = walkspr
			
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
if state != states.underground scr_scareenemy()


if (ragecooldown > 0)
	ragecooldown--
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = (0.15 * room_speed)

if (state != states.grabbed)
	depth = 0
if (state != states.stun)
	thrown = false

invincible = state == states.rage
	
if (use_heat() && ragecooldown == 0)
{
	var player = instance_nearest(x, y, obj_player)
	var check = (image_xscale > 0 ? (player.x > x && player.x < (x + 400)) : (player.x < x && player.x > (x - 400)))
	if (state == states.walk)
	{
		if player_in_range(200, 200)
		{
			//image_xscale = (-(sign((x - player.x))))
			sprite_index = spr_portrait_heatstart
			image_index = 0
			flash = 1
			alarm[4] = 5
			state = states.rage
			ragedash = 150
			create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
		}
	}
}	
	
	
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
