if invtime > 0 exit;
if state == 1 {
	if other.substate == states.mariojump && other.vsp > 0 {
		state = 0
		other.vsp = -4.1 * 2
		other.jumpstop = false
		scr_soundeffect(sfx_mariokill)
		invtime = 30
	} else scr_hurtplayer(other.id)	
	
} else {
	movespeed = 8
	state = 1
	invtime = 30
	image_xscale = other.xscale
	
	
}