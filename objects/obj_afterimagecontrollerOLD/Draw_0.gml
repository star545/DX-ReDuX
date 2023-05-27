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
				shader_set(aftimg_shader)
				var colorblend1 = shader_get_uniform(aftimg_shader, "blendcolor1");
				shader_set_uniform_f(colorblend1, 0.97, 0.43, 0.09)
				var colorblend2 = shader_get_uniform(aftimg_shader, "blendcolor2");
				shader_set_uniform_f(colorblend2, 0.66, 0.25, 0)
			}
			else if identifier == afterimage.blue
			{
				a = alpha
				shader_set(aftimg_shader)
				var colorblend1 = shader_get_uniform(aftimg_shader, "blendcolor1");
				shader_set_uniform_f(colorblend1, 0.17, 0.49, 0.9)
				var colorblend2 = shader_get_uniform(aftimg_shader, "blendcolor2");
				shader_set_uniform_f(colorblend2, 0.15, 0.31, 0.66)
			}
			else if identifier == afterimage.blur || identifier == afterimage.mach3effect
			{
				a = alpha
				if instance_exists(playerid)
				{
					if playerid != noone && playerid.object_index == obj_player1
					{
						shader_set(global.Pal_Shader)
						if playerid.object_index == obj_player1 || playerid.object_index == obj_brickball || playerid.object_index == obj_brickcomeback {
							if identifier == afterimage.mach3effect
								player_palette(1)	
							else
								player_palette()
								
						} else {
							
							pal_swap_set(playerid.spr_palette, playerid.paletteselect, 0)
						}
					}
				}
			}
			
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, image_blend, a)
			if identifier != afterimage.mach3effect && identifier != afterimage.afterimage
				shader_reset()
		}
	}
}
