function scr_heatdown()
{
	
	if global.stylethreshold >= 3 && global.option_heatmeter {
		with obj_baddie {
			if !elite || (object_index == obj_robot || object_index == obj_noisey) && global.laps < 2 {
				var use = global.laps < 2 && !elite &&  (!global.option_heatmeter || global.stylethreshold < 3)
				var use2 = global.laps < 2 && (!global.option_heatmeter || global.stylethreshold < 3)
				switch object_index	{
					default: if (use && paletteselect == 1) paletteselect = 0 break;
					case obj_noisey: case obj_robot: if use2 && paletteselect == 1 paletteselect = 0 break;
				}
				flash = true
				create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
			}
		}
	}
	exit;
}

