function scr_player_knightpepslopes()
{
	if ((x + hsp) == xprevious)
		slope_buffer--
	else
		slope_buffer = 20
	alarm[5] = 2
	alarm[7] = 60
	if (knightmiddairstop == 0)
		hsp = (xscale * movespeed)
	image_speed = 0.35
	if key_jump
		input_buffer_jump = 0
	if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 2
		jumpstop = 1
	}
	if (grounded && vsp > 0)
		jumpstop = 0
	if ((!scr_slope()) && grounded)
		sprite_index = spr_knightpepcharge
	if scr_slope()
		sprite_index = spr_knightpepdownslope
	if (input_buffer_jump < 8)
	{
		if (grounded or (!doublejump))
		{
			vsp = -11
			scr_soundeffect(sfx_jump)
			sprite_index = spr_knightpepfly
			image_index = 0
			input_buffer_jump = 8
			if (!grounded)
			{
				vsp = -11
				doublejump = 1
				sprite_index = spr_knightpepdoublejump
			}
		}
	}
	if ((sprite_index == spr_knightpepdoublejump or sprite_index == spr_knightpepfly) && floor(image_index) == (image_number - 1))
		image_index = (image_number - 1)
	//(scr_solid((x + sign(hsp)), y) && ((!scr_slope()) or place_meeting((x + sign(hsp)), (y - 2), obj_solid)) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
	if bump_wall(sign(hsp), 2) && !place_meeting(x + hsp, y, obj_ratblock) && !place_meeting_slopeSolid(x + 1, y) && !place_meeting_slopeSolid(x - 1, y)
	{
		movespeed = 0
		vsp = -6
		sprite_index = spr_knightpep_bump
		image_index = floor((image_number - 1))
		state = states.knightpepbump
		scr_soundeffect(sfx_groundpound)
	}
	scr_player_addslopemomentum(0.25, 0)
	if ((!grounded) && key_down2 && sprite_index != spr_knightpepslam)
	{
		scr_soundeffect(sfx_knightsword)
		with (instance_create(x, y, obj_parryeffect))
			sprite_index = spr_knightpep_downcloud
		sprite_index = spr_knightpepslam
		vsp = -5
		hsp = 0
		movespeed = 0
		state = states.knightpep
	}
	exit;
}

