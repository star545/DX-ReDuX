x += hsp
if use_vsp {
	y += vsp
	vsp += 0.5
	
}
if y > room_height + 200 instance_destroy()
if (hsp != 0)
{
	dust += 1
	if (dust == 40)
	{
		dust = 0
		create_particle(x, (y + 43), particle.cloudeffect)
	}
}
