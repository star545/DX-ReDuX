if destroy
{
	ds_list_add(global.saveroom, id)
	audio_falloff_set_model(audio_falloff_linear_distance)
	
	scr_soundeffect_at(sfx_explosion, x, y, 0, 900, 2000, 1.5, false, 1)
	with (instance_create(x, y, obj_explosioneffect))
		sprite_index = spr_bombexplosion
	instance_create(x, y, obj_bangeffect)
	instance_create(x, y, obj_slapstar)
	instance_create(x, y, obj_slapstar)
	instance_create(x, y, obj_slapstar)
	instance_create(x, y, obj_baddiegibs)
	instance_create(x, y, obj_baddiegibs)
	instance_create(x, y, obj_baddiegibs)
	with (obj_camera)
	{
		shake_mag = 3
		shake_mag_acc = (3 / room_speed)
	}
	with (instance_create(x, y, obj_sausageman_dead))
		sprite_index = spr_hungrypillar_dead
}
