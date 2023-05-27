if (active && other.state != states.spiderweb && other.state != states.chainsaw && other.state != states.hurt && other.state != states.bump)
{
	scr_soundeffect(sfx_cheesecling)
	with obj_player1 {
		if state == states.climbwall state = states.mach2
		tauntstoredmovespeed = movespeed
		tauntstoredvsp = vsp
		tauntstoredsprite = sprite_index
		tauntstoredstate = state
		state = states.spiderweb
		webID = other.id
	}
	
	scr_controlprompt(concat(prompt_string(global.key_jump), "Jump ", prompt_string(global.key_slap), "Drop ", prompt_string(global.key_left), prompt_string(global.key_right), " Turn"))
}
