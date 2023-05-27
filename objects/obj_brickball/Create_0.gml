scr_collision_init()
offcam_time = 0
image_speed = 0.5
hsp = 0
vsp = 0
grav = 0.5
xoffset = 0
movespeed = 0
grounded = false
bounce = 0
blur_effect = 2
vsp_carry = 0
hsp_carry = 0
platformid = -4
paletteselect = 0
spr_palette = 0
alarm[0] = 200
alarm[1] = 5
kicked = 0
depth = -99
up = 0
hitbox = 0
var attempts = 0
var old_y = y

scr_destroy_destructibles(0, 0)
scr_destroy_metal(0, 0)

var a = snap_to_solid(image_xscale, 96)
//if !a instance_destroy()
