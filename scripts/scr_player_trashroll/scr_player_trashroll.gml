function scr_player_trashroll()
{
	hsp = (xscale * movespeed)
	
	scr_player_addslopemomentum(0.65, 0)
	movespeed = max(3, movespeed)
	if (sprite_index != spr_player_corpsestart && sprite_index != spr_player_corpsesurf)
	{
		if (sprite_index != spr_player_trashjump && sprite_index != spr_player_trashjump2 && sprite_index != spr_player_trashfall)
			sprite_index = spr_player_trashslide
		else
		{
			if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_trashjump2)
				sprite_index = spr_player_trashfall
			if (vsp > 0 && sprite_index == spr_player_trashjump)
			{
				sprite_index = spr_player_trashjump2
				image_index = 0
			}
			if (grounded && vsp > 0)
				sprite_index = spr_player_trashslide
		}
	}
	else
	{
		image_speed = 0.35
		if (sprite_index == spr_player_corpsestart && floor(image_index) == (image_number - 1))
			sprite_index = spr_player_corpsesurf
	}
	if key_jump
	{
		audio_stop_sound(sfx_trashslide)
		dir = xscale
		state = states.mach2
		sprite_index = spr_mach2jump
		jumpstop = 0
		vsp = -11
		instance_create(x, y, obj_jumpdust)
	}
	if (((place_meeting_solid(x + xscale, y) or place_meeting((x + xscale), y, obj_ghostwall)) && (!(place_meeting((x + hsp), y, obj_rollblock))) && (!(place_meeting((x + hsp), y, obj_rattumble)))) or place_meeting(x, y, obj_timedgate))
	{
		audio_stop_sound(sfx_trashslide)
		state = states.bump
		hsp = ((-xscale) * 3)
		vsp = -3
	}
	exit;
}

