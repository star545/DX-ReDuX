function scr_player_flick()
{
	sprite_index = spr_meteorpep_flying
	image_speed = 0.35
	movespeed += 0.2
	hsp = lengthdir_x(movespeed, wallspeed)	
	vsp = lengthdir_y(movespeed, wallspeed)	
	if scr_solid(x + sign(hsp), y + sign(vsp)) && (!place_meeting(x + sign(hsp), y + sign(vsp), obj_slope) || scr_solid(x + sign(hsp), y + sign(vsp))) && !place_meeting(x + sign(hsp), y + sign(vsp), obj_metalblock) && !place_meeting(x + sign(hsp), y + sign(vsp), obj_ratblock) && !place_meeting(x + sign(hsp), y + sign(vsp), obj_destructibles)
	{
		pizzapepper = 0
		if sign(hsp) != 0
			xscale = sign(hsp)
		sprite_index = spr_meteorpep_land
		scr_soundeffect(sfx_groundpound)
		scr_soundeffect(sfx_bumpwall)
		with (obj_camera)
		{
			shake_mag = 20
			shake_mag_acc = (40 / room_speed)
		}
		flash = 0
		state = states.bump
		hsp = 0
		vsp = 0
		mach2 = 0
		image_index = 0
		instance_create((x - 10), (y + 10), obj_bumpeffect)

	}
	
	exit;
}

