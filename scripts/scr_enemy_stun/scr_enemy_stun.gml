function scr_enemy_stun()
{
	if (object_index == obj_ninja)
		attack = 1
	

	
	if !thrown stunned -= elite ? 3 : 0.75
	if (stuntouchbuffer > 0)
		stuntouchbuffer--
	var t = thrown
	var f = fake_thrown
	if (sprite_index != spr_tank_hitwall)
	{
		if (thrown == false && fake_thrown = false)
			sprite_index = stunfallspr
		else
			sprite_index = spr_dead
	}
	else if (floor(image_index) == (image_number - 1) && sprite_index == spr_tank_hitwall)
	{
		state = states.walk
		stunned = 0
		sprite_index = spr_tank_walk
	}
	image_speed = 0.35
	if linethrown
	{
		if thrown
		{
			if (abs(hithsp) > abs(hitvsp))
				hitvsp = 0
			hsp = hithsp
			vsp = hitvsp
			if (hithsp != 0)
				scr_destroy_destructibles(hithsp, 0)
			if (hitvsp != 0)
				scr_destroy_destructibles(0, hitvsp)
			if (hithsp != 0 && hitvsp != 0)
				scr_destroy_destructibles(hithsp, hitvsp)
		}
	}
	if thrown || fake_thrown
    {
        if (hsp != 0)
            scr_destroy_destructibles(hsp, 0)
        if (vsp != 0)
            scr_destroy_destructibles(0, vsp)
        if (hsp != 0 && vsp != 0)
            scr_destroy_destructibles(hsp, vsp)
	}
	var _h = 0
	var _hh = 0
	var _h2 = hsp
	var _hh2 = hithsp
	if (grounded && vsp > 0 && !place_meeting(x + hsp, y, obj_destructibles) && thrown) || (hithsp != 0 && place_meeting_collision(x + hithsp, y) && !place_meeting(x + hithsp, y, obj_destructibles) && thrown) {
		vsp = -5
		thrown = false
		if hithsp != 0 || hsp != 0 {
			_h = sign(hsp)
			_hh = sign(hithsp)
			hsp = 5 * -_h
			hithsp = 5 * -_hh
			
			if object_index == obj_meatball || object_index == obj_pizzaface {
				hsp = -(_h2 * 0.75)
				hithsp = -(_hh2 * 0.75)
			}
			
		}
	}
	if (vsp < 0 || hitvsp < 0) && place_meeting_collision(x, y - 1) && !place_meeting(x, y + hitvsp, obj_destructibles) && thrown && shoulderbashed <= 0 {
		vsp = 5
		thrown = false
	}
	if (grounded && vsp > 0 && !place_meeting(x + hsp, y, obj_destructibles) && fake_thrown) || (hithsp != 0 && place_meeting_collision(x + hithsp, y) && !place_meeting(x + hithsp, y, obj_destructibles) && fake_thrown) {
		vsp = -5
		fake_thrown = false
		if hithsp != 0 || hsp != 0 {
			_h = sign(hsp)
			_hh = sign(hithsp)
			hsp = 5 * -_h
			hithsp = 5 * -_hh
			
			if object_index == obj_meatball || object_index == obj_pizzaface {
				hsp = -(_h2 * 0.75)
				hithsp = -(_hh2 * 0.75)
			}
			
		}
	}
	if (vsp < 0 || hitvsp < 0) && place_meeting_collision(x, y - 1) && !place_meeting(x, y + hitvsp, obj_destructibles) && fake_thrown && shoulderbashed <= 0 {
		vsp = 5
		fake_thrown = false
	}
	if shoulderbashed > 0 && !grounded 
		vsp += 0.2 * shoulderbashed
	if (blur_effect > 0)
		blur_effect--
	else if thrown
	{
		blur_effect = 2
		with (create_blur_afterimage(x, y, sprite_index, (image_index - 1), image_xscale))
			playerid = other.id
	}
	
	
	if f != fake_thrown && f && stunned < 100
		stunned = 100
	
	if (t != thrown && t)
	{
		stunned = 100
		if elite {
			elitehit--
			if elitehit > 0	
				baddie_destroy_points()
			else if destroyable
				instance_destroy()
		} else if destroyable
			instance_destroy()
		
		if object_index == obj_meatball {
			//image_xscale = face_obj(plyr)
			state = states.walk
			//movespeed = max(abs(hithsp), abs(hsp))
			vsp = -3
			
		}
		
	}

	if (stunned <= 0 && grounded) || (object_index == obj_meatball && !thrown)
	{
		vsp = 0
		image_index = 0
		sprite_index = walkspr
		state = states.walk
		stunned = 0
	}
	if place_meeting(x, (y + 1), obj_railparent)
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		railmovespeed = (_railinst.movespeed * _railinst.dir)
		if (grounded && (!thrown))
			hsp = railmovespeed
	}
	else
	{
		railmovespeed = Approach(railmovespeed, 0, 0.5)
		if grounded || object_index == obj_pizzaface
			hsp = Approach(hsp, 0, 0.3)
	}
	if (!thrown)
		grav = 0.5
	if (abs(hsp) > 4 && grounded)
	{
		if (!instance_exists(dashcloudid))
		{
			with (instance_create(x, y, obj_dashcloud))
			{
				image_xscale = sign(other.hsp)
				other.dashcloudid = id
			}
		}
	}
	exit;
}

