
if !instance_exists(other.baddieID)
	exit;
var bID = other.baddieID	
with bID {
	if !invincible && destroyable && state != states.hit && !thrown && invtime <= 0 {
		scr_soundeffect(sfx_step)
		
		mortHP -= 1
		shake_timer = 10
		state = states.stun
		on_fire = 1
		invtime = 3
		flash = true
		repeat (2) create_baddiedebris()
		if sign(obj_player.x - x) != 0
			image_xscale = sign(obj_player.x - x)
		if mortHP <= 0 {
			instance_destroy()
			create_particle(x, y, particle.genericpoofeffect)
			scr_soundeffect(sfx_punch)
		}

		
	}
	//instance_destroy(other)
	
}
