function scr_player_ratmounttumble()
{
	hsp = (xscale * movespeed)
	move = (key_left + key_right)
	sprite_index = spr_player_ratmountwalljump
	image_speed = ((-abs(movespeed)) / 15)
	//if (!key_attack)
		//movespeed = Approach(movespeed, 0, 1)
	if (scr_slope() && hsp != 0)
		scr_player_addslopemomentum(0.25, 1)
	if (abs(hsp) <= 2)
		state = states.ratmount
	if ((place_meeting((x + hsp), y, obj_solid) && (!(scr_solid_slope((x + hsp), y))) && (!(place_meeting((x + hsp), y, obj_rollblock))) && (!(place_meeting((x + hsp), y, obj_rattumble))) && (!(place_meeting((x + hsp), y, obj_destructibles)))) or place_meeting(x, y, obj_timedgate))
	{
		state = states.ratmounthurt
		vsp = -5
		movespeed = 3
	}
	if key_jump
		input_buffer_jump = 0
	if ((!jumpstop) && vsp < 0.5 && (!key_jump2))
	{
		vsp /= 10
		jumpstop = 1
	}
	
	if (grounded && vsp > 0 && (!(place_meeting(x, y, obj_bigcheese))))
		jumpstop = 0
	if (key_jump && brick)
	{
		with (instance_create(x, y, obj_highjumpcloud2))
			image_xscale = other.xscale
		vsp = -11
		image_index = 0
	}
	if (input_buffer_jump < 8 && grounded)
	{
		particle_set_scale(particle.highjumpcloud2, xscale, 1)
		create_particle(x, y, particle.highjumpcloud2, 0)
		scr_soundeffect(sfx_jump)
		vsp = -11
		jumpstop = 0
	}
}
