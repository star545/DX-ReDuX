/// @description Parallax Handler

visible = !instance_exists(obj_parrallaxOLD)
//This global var simulates the passage of time between rooms
global.ScrollOffset++
//Parallax Moment
for (var i = 0; i < array_length(layerArray); ++i) {
	if (layerArray[i] != undefined) {
		with (layerArray[i]) {
			// Set up Variables.	
			x = xstart;
			y = ystart;
			x += xShift;
			y += yShift;
			
			if (!is_undefined(global.ParallaxMap[? id])) { 
				script_execute_ext(global.ParallaxMap[? id].func, global.ParallaxMap[? id].args);
			} else if (!is_undefined(global.ParallaxMap[? layer_get_name(id)])) {
				script_execute_ext(global.ParallaxMap[? layer_get_name(id)].func, global.ParallaxMap[? layer_get_name(id)].args);
			}
			
			xShift += (hspeed);
			//if layer_get_name(id) != "Backgrounds_zigzagV1"
			yShift += (vspeed);
			
			// Change Layer.
			xprevious = layer_get_x(id);
			yprevious = layer_get_y(id);			
			layer_x(id, x);
			layer_y(id, y);			
			layer_background_speed(layer_background_get_id(id), image_speed);
		
		} 
	}
}
