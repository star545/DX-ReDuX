function scr_player_revolver()
{
	hsp = (xscale * movespeed)
	landAnim = 0
	if grounded
	{
		if (movespeed > 0)
			movespeed -= 0.1
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerV_revolverstart)
		sprite_index = spr_playerV_revolverhold
	if ((sprite_index == spr_playerV_revolverhold or sprite_index == spr_playerV_airrevolverstart or sprite_index == spr_playerV_revolverstart) && (!key_slap))
	{
		if grounded
			if key_down2 {
			}
			else sprite_index = spr_playerV_revolvershoot
		else
			sprite_index = spr_playerV_airrevolver
		image_index = 0
		with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
		{
			is_solid = 0
			pierce = 1
			image_xscale = other.xscale
		}
		scr_soundeffect(sfx_killingblow)
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerV_revolvershoot)
	{
		image_index = 0
		state = states.normal
		sprite_index = spr_playerV_revolverend
		movespeed = 2
	}
	if ((sprite_index == spr_playerV_airrevolverend or sprite_index == spr_playerV_airrevolver or sprite_index == spr_playerV_airrevolverstart) && grounded)
	{
		if (key_attack && hsp != 0) {
			state = states.mach2
			if abs(hsp) >= 12 state = states.mach3
		}
		else if !grounded
			state = states.jump
		else state = states.normal
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerV_airrevolver)
	{
		if (key_attack && hsp != 0) {
			state = states.mach2
			if abs(hsp) >= 12 state = states.mach3
		}
		else if !grounded
			state = states.jump
		else state = states.normal
	}
	image_speed = 0.4
	exit;
}

