function scr_player_chainsaw()
{
	var _st = tauntstoredstate
	var _spr = tauntstoredsprite
	hsp = 0
	vsp = 0
	x = hitX
	y = hitY
	hitLag--
	if key_jump
		input_buffer_jump = 0
	if global.attackstyle == 2 && (tauntstoredsprite == spr_player_suplexmash1 || tauntstoredsprite == spr_player_lungehit) && !anim_end()
		image_speed = 0.2
	else
		image_speed = 0

	if  _st = states.lungeattack {
		if key_slap && input_attack_buffer < 25 input_attack_buffer = 40
		if key_slap2 input_attack_buffer = 25
		baddie_pummel()
	
		
	}
		
		
	if (hitLag <= 0)
	{
		x = hitX
		y = hitY
		movespeed = tauntstoredmovespeed
		sprite_index = tauntstoredsprite
		state = tauntstoredstate
		vsp = tauntstoredvsp
		if (global.attackstyle == 0)
		{
			if ((tauntstoredstate == states.handstandjump && (tauntstoredsprite == spr_player_suplexgrabjumpstart or tauntstoredsprite == spr_player_suplexgrabjump or tauntstoredsprite == spr_player_airattack or tauntstoredsprite == spr_player_airattackstart)) or sprite_index == spr_piledriverland)
			{
				jumpAnim = 1
				state = states.jump
				sprite_index = spr_suplexland
				vsp = -11
				jumpstop = 0
				image_index = 0
			}
			else if (tauntstoredstate == states.handstandjump or tauntstoredstate == states.finishingblow)
				state = states.normal
		}
		if (global.attackstyle == 1)
		{
			if ((tauntstoredstate == states.handstandjump && (tauntstoredsprite == spr_player_suplexgrabjumpstart or tauntstoredsprite == spr_player_suplexgrabjump or tauntstoredsprite == spr_player_airattack or tauntstoredsprite == spr_player_airattackstart)) or sprite_index == spr_piledriverland)
			{
				movespeed = 4
				state = states.tackle
				sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch)
				image_index = 0
				vsp = -5
			}
			else if (tauntstoredstate == states.handstandjump or tauntstoredstate == states.finishingblow)
			{
				movespeed = 4
				state = states.tackle
				sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch)
				image_index = 0
			}
		}
	}
}
