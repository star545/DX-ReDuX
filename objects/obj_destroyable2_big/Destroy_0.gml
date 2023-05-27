if (room == rm_editor)
	exit;
if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == 0)
{
	scr_sleep(5)
	repeat (6)
	{
		with (create_debris((x + random_range(0, sprite_width)), (y + random_range(0, sprite_height)), particlespr, animate))
		{
			hsp = random_range(-5, 5)
			vsp = random_range(-10, 10)
			image_speed = 0.35
		}
	}
	var _xx = center ? x + 32 : x + random(sprite_width)
	var _yy = center ? y + 32 : y + random(sprite_height)
	repeat(center ? 1 : 3)
	with (instance_create(_xx, _yy, obj_parryeffect))
		sprite_index = other.dustspr
	if (content == obj_null)
	{
		global.heattime += 10
		global.heattime = clamp(global.heattime, 0, 60)
		global.combotime += 10
		global.combotime = clamp(global.combotime, 0, 60)
		var val = heat_calculate(100)
		with obj_arenamode_controller if !dead time += 120	
		global.collect += val
		if audio_is_playing(sfx_collecttopping)
			audio_stop_sound(sfx_collecttopping)
		scr_soundeffect(sfx_collecttopping)
		with (instance_create((x + 16), y, obj_smallnumber))
			number = string(val)
	}
	else
		instance_create((x + 32), y, content)
	//repeat (3)
		//create_baddiegibsticks((x + 32), (y + 32))
	tile_layer_delete_at(1, x, y)
	tile_layer_delete_at(1, (x + 32), y)
	tile_layer_delete_at(1, (x + 32), (y + 32))
	tile_layer_delete_at(1, x, (y + 32))
	if (audio_is_playing(sfx_breakblock1) or audio_is_playing(sfx_breakblock2))
	{
		audio_stop_sound(sfx_breakblock1)
		audio_stop_sound(sfx_breakblock2)
	}
	scr_soundeffect(sfx_breakblock1, sfx_breakblock2)
	ds_list_add(global.saveroom, id)
}
if instance_exists(obj_arenamode_controller) && !arena {
	if (ds_list_find_index(global.arenaroom, id) == -1)
		ds_list_add(global.arenaroom, id)
	with instance_create(xstart, ystart, obj_arenaghost) {
		contentID = other.id
		ontouch = true
		content = other.object_index
		image_xscale = other.image_xscale
        image_yscale = other.image_yscale
        sprite_index = other.sprite_index
		
	}	
	
}