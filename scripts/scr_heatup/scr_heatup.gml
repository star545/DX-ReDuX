function scr_heatup()
{

	if global.stylethreshold >= 3 && global.option_heatmeter {
		with obj_baddie {
			if !elite || (object_index == obj_robot || object_index == obj_noisey) && global.laps < 2 {
				switch object_index	{
					default: if (use_heat() && paletteselect == 0) paletteselect = 1 break;
					case obj_kentukykenny: if (use_heat(true) && paletteselect == 0) paletteselect = 1 break;
					case obj_noisey: case obj_robot: if ((global.laps >= 2 || (global.stylethreshold >= 3 && global.option_heatmeter)) && paletteselect == 0) paletteselect = 1 break;
				}
				flash = true
				create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
			}
		}
	}
	
	exit;
}

