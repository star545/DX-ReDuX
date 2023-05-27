// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_palette(sel = -4, pal = -4) {
	var palspr = obj_player1.spr_palette
	var palsel = obj_player1.paletteselect
	if obj_player1.isgustavo { palspr = spr_guspalette palsel = obj_player1.paletteselectGus }
	if pal != -4 palspr = pal
	if sel != -4 palsel = sel
	if palsel = 0 pal_swap_set(obj_player1.custom_pep_surf, 1, 1)
	else pal_swap_set(palspr, palsel, 0)
}

function check_skin(type) {
	var cond = true
	if type == "grunch"
		cond = obj_player1.paletteselect == 6
	return cond	
	
}


function save_custom_colors(character, slot) {
	
	var name = get_chardetail("name",,character)
	var palspr = get_chardetail("palette",,character)
	var height = sprite_get_height(palspr)
	var rl = real(slot)
	var color_arr = global.color_array[character][rl]
	
	var _colors = []
	for (var i = 0; i < array_length(color_arr); i++) {
		var a = color_arr[i]
		array_push(_colors, [a.r, a.g, a.b])
	}
	
	var _list = ds_list_create()
	ds_list_add(_list, _colors)
	ini_open("palettes.ini")
	var str = ds_list_write(_list)
	ini_write_string(name, slot, str)
	ini_close()
	ds_list_destroy(_list)
	
}

function load_custom_colors(character, slot) {
	var name = get_chardetail("name",,character)
	var palspr = get_chardetail("palette",,character)
	var _list = ds_list_create()
	var _colors = []
	var a = []
	/*
	switch character {
		case characters.peppino:
			a = [
			[0, 0, 0],
			[255, 255, 255],	
			[136, 168, 200],
			[255, 170, 131],			
			[160, 56, 0],			
			[255, 255, 255],
			[136, 168, 200],
			[255, 255, 255],
			[136, 168, 200],
			[255, 255, 255],
			[255, 255, 255],
			]
		break;
		case characters.noise:
		case characters.jetpack_noise:
			a = [
			[0, 0, 0],
			[255, 255, 255],			
			[255, 170, 131],			
			[160, 56, 0],			
			[248, 224, 128],
			[248, 224, 128],
			[216, 136, 24],
			[216, 136, 24],
			[255, 255, 255],	
			[216, 136, 24],
			[255, 255, 255],	
			[255, 0, 0],
			[255, 255, 255],
			]	
		break;
		case characters.gus:
			a = [
			[0, 0, 0],
			[255, 255, 255],			
			[255, 170, 131],			
			[160, 56, 0],			
			[255, 255, 255],
			[255, 255, 255],
			[160, 56, 0],	
			[248, 224, 128],
			[192, 136, 0],
			[136, 168, 200],
			[95, 117, 140],
			[216, 104, 160],
			[160, 56, 0],	
			[160, 56, 0],	
			[255, 170, 131],
			[255, 255, 255],
			]
		break;
		case characters.vigilante:
			a = [
			[0, 0, 0],
			[176, 48, 0],
			[224, 144, 0],
			[248, 224, 128],
			[0, 0, 0],
			[136, 168, 200],
			]
		break;
		case characters.pizzelle:
			a = [
			[0, 0, 0],
			[255, 255, 255],
			[255, 255, 255],			
			[255, 170, 131],			
			[160, 56, 0],			
			[255, 0, 0],
			[255, 220, 0],
			[120, 104, 152],
			[135, 44, 210],
			[230, 184, 60],
			]
		break;
		
	}
	*/
	repeat(sprite_get_height(palspr)) array_push(a, [255, 255, 255])
	var saved_default = a
	ini_open("palettes.ini")
	var str = ini_read_string(name, slot, "")
	try {
		
		
		
		if str != "" {
			ds_list_read(_list, str)
			a = ds_list_find_value(_list, 0)
		}
		for (var i = 0; i < array_length(a); i++) {
			_colors[i] = { r: a[i, 0], g: a[i, 1], b : a[i, 2] }	
		}

		
		
	} catch(e) {
		show_message(concat(name, " PALETTE ", slot, ", could not load. Set to blank."))
		ds_list_add(_list, saved_default)
		var list_str = ds_list_write(_list)
		ini_write_string(name, slot, list_str)
		for (var i = 0; i < array_length(saved_default); i++) {
			_colors[i] = { r: saved_default[i, 0], g: saved_default[i, 1], b : saved_default[i, 2] }	
		}
		
		//game_end()
		
		
	}
	ds_list_destroy(_list)
	ini_close()
	return _colors
	
}