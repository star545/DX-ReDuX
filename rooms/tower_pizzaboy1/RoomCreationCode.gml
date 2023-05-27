pal_swap_init_system(shd_pal_swapper)
add_secrettiles("Tiles_Secret1")
global.roommessage = "PIZZA TOWER ISLAND"

layer_set_visible("Tiles_BG2", 0)
layer_set_visible("Tiles_2", 0)
layer_set_visible("Tiles_BG3", 0)
layer_set_visible("Tiles_3", 0)
if global.has_towersecret6_key == 0 {
	layer_set_visible("Tiles_BG2", 1)
	layer_set_visible("Tiles_2", 1)
}
if global.has_towersecret6_key == 6 {
	layer_set_visible("Tiles_BG3", 1)
	layer_set_visible("Tiles_3", 1)
}