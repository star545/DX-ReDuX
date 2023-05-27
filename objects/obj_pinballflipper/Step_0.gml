if (sprite_index == bounce_spr && floor(image_index) == (image_number - 1))
	sprite_index = idle_spr
var colliding_player = collision_rectangle(bbox_left, bbox_top - 30, bbox_right, bbox_bottom, obj_player, false, false)
with obj_player {
	if colliding_player > 0 && (input_buffer_jump2 < 8 || key_jump2) && cutscene == 0 && other.sprite_index != other.bounce_spr && state != states.freefall && state != states.freefallprep && state != states.gotoplayer {
		scr_soundeffect_3d(sfx_pinballflip)
		jumpstop = 1
		y -= 5
		grounded = false
		if (state == states.machslide)
		{
			state = states.jump
			if (sprite_index == spr_mach3boost or sprite_index == spr_machslideboost)
				xscale *= -1
		}
		if (state == states.normal)
			state = states.jump
		if (state == states.climbwall)
			state = states.mach2
		
		other.sprite_index = other.bounce_spr
		if (state == states.jump or state == states.normal)
		{
			sprite_index = spr_machfreefall
			image_index = 0
		}
		image_index = 0
		vsp = -20
		jumpstop = 1
		if isgustavo
		{
			sprite_index = spr_player_ratmountmushroombounce
			if (!brick)
				sprite_index = spr_lonegustavo_jumpstart
			jumpAnim = 1
			state = states.ratmountjump
			image_index = 0
		}
		
		
	}
	
	
}