function scr_player_mort()
{
	move = (key_right + key_left)
	hsp = movespeed
	mort = 0
	doublejump = 0
	jumpstop = 0
	if key_jump
		input_buffer_jump = 0
	if (move != 0)
	{
		if (move == xscale)
			movespeed = Approach(movespeed, (xscale * 8), 0.8)
		else
			movespeed = Approach(movespeed, 0, 0.8)
		if (movespeed <= 0)
			xscale = move
	}
	else
		movespeed = Approach(movespeed, 0, 0.8)
	if (movespeed < 3 && move != 0)
		image_speed = 0.35
	else if (movespeed > 3 && movespeed < 6)
		image_speed = 0.45
	else
		image_speed = 0.6
	if (place_meeting((x + sign(hsp)), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
	{
		movespeed = 0
		if (sprite_index == spr_player_barrelmove)
			sprite_index = spr_player_barrelidle
	}
	if (!landAnim)
	{
		if (move != 0)
			sprite_index = spr_player_mortwalk
		else
		{
			sprite_index = spr_player_mortidle
			image_speed = 0.35
		}
	}
	else if (floor(image_index) == (image_number - 1))
	{
		landAnim = 0
		if (move != 0)
			sprite_index = spr_player_mortwalk
		else
			sprite_index = spr_player_mortidle
	}
	if (!grounded)
	{
		state = states.mortjump
		sprite_index = spr_player_mortjump
	}
	else if (input_buffer_jump < 8)
	{
		input_buffer_jump = 0
		state = states.mortjump
		doublejump = 0
		vsp = -11
		sprite_index = spr_player_mortjumpstart
		image_index = 0
		scr_soundeffect(sfx_jump)
		create_particle(x, y, particle.jumpdust, 0)
	}
	mort_attack()
	exit;
}

function mort_attack()
{
	if key_slap2
	{
		state = states.mortattack
		sprite_index = spr_player_mortattackfront
		image_index = 0
		if (move != 0)
			xscale = move
		var _angle = 0
		if key_up
		{
			_angle = 90
			sprite_index = spr_player_mortattackup
		}
		else if (key_down && (!grounded))
		{
			if (!grounded)
				vsp = 3
			_angle = 270
			sprite_index = spr_player_mortattackdown
		}
		else
			movespeed = (xscale * 12)
		with (instance_create(x, y, obj_morthitbox))
		{
			playerid = other.id
			if (_angle == 0)
				image_xscale = other.xscale
			image_angle = _angle
			alarm[0] = 15
		}
	}
	if (sprite_index == spr_player_mortattackdown or sprite_index == spr_player_mortattackup or sprite_index == spr_player_mortattack)
	{
		if (punch_afterimage > 0)
			punch_afterimage--
		else
		{
			punch_afterimage = 5
			create_mach3effect(x, y, sprite_index, image_index, xscale)
		}
	}
	exit;
}

function Mort_DownMovement()
{
	if (image_angle == 270)
	{
		with (playerid)
		{
			doublejump = 0
			vsp = -14
		}
	}
	exit;
}

function scr_player_mortshoot() {
	move = (key_left + key_right)
	move_v = (key_down - key_up)
	var m = move
	var m1 = move_v
	if move == 0 && move_v == 0 m = xscale
	jumpstop = 0
	//if (dir != xscale)
	//{
	//	dir = xscale
	//	movespeed = 2
	//	facehurt = 0
	//}
	if !global.mort_powerups.flame {
		hsp = Approach(hsp, 0, 0.1)
		sprite_index = spr_player_mortthrow
		if anim_end(3) && !shot {
			shot = true
			var _dir = point_direction(x, y, x + (m * 3), y + (move_v * 3))
			
			with instance_create(x, y, obj_mortegg) { 
				image_angle = _dir
				hsp = lengthdir_x(20, _dir)
				hsp += obj_player1.hsp
				vsp = lengthdir_y(20, _dir)
				pierce = 2
			}
				
			
		}
		
		if anim_end() { shot = false state = states.normal }
	} else {
		var acc = 1
		if abs(hsp) < 2 acc = 0.1
		if move != 0 xscale = move
		hsp = Approach(hsp, 0, 0.25)
		movespeed = abs(hsp)
		if !instance_exists(obj_mortFlame) instance_create(x, y, obj_mortFlame) 
		if !key_shoot state = states.normal
		//image_yscale = 1
		//if m == 1
		//	image_yscale = -1
		sprite_index = spr_player_mortflame
		if move == 0 && move_v = -1
			sprite_index = spr_player_mortflame_up
		else if move == 0 && move_v = 1
			sprite_index = spr_player_mortflame_down
		else if move != 0 && move_v = -1
			sprite_index = spr_player_mortflame_upright
		else if move != 0 && move_v = 1
			sprite_index = spr_player_mortflame_downright


		
	}

	image_speed = 0.5
	
	

}