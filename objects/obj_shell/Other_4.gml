tiles_array = -4
var arr = [
"Tiles_BG",
"Tiles_BG2",
"Tiles_BG3",
"Tiles_1",
"Tiles_2",
"Tiles_3",
"Tiles_4",
"Tiles_Foreground1",
"Tiles_Foreground2",
"Tiles_Foreground3",
]
var col = [
obj_solid,
obj_platform,
obj_slope,
obj_sidePlatform,
obj_slopePlatform,
obj_grindrail,
]
for (var i = 0; i < array_length(arr); i++) {
	tiles_array[i] = layer_get_visible(arr[i])	
	
}

//scr_showcollisions()