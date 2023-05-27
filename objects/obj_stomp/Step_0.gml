var dist = point_distance(x, 0, obj_player1.x, 0)
leg_index += 0.35

if state == states.normal {
	if obj_player1.state != states.stunned cooldown = Approach(cooldown, 0, 1)
	
	if sprite_index != spr_stomper_land || anim_end() {
		y = Approach(y, ystart, 7)	
		sprite_index = spr_stomper_idle	
	}
	if y = ystart && dist <= 75 && !scr_solid_line(obj_player1) && obj_player1.state != states.stunned && cooldown <= 0 && obj_player.y > y {
		state = states.punch
		vsp = 8
		image_index = 0
		sprite_index = spr_stomper_prep
	}
	
}
else if state == states.punch {
	scr_collision()
	vsp += 0.25
	cooldown = 60
	if anim_end() && sprite_index == spr_stomper_prep sprite_index = spr_stomper_fall
	
	
	if grounded {
		state = states.normal
		sprite_index = spr_stomper_land
		image_index = 0
		scr_soundeffect(sfx_groundpound)
		with (obj_camera)
		{
			shake_mag = 5
			shake_mag_acc = (15 / room_speed)
		}	
	}
	
	
	
}