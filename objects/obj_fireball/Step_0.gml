scr_collision()
hsp = movespeed
if grounded vsp = -6
if place_meeting_collision(x + hsp, y) && !scr_meeting_destructibles(hsp, vsp) && !place_meeting(x + hsp, y + sign(vsp), obj_metalblock) instance_destroy()
instance_destroy(instance_place(x + hsp, y, obj_destructibles))
instance_destroy(instance_place(x, y + vsp, obj_destructibles))
instance_destroy(instance_place(x + (hsp * 1.1), y, obj_metalblock))
instance_destroy(instance_place(x, y + (vsp * 1.1), obj_metalblock))
scr_destroy_destructibles(hsp, vsp)
scr_destroy_metal(hsp, vsp)
var a = instance_place(x, y, obj_baddie)
if a > 0 {
	instance_destroy(a)
	instance_destroy()
	
}