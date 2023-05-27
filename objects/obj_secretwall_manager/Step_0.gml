depth = instance_exists(obj_endlevelfade) ? -3 : -34
var current_hider = obj_player1.secret_array
//trace(current_hider)
if array_length(global.secret_layers) > 0 {
	for (var i = 0; i < array_length(global.secret_layers); i++) 
		global.secret_layers[i].alpha = Approach(global.secret_layers[i].alpha, in_array(current_hider, global.secret_layers[i].nm) ? 0 : 1, 0.05)
	
}