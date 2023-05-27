// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function add_secrettiles(tiles){
	global.secret_layers = []

	// Loop Through Given layers and setup array.
	for (var i = 0; i < argument_count; ++i) {
		var arg = argument[i];
		var layerid = layer_get_id(arg);
		layer_set_visible(layerid, false);
		var name = layer_get_name(layerid)
		array_push(global.secret_layers, { nm : name, alpha : 1, surf : -4 });
	}
	// Sort Array
	var _f = function(elm1,elm2) {
		return -(layer_get_depth(elm1.nm) - layer_get_depth(elm2.nm));
	}
	array_sort(global.secret_layers, _f);
	return true;
	
}
function add_secrettilesFG(tiles){
	global.secret_layersFG = []

	// Loop Through Given layers and setup array.
	for (var i = 0; i < argument_count; ++i) {
		var arg = argument[i];
		var layerid = layer_get_id(arg);
		layer_set_visible(layerid, false);
		var name = layer_get_name(layerid)
		array_push(global.secret_layersFG, { nm : name, alpha : 1, surf : -4 });
	}
	// Sort Array
	var _f = function(elm1,elm2) {
		return -(layer_get_depth(elm1.nm) - layer_get_depth(elm2.nm));
	}
	array_sort(global.secret_layersFG, _f);
	return true;
	
}