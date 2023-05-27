if (ds_list_find_index(global.saveroom, id) == -1)
{
	global.heattime = 60
	with (obj_camera)
		healthshaketime = 60
	scr_soundeffect(sfx_collectpizza)
	//instance_destroy()
	global.combotime = 60
	var val = heat_calculate(1000)
	if (other.object_index == obj_player1)
		global.collect += val
	else
		global.collectN += val
	//create_collect(x, y, sprite_index)
	with (instance_create((x + 16), y, obj_smallnumber))
		number = string(val)
		//with obj_arenamode_controller if !dead time += 60	
	tv_do_expression(obj_tv.tv_collect, 60)
	
	ds_list_add(global.saveroom, id)
	repeat (4)
		create_debris(x, y, spr_mortcubedebris)
}
