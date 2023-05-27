x = obj_player1.x
y = obj_player1.y
var m1 = obj_player1.move_v
var m = obj_player1.move
//if m == 0 m = obj_player1.xscale
var _dir = point_direction(x, y, x + (m * 3), y + (obj_player1.move_v * 3))
image_xscale = obj_player1.xscale

var use_diag = false
image_angle = 0
image_yscale = 1
// Up 
if m == 0 && m1 == -1 {
	use_diag = false
	image_angle = image_xscale > 0 ? 90 : 270
	image_yscale = 1
	y -= 85
	x += (image_xscale * 5)
}
// Down
else if m == 0 && m1 = 1 {
	image_angle = image_xscale < 0 ? 90 : 270	
	image_yscale = -1
	x += (image_xscale * 2)
	y += 100
}	
// Diag Up
else if m != 0 && m1 = -1 {
	image_angle = 0
	image_yscale = 1
	use_diag = true	
	x += (image_xscale * 50)
	y -= 45
}
// Diag Down
else if m != 0 && m1 = 1 {
	image_angle = 0
	image_yscale = -1
	use_diag = true	
	x += (image_xscale * 50)
	y += 54
}	
// Normal
else {
	x += (image_xscale * 60)
	y += 14
	
}

if sprite_index == spr_mortfire && use_diag sprite_index = spr_mortfirediag
if sprite_index == spr_mortfire_start && use_diag sprite_index = spr_mortfirediag_start
if sprite_index == spr_mortfirediag && !use_diag sprite_index = spr_mortfire
if sprite_index == spr_mortfirediag_start && !use_diag sprite_index = spr_mortfire_start

if anim_end() {
	if sprite_index == spr_mortfire_start sprite_index = spr_mortfire
	if sprite_index == spr_mortfirediag_start sprite_index = spr_mortfirediag
	
}
if obj_player1.state != states.mortshoot
	instance_destroy()