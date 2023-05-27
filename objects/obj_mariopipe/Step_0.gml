var a = instance_place(x, y - 1, obj_player)
if a < 0 collision_rectangle(bbox_left, bbox_top - 4, bbox_right, bbox_top + 4, obj_player, 0, 1)
if a < 0 exit;
with a {
	if key_down && grounded && (state == states.normal || state == states.mariowalk || state == states.crouch) {
		x = other.x
		hsp = 0 
		vsp = 0
		state = states.actor
		scr_soundeffect(sfx_mariopipe)
		if !super_mario sprite_index = spr_downpizzabox
		else sprite_index = spr_marioenterpipe
		image_index = 0
		image_speed = 0.35
		other.intro = true	
	}
	other.depth = 10
	if state == states.actor {
		if (sprite_index == spr_downpizzabox || sprite_index == spr_marioenterpipe) && anim_end() && other.intro { visible = false other.alarm[0] = 60 other.intro = false }
		//if sprite_index == spr_downpizzabox && floor(image_index) == 0 && !other.intro { state = states.normal }
		other.depth = -10
	}
}