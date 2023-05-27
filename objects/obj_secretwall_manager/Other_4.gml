/*var current_hider = obj_player1.secret_array
with obj_player1 {
	var a = instance_place(x, y, obj_secret_tiles)
	var b = -4
	if a != -4 b = a.tiles
	if array_length(global.secret_layers) > 0 && b != -4 {
		
		for (var i = 0; i < array_length(global.secret_layers); i++) {
			var d = global.secret_layers[i]
			var b = 1
			if in_array(b, d.nm) global.secret_layers[i].alpha = 0
		}
	}
	
}

/*
if !surface_exists(secret_surface)
	secret_surface = surface_create(room_width, room_height)
surface_resize(secret_surface, room_width, room_height)