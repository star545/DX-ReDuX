if (state == states.grabbed)
	scr_enemy_grabbed()

scr_squash()



if (state != states.stun && state != states.hit)
	linethrown = false
	

if shake_timer > 0
	shake_timer--

if (state == states.stun && (!thrown))
	linethrown = false


if (invtime > 0)
	invtime--


if (dodgebuffer > 0)
	dodgebuffer--

	
with (instance_nearest(x, y, obj_player))
{
	if (state == states.backbreaker)
	{
		other.stunned = 0
		if (other.state != states.pizzagoblinthrow && (!other.provoked) && other.bombreset > 0)
		{
			other.bombreset = 0
			other.provoked = 1
		}
		other.scaredbuffer = 0
	}
	else if (other.state != states.pizzagoblinthrow)
		other.provoked = 0
}

//if (y > (room_height + 100))
//	instance_destroy()
if (thrown && (x > (room_width + 100) or x < -100 or y < -100)) {
	state = states.chase
	sprite_index = spr_pizzaface_angry
	hsp = 0
	vsp = 0
}

