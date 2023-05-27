var a = instance_place(x, y - 1, obj_player)
if a < 0 collision_rectangle(bbox_left, bbox_top - 4, bbox_right, bbox_top + 4, obj_player, 0, 1)
if a < 0 exit;
with a {
	visible = true
	if place_meeting_collision(x, y) while place_meeting_collision(x, y) y--
	y -= 5
	scr_soundeffect(sfx_mariopipe)
	if super_mario {
		super_mario = false
		state = states.jump
		vsp = -14
		sprite_index = spr_machfreefall
		jumpstop = true
	} else {
		super_mario = true
		state = states.mariowalk
		substate = states.mariojump
		vsp = -8
		jumpstop = true
		sprite_index = spr_mario_jump
		
	}
}