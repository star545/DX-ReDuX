function scr_player_chainsawpogo()
{
	if sprite_index != spr_player_chainsawbounce && sprite_index != spr_player_chainsawspin_flash sprite_index = spr_player_chainsawspin
	if sprite_index = spr_player_chainsawbounce && anim_end() sprite_index = spr_player_chainsawspin_flash
	move = key_left + key_right
	if move != 0 && ((move == -1 && movespeed >= -8) || (move == 1 && movespeed <= 8))
	movespeed = Approach(movespeed, move * 8, 0.4)
	else if move == 0 movespeed = Approach(movespeed, move * 8, 0.1)
	if place_meeting_solid(x + sign(movespeed), y) movespeed = 0 
	hsp = movespeed
	if key_shoot2 {
		input_attack_buffer += 10
		input_attack_buffer = clamp(input_attack_buffer, 0, 60)	
	}
	
	landAnim = 1

	if place_meeting_collision(x, y - 1, Exclude.PLATFORMS) 
	{
		vsp = 2
		hammer_vault = true
		jumpstop = 1
	}
	if grounded && (!hammer_vault || input_attack_buffer > 0 && input_attack_buffer <= 10 ) {
		vsp = -15
		sprite_index = spr_playerN_noisebombspinjump
		hammer_vault = true
		grounded = false
		scr_soundeffect(sfx_groundpound)
		create_particle(x, y, particle.highjumpcloud2)
		sprite_index = spr_player_chainsawbounce
		image_index = 0
		
	}
	if (grounded && vsp > 0 && hammer_vault) || (!key_shoot && !hammer_vault) {
		movespeed = abs(hsp)
		state = states.mach2
		hammer_vault = false
		
		
	}

	image_speed = 0.6
	exit;
}

