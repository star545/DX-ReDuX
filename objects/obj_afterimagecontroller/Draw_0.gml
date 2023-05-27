for (var i = 0; i < ds_list_size(global.afterimage_list); i++)
{
	var b = ds_list_find_value(global.afterimage_list, i)
	with (b)
	{
		if visible
		{
			var a = other.alpha[identifier]
			if identifier == afterimage.firemouth
			{
				a = alpha
				draw_sprite_ext_flash(sprite_index, image_index, x, y, image_xscale, 1, 0, #f87018, a * image_alpha, #a84000)
			}
			else if identifier == afterimage.blue
			{	
				a = alpha
				draw_sprite_ext_flash(sprite_index, image_index, x, y, image_xscale, 1, 0, #2b7de5, a * image_alpha, #2058e0)
			}
			else if identifier == afterimage.enemy
			{	
				a = alpha
				draw_sprite_ext_flash(sprite_index, image_index, x, y, image_xscale, 1, 0, #e03000, a * image_alpha, #580000)
			}
			else if identifier == afterimage.mach3effect {
				var nd_color = image_blend == global.mach_color1 ? global.mach2_color1 : global.mach2_color2
				var b = a
				a = alpha
				draw_sprite_ext_flash(sprite_index, image_index, x, y, image_xscale, 1, 0, image_blend, a * b, nd_color)
				
			}
			else if identifier == afterimage.blur 
			{
				a = alpha
				
				if instance_exists(playerid) && playerid != noone
				{
					var parent = object_get_parent(playerid)
					shader_set(global.Pal_Shader)
					if playerid.object_index == obj_player1 || playerid.object_index == obj_brickball || playerid.object_index == obj_brickcomeback
						player_palette()
					else if variable_instance_get(playerid, "spr_palette") != undefined && variable_instance_get(playerid, "paletteselect") != undefined
						pal_swap_set(playerid.spr_palette, playerid.paletteselect, 0)
					draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, image_blend, a)	
					shader_reset()
					
				}
			}
			shader_reset()
		}
	}
}
