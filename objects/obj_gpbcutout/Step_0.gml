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
		if use_heat() && !instance_exists(obj_ninja) {
			//movespeed = 0.2
			if face_obj(plyr) != 0 image_xscale = face_obj(plyr)
			hsp = image_xscale
			if after_image > 0 after_image--
			else {
				after_image = 30
				create_enemy_afterimage(x, y, sprite_index, image_index, image_xscale)
				
			}
		} else hsp = 0
		//scr_enemy_walk()
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

if (flash == 1 && alarm[2] <= 0)
	alarm[2] = (0.15 * room_speed)
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
