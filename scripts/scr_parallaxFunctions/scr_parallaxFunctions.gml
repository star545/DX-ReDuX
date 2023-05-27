	// Initialize Parallax Map Variable for easy lookup.

global.ParallaxMap = ds_map_create();


/// @desc This function passes a layer and an associated function.
/// @param {any*} lay_id ID or name of the layer to store.
/// @param {any*} function Function to be run along side the layer.
/// @param {array} [args] Arguments to be passed to the function.

function scr_addParallaxLayer(lay_id, func, args = []) {
	global.ParallaxMap[? lay_id] = { func : func, args : args };
	return;
}

function camera_get_position_struct(cam_id, use_array = -4) constructor
{
	//Variables
	var _cam_x = camera_get_view_x(cam_id);
	var _cam_y = camera_get_view_y(cam_id);
	var _cam_width  = camera_get_view_width(cam_id);
	var _cam_height = camera_get_view_height(cam_id);
	//Offset
	//_cam_x -= ((camera_get_view_width(cam_id)) / 960);
	//_cam_y -= ((camera_get_view_height(cam_id)) / 540);
	
	//Variables
	centeredcam_x = _cam_x + _cam_width / 2;
	centeredcam_y = _cam_y + _cam_height / 2;	
	rightcam_x = _cam_x + _cam_width 
	bottomcam_y = _cam_y + _cam_height 
	cam_x = _cam_x;
	cam_y = _cam_y;	

	//trace(concat("CAM", cam_x))
	
	if use_array != -4 {
		centeredcam_x -= use_array[0]
		centeredcam_y -= use_array[1]
	}
}