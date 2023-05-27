// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_panicbg_init(){
	var layers = 0
	var layernum = 0
	var layer_names = [
	"Backgrounds_1", 
	"Backgrounds_2", 
	"Backgrounds_3", 
	"Backgrounds_Ground1", 
	"Backgrounds_Ground2", 
	"Backgrounds_Ground3", 
	"Backgrounds_H1", 
	"Backgrounds_sky1", 
	"Backgrounds_sky2", 
	"Backgrounds_still1",
	"Backgrounds_still2",
	"Backgrounds_stillscroll",
	"Backgrounds_stillH1",
	"Backgrounds_stillH2",
	"Backgrounds_scroll",
	"Backgrounds_scroll2",
	]
	var all_layers = layer_get_all()
	var cur_layer = 0
	for (var i = 0; i < array_length(layer_names); i++)
    {
        var _id = layer_get_id(layer_names[i])
        if (_id != -1)
        {
            layers[layernum++] = _id
        }
    }
	if !layernum
		exit
	var _f = function(elm1,elm2)
	{
		return -(layer_get_depth(elm1) - layer_get_depth(elm2));
	}
	array_sort(layers,_f)
	var bottom_id = layers[0]
	var top_id = layers[(layernum - 1)]
	layer_script_begin(bottom_id, scr_panicbg_start)
	layer_script_end(top_id, scr_panicbg_end)
}

function scr_panicbg_end()
{
	if (event_type == 8 && event_number == 0)
	{
	
		shader_reset()
	}
	exit;
}

function scr_panicbg_start()
{
	
	if (event_type == 8 && event_number == 0)
	{
		shader_set(shd_panicbg)
		var panic_id = shader_get_uniform(shd_panicbg, "panic")
		shader_set_uniform_f(panic_id, 1 - (global.fill / global.maxwave))
		var time_id = shader_get_uniform(shd_panicbg, "time")
		shader_set_uniform_f(time_id, (current_time / 1000))
	}
	
	exit;
}



