if (room == rm_editor)
	exit;
if ds_list_find_index(global.baddieroom, id) == -1
{
	baddie_destroy_points()
	if shownHealth {
		with create_debris(x - 5, y - 62, spr_healthbar) {
			image_index = 2	
		}
		with create_debris(x + 15, y - 62, spr_healthbar) {
			image_index = 4
		}
		
	}
	ds_list_add(global.baddieroom, id)
	if escape
		ds_list_add(global.escaperoom, id)
	if (object_index != obj_peppinoclone && object_index != obj_ghoul)
	{
		with (instance_create(x, y, obj_sausageman_dead))
		{
			sprite_index = other.spr_dead
			spr_palette = other.spr_palette
			paletteselect = other.paletteselect
			usepalette = 1
			canrotate = 1
		}
	}
	else if (object_index == obj_peppinoclone)
	{
		with (instance_create(x, y, obj_explosioneffect))
		{
			image_speed = 0.35
			depth = other.depth
			sprite_index = spr_pepclone_death
			spr_palette = other.spr_palette
			paletteselect = other.paletteselect
			usepalette = 1
			image_xscale = other.image_xscale
		}
	}
	else if (object_index == obj_ghoul)
	{
		var i = 0
		repeat sprite_get_number(spr_ghoul_gibs)
		{
			with (create_debris(x, y, spr_ghoul_gibs))
			{
				image_index = i
				vsp = (-(irandom_range(10, 14)))
				spr_palette = other.spr_palette
				paletteselect = other.paletteselect
			}
			i++
		}
	}
	if (object_index == obj_tank)
	{
		repeat (3)
		{
			with (instance_create(x, y, obj_sausageman_dead))
				sprite_index = other.spr_content_dead
		}
		instance_create(x, y, obj_playerexplosion)
		shake_cam(5)
		repeat (8)
		{
			instance_create(x, y, obj_wooddebris)
		}
				
	}
	if (object_index == obj_bazookabaddie)
	{
		//repeat (3)
		//{
		//	with (instance_create(x, y, obj_sausageman_dead))
		//		sprite_index = other.spr_content_dead
		//}
		instance_create(x, y, obj_explosioneffect)
		instance_create(x, y, obj_playerexplosion)
		create_particle(x, y, particle.bang_effect)
		repeat (12)
		{
			with create_debris(x, y, spr_wooddebris)
			{
				vsp = irandom_range(-12, -16)
				hsp = irandom_range(10, -10)
			}
		}
		repeat(8)
		{
			with create_debris(x, y, spr_cheesechunk)
			{
				vsp = irandom_range(-10, -18)
				hsp = irandom_range(10, -10)
			}
		}
				
	}
}

if arenaID != -4 {
	if (ds_list_find_index(global.arenaroom, arenaID) == -1)
		ds_list_add(global.arenaroom, arenaID)
	with obj_arenamode_controller
		if !dead
			time += 180
		
	
}