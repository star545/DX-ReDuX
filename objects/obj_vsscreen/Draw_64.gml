var color = flashed ? c_white : c_black
draw_sprite_tiled(spr_versusflame, -1, 0, flamey)
if !flashed draw_rectangle_color(-32, -32, 992, 572, c_white, c_white, c_white, c_white, 0)
var shakk = random_range(-shake, shake)
var shakk2 = random_range(-shake2, shake2)
draw_sprite_ext(spr_vspeppino, 0, pepx + shakk, 540 - sprite_get_height(spr_vspeppino) + shakk2, 1, 1, 0, color, 1)
draw_sprite_ext(noisespr, 0, noisex + shakk, 540 - sprite_get_height(noisespr) + shakk2, 1, 1, 0, color, 1)
var shaked = random_range(-1, 1)
var shaked2 = random_range(-1, 1)
if flashed {
draw_sprite(spr_vstitle, 0, shaked + shakk, shaked2  + shakk2)
draw_sprite(spr_pizzaboytitle, 0, noisex + shaked + shakk, (380 + shaked2) + shakk2)

}
draw_set_alpha(flash)
draw_rectangle_color(-32, -32, 992, 572, c_white, c_white, c_white, c_white, 0)
draw_set_alpha(1)