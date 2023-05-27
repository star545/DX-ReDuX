if (room == rm_editor)
	exit;
if (ds_list_find_index(global.saveroom, id) == -1)
{
	ds_list_add(global.saveroom, id)
	if (object_index == obj_escapecollect)
		ds_list_add(global.escaperoom, id)
	repeat(30) create_fire_effect(x, y, spr_firemouth_projectile)	
	scr_soundeffect(sfx_secretfound)
	
	global.heattime += 10
	global.heattime = clamp(global.heattime, 0, 60)
	global.combotime += 10
	global.combotime = clamp(global.combotime, 0, 60)	
		
}
