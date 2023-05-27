if ((!horseyfinish) && start)
{
	horseyfinish = true
	scr_soundeffect_3d(sfx_secretfound)
	with (obj_horsey)
	{
		spd = 0
		hsp = 0
		vsp = 0
		state = states.gameover
		with (obj_objecticontracker)
		{
			if (objectID == other.id)
				instance_destroy()
		}
	}
	with (obj_horseyright)
		used = 1
	with (obj_racestart)
		ds_list_add(global.saveroom, id)
	global.horse = 0
	instance_destroy(obj_horseyblock)
}
