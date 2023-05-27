/// @description Obtain Information on the BG Layers

//Foreground Depth Fixing

layer_depth("Tiles_Foreground3", -33)
layer_depth("Tiles_Foreground2", -32)
layer_depth("Tiles_Foreground1", -31)
layer_depth("Assets_FG", -30)
layer_depth("Tiles_4", 96)
layer_depth("Tiles_3", 97)
layer_depth("Tiles_2", 98)
layer_depth("Tiles_1", 100)
layer_depth("Tiles_BG3", 198)
layer_depth("Tiles_BG2", 199)
layer_depth("Tiles_BG", 200)


if global.panic {
	layer_change_background(bg_castle4, bg_castle4escape)	
	layer_change_background(bg_castle3, bg_castle3escape)	
	layer_change_background(bg_castle2, bg_castle2escape)	
	layer_change_background(bg_factory1, bg_factory1escape)	
	layer_change_background(bg_factory2, bg_factory2escape)	
	layer_change_background(bg_factory3, bg_factory3escape)	
	//layer_change_background(bg_sewer1, bg_sewer1escape)	
	//layer_change_background(bg_sewer2, bg_sewer2escape)		
	layer_change_background(bg_kidsparty2, bg_kidsparty2escape)		
}


layer_depth("Foreground_Ground1", -300)
layer_depth("Foreground_1", -800)
layer_depth("Foreground_H1", -700)
#region Loop through all layers to find if they are a Background layer or Asset Layer
layerNum = 0;
assetNum = 0;
asset_sprites = 0;
var a = layer_get_all(), i = 0, z = 0;
while (i < array_length(a)) {
	var back_id = layer_background_get_id(a[i]);
	var asset_id = layer_asset_get_id_fixed(a[i])
	// If background layer, add to background layer array.
	if ((back_id != -1 || asset_id != -1) && layer_get_visible(a[i])) {
		layerArray[z++] = {
			id : a[i],
			image_speed : layer_background_get_speed(back_id),
			x : layer_get_x(a[i]),
			y : layer_get_y(a[i]),
			xstart : layer_get_x(a[i]),
			ystart : layer_get_y(a[i]),
			xprevious : layer_get_x(a[i]),
			yprevious : layer_get_y(a[i]),			
			hspeed : layer_get_hspeed(a[i]),
			vspeed : layer_get_vspeed(a[i]),
			xShift : global.ScrollOffset * layer_get_hspeed(a[i]),
			yShift : global.ScrollOffset * layer_get_vspeed(a[i])
		} 
		if asset_id != -1 {
			var name = layer_get_name(a[i])	
			//trace(name)
			var vals = [0, 0]
			if !is_undefined(global.ParallaxMap[? name]) var vals = global.ParallaxMap[? name].args
			//else trace("none")
			var all_assets = layer_get_all_elements(a[i])
			for (var j = 0; j < array_length(all_assets); j++) {
				var cur_asset = all_assets[j]
				var _xx = layer_sprite_get_x(cur_asset)
				var _yy = layer_sprite_get_y(cur_asset)
				if vals[0] != 0 {
					var normal_x = (_xx - (_xx * vals[0]))
					var cam_x = (960 / 2) * vals[0]
					layer_sprite_x(cur_asset, normal_x + cam_x)
				}
				if vals[1] != 0 {
					var normal_y = (_yy - (_yy * vals[1]))
					var cam_y = (540 / 2) * vals[1]
					layer_sprite_y(cur_asset, normal_y + cam_y)
				}
				
			}
			
		}
	}
	i++
}

#endregion


//Setup Surface Stuff
if !global.option_performance scr_parallaxbg_init();
