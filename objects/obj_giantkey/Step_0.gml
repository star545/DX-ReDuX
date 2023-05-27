scr_collision()
if vsp > 0 && !bounced vsp += 0.5
if grounded {
	if bounced == 0 {
		vsp = -15
		bounced = 1
		scr_soundeffect(sfx_groundpound)
		create_particle(x, y, particle.landcloud)
	}
	if bounced == 1 {
		vsp = -8
		bounced = 2
		scr_soundeffect(sfx_groundpound)
		create_particle(x, y, particle.landcloud)
	}
	
}