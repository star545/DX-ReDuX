// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_load_texgroups(texs) {
	instance_create(0, 0, obj_saveicon)
	with instance_create(0, 0, obj_leveltexload) {
		for (var i = 0; i < array_length(texs); i++) {
			ds_list_add(tex_list, texturegroup_get_textures(texs[i]))
		}
		tex_max = ds_list_size(tex_list)
	}
}
function scr_flush_texgroups(texs) {
	instance_create(0, 0, obj_saveicon)
	with instance_create(0, 0, obj_leveltexunload) {
		for (var i = 0; i < array_length(texs); i++) {
			ds_list_add(tex_list, texturegroup_get_textures(texs[i]))
		}
		tex_max = ds_list_size(tex_list)
	}
}