if !instance_exists(obj_fadeout)
	{
		//var _levelinfo = level_array[selected_world][selected_level]
		with obj_player
		{
			global.leveltosave = -4
			global.leveltorestart = rm_eggplantdisclaimer
			state = states.comingoutdoor
			movespeed = 0
			hsp = 0
			vsp = 0
			targetRoom = rm_eggplantdisclaimer
			targetDoor = "A"
			x = 512
			y = 736
			instance_create(x, y, obj_fadeout)
		}
	}
	