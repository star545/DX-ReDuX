if other.substate == states.mariojump && other.vsp > 0 {
	instance_destroy()	
	other.vsp = -4.1 * 2
	other.jumpstop = false
	scr_soundeffect(sfx_mariokill)
} else scr_hurtplayer(other.id)