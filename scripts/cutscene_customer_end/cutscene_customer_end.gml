function cutscene_customer_check(argument0, argument1, argument2)
{
	if instance_exists(argument2.id) && ds_list_find_index(global.saveroom, argument2.id) == -1 {
		with (obj_gnome_checklist)
			gnome_check[argument0] = 1
		global.pizzasdelivered++
		if instance_exists(obj_gnomecustomerblock)
			instance_destroy(obj_gnomecustomerblock)
		with (instance_create(argument1.x, argument1.y, obj_pizzaboxunopen))
		{
			content = argument2.content
			depth = argument1.depth
			visible = false
			with obj_deathmode time += 600
		}
		ds_list_add(global.saveroom, argument2.id)
		
	}
	cutscene_end_action()
	exit;
}

function cutscene_customer_end(argument0)
{
	with (obj_customeractor)
		happy = 1
	cutscene_end_action()
	exit;
}

