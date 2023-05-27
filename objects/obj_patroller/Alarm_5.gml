if (patroltimer > 0)
{
	scr_soundeffect(sfx_patrolcountdown)
	patroltimer--
	alarm[5] = 60
}
else
{
	scr_soundeffect(sfx_siren)
	patrolfound = 0
	state = states.punch
	sprite_index = spr_patroller_alert
	image_index = 0
	scr_monster_activate()
}
