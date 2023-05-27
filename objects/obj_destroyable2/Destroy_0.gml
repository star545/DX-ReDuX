if (room == rm_editor)
	exit;
if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == 0)
{
	repeat (3)
	{
		with (create_debris((x + random_range(0, sprite_width)), (y + random_range(0, sprite_height)), particlespr, animate))
		{
			hsp = random_range(-5, 5)
			vsp = random_range(-10, 10)
			image_speed = 0.35
		}
	}
	var _xx = center ? x + 16 : x + random(sprite_width)
	var _yy = center ? y + 16 : y + random(sprite_height)
	
	with (instance_create(_xx, _yy, obj_parryeffect))
		sprite_index = other.dustspr
	scr_sleep(5)
	//create_baddiegibsticks((x + 16), (y + 16))
	if audio_is_playing(sfx_collecttopping)
		audio_stop_sound(sfx_collecttopping)
	scr_soundeffect(sfx_collecttopping)
	global.heattime += 10
	global.heattime = clamp(global.heattime, 0, 60)
	global.combotime += 10
	global.combotime = clamp(global.combotime, 0, 60)
	var val = heat_calculate(10)
	global.collect += val
	with (instance_create((x + 16), y, obj_smallnumber))
		number = string(val)
	tile_layer_delete_at(1, x, y)
	if (audio_is_playing(sfx_breakblock1) or audio_is_playing(sfx_breakblock2))
	{
		audio_stop_sound(sfx_breakblock1)
		audio_stop_sound(sfx_breakblock2)
	}
	scr_soundeffect(sfx_breakblock1, sfx_breakblock2)
	with obj_arenamode_controller if !dead time += 60	
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
if room = tower_secretmario instance_create(x, y, obj_solid)