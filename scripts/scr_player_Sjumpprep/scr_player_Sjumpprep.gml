function scr_player_Sjumpprep()
{
		
	move = (key_left + key_right)
	if sprite_index = spr_superjumpprep
		move = xscale
	if place_meeting(x, (y + 1), obj_railparent)
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		railmovespeed = _railinst.movespeed
		raildir = _railinst.dir
	}
	var a = [spr_superjumpleft, spr_superjumppreplight, spr_superjumpright]
			
	hsp = ((move * movespeed) + (railmovespeed * raildir))
	if sprite_index == spr_superjumpprep
		movespeed = Approach(movespeed, 0, 1)
	else {
		movespeed = 2
		var m = move
		m *= xscale
		m++ 
		sprite_index = a[m]
				
	}
	image_speed = 0.35
	var can_sjump =	!key_up && (grounded || if_char(characters.noise)) && !place_meeting_collision(x, y - 16) && !place_meeting_collision(x, y - 32)
	if character == characters.jetpack_noise {
		image_speed = 0.5
		hsp = 0
		vsp = 0
		sprite_index = spr_superjumpprep
		can_sjump = anim_end()
	}
	if can_sjump 
	{
		scr_soundeffect(sfx_superjumprelease)
		instance_create(x, y, obj_explosioneffect)
		sprite_index = spr_superjump
		state = states.Sjump
		vsp = -17
		image_index = 0
	}
	
	
	if anim_end() && sprite_index == spr_superjumpprep
		sprite_index = spr_superjumppreplight	
		
	


	exit;
}

