// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function background_get_sprite(_bg) {
	return layer_background_get_sprite(layer_background_get_id(layer_get_id(_bg)))

}
function parallax_clamp_bg(cam_y, para, _bg, height = false) {
	var pct = 960 / room_width
	var cam_size = 960
	var bg_size = sprite_get_width(background_get_sprite(_bg))
	if height {
		pct = 540 / room_height
		cam_size = 540
		bg_size = sprite_get_height(background_get_sprite(_bg))	
	}
	return clamp(cam_y * (para * pct), 0, bg_size - cam_size)
	//clamp((_cam_y * (0.15 * (540 / room_height))), 0, background_get_sprite() - 540))))
	
	
	
}

/// @description Get Background ID.
/// @param layer The Layer name string
function layer_background_get_id_fixed(argument0)
{
	if layer_exists(argument0)
	{
		var els = layer_get_all_elements(argument0);
		var n = array_length(els);
		for (var i = 0; i < n; i++) {
			var el = els[i];
			if (layer_get_element_type(el) == layerelementtype_background) {
				return el;
			}
		}
		return -1;
	}
	return -1;
}

function layer_asset_get_id_fixed(argument0)
{
	if layer_exists(argument0)
	{
		var els = layer_get_all_elements(argument0);
		var n = array_length(els);
		for (var i = 0; i < n; i++) {
			var el = els[i];
			if (layer_get_element_type(el) == layerelementtype_sprite) {
				return el;
			}
		}
		return -1;
	}
	return -1;
}

  
function layer_tilemap_get_id_fixed(argument0)
{

	if layer_exists(argument0)
	{
		var els = layer_get_all_elements(argument0);
		var n = array_length(els);
		for (var i = 0; i < n; i++) {
			var el = els[i];
			if (layer_get_element_type(el) == layerelementtype_tilemap) {
				return el;
			}
		}
	}
	return -1;
}  
  
  
  
function layer_change_background(original_sprite,new_sprite)
{
	/// @description Changes Background sprite based on the original sprite
	/// @function layer_change_background
	if original_sprite != new_sprite
	{
		var a = layer_get_all();
		for (var i = 0; i < array_length(a); i++;)
		{
			var back_id = layer_background_get_id_fixed(a[i])
			if layer_background_get_sprite(back_id) == original_sprite
				layer_background_sprite(back_id, new_sprite);	
		}
	}
}

function get_all_layer_type(layer_type = layerelementtype_undefined)
{
	/// @description Returns an array of a certain type of layer
	/// @function get_all_layer_type
	var layers, layernum = 0;
	var a = layer_get_all(), i = 0;
	while (i < array_length(a)) 
	{
		var els = layer_get_all_elements(a[i]);
		if (layer_get_element_type(els) == layer_type)
		{
			layers[layernum++] = a[i]
		}
	   i++
	}
	//If no layers are found get out
	if (!layernum)
	    return noone;
	
	return layers;
}


function parallax_change_hspeed(layer_name, spd) {
	with obj_parallax {
		var length = array_length(layerArray)	
		var set_id = layer_get_id(layer_name)
		var real_id = -4
		for (var i = 0; i < length; i++) {
			if layerArray[i].id == set_id {
				layerArray[i].hspeed = spd
				break;
			}			
		}
	}
}
function parallax_change_vspeed(layer_name, spd) {
	with obj_parallax {
		var length = array_length(layerArray)	
		var set_id = layer_get_id(layer_name)
		var real_id = -4
		for (var i = 0; i < length; i++) {
			if layerArray[i].id == set_id {
				layerArray[i].vspeed = spd
				break;
			}			
		}
	}
}
