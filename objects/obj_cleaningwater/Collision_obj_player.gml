with (other)
{
	if (state == states.cheesepep or skateboarding == 1 or state == states.boxxedpep or state == states.cheesepepstick or state == states.cheesepepstickside or state == states.cheesepepstickup or state == states.cotton)
	{
		state = states.normal
		boxxed = 0
		skateboarding = 0
		var sound_ = choose(sfx_water1, sfx_water2)
		scr_soundeffect_at(sound_, x, y, 0, 300, 800, 1, false, 1)
	}
}
