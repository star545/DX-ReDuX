scr_input_init()
var height = max(sprite_get_height(spr_peppalette),sprite_get_height(spr_guspalette),sprite_get_height(spr_noisepalette))
depth = -1000
visible = false
active = false
char = obj_pause.selected_char
chosen_color = 0
slot_sel = 2
move_h_delay = 5
rgb_sel = 0
move_v_delay = 5
prev_pal = surface_create(2, height)
colors = []
repeat(height) array_push(colors, {
r : irandom(255),
g : irandom(255),
b : irandom(255),
})


spr[characters.peppino] = spr_peppalette
spr[characters.noise] = spr_noisepalette
spr[characters.pizzelle] = spr_peppalette

global.color_array[characters.peppino] = [load_custom_colors(characters.peppino, "0"), load_custom_colors(characters.peppino, "1"), load_custom_colors(characters.peppino, "2")]
global.color_array[characters.snick] = [load_custom_colors(characters.snick, "0"), load_custom_colors(characters.snick, "1"), load_custom_colors(characters.snick, "2")]
global.color_array[characters.noise] = [load_custom_colors(characters.noise, "0"), load_custom_colors(characters.noise, "1"), load_custom_colors(characters.noise, "2")]
global.color_array[characters.jetpack_noise] = [load_custom_colors(characters.jetpack_noise, "0"), load_custom_colors(characters.jetpack_noise, "1"), load_custom_colors(characters.jetpack_noise, "2")]
global.color_array[characters.pizzelle] = [load_custom_colors(characters.pizzelle, "0"), load_custom_colors(characters.pizzelle, "1"), load_custom_colors(characters.pizzelle, "2")]
global.color_array[characters.gus] = [load_custom_colors(characters.gus, "0"), load_custom_colors(characters.gus, "1"), load_custom_colors(characters.gus, "2")]
Export = {
active : false,
sprite_index : spr_pal_export,
x : 900,
y : 360,
}
Import = {
active : false,
sprite_index : spr_pal_import,
x : 900,
y : 460,
}