function scr_player_finishingblow()
{
	
	var throw_frame = 4
	if sprite_index == spr_swingdingend throw_frame = 1
	hsp = movespeed + backto
	backto = Approach(backto, 0, 0.25);
	move = (key_right + key_left)
	if (floor(image_index) < throw_frame && sprite_index != spr_swingdingend) {
		movespeed = Approach(movespeed, 0, 0.25)
		if character == characters.pizzelle vsp = 0	
	}
	else
		movespeed = Approach(movespeed, (move * 10), 0.5)
	
	if (floor(image_index) == 0 && (!instance_exists(obj_swordhitbox)))
	{
		GamepadSetVibration((object_index == obj_player1 ? 0 : 1), 0.8, 0.8, 0.65)
		scr_soundeffect(sfx_punch)
		scr_soundeffect(sfx_killingblow)
		with (instance_create(x, y, obj_swordhitbox))
			playerid = other.object_index
	}
	var baddie = ds_list_find_value(local_grab_list, 0)
	if anim_end(throw_frame) && thrown_enem = false {
		thrown_enem = true
		with baddie {
			var cur_pos = ds_list_find_index(other.local_grab_list, id)
			if cur_pos != -1 ds_list_delete(other.local_grab_list, cur_pos)
			var lag = 5
			thrown = true
			hitLag = lag
			hitX = x
			hitY = y
			other.movespeed = 0
			other.hitLag = lag
			other.hitX = other.x
			other.hitY = other.y
			instance_create(x, y, obj_parryeffect)
			alarm[3] = 1
			global.combotime = 60
			global.heattime = 60
			if (!important)
				global.style += (5 + global.combo)
			state = states.stun
			image_xscale = (-other.xscale)
			repeat (6) create_baddiedebris()
			shake_cam(3)
			with (other)
			{
				if (sprite_index == spr_uppercutfinishingblow)
				{
					other.hithsp = 0
					other.hitvsp = -25
					other.linethrown = true
				}
				else
				{
					other.hithsp = ((-other.image_xscale) * 25)
					other.hitvsp = -8
					other.linethrown = true
				}
				if character != characters.pizzelle vsp = -6
				else backto = 5 * -xscale
			}
			check_grabbed_solid(other)
			check_grabbed_solid(other)
			y -= slope_check_up(x, y, 64)
			hsp = hithsp
			vsp = hitvsp
			linethrown = true	
			
		}
		
	}
	
	if (key_slap2 && sprite_index != spr_swingding && global.arena_perks.final == 2 && anim_end(throw_frame) && !ds_list_empty(local_grab_list))
	{
		if (move != 0)
			move = xscale
		hsp = (xscale * movespeed)
		movespeed = hsp
		thrown_enem = false
		state = states.finishingblow
		if (!key_up)
			sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5)
		else if key_up
			sprite_index = spr_uppercutfinishingblow
		image_index = 0
	}
	
	
	
	if (floor(image_index) == (image_number - 1))
	{
		movespeed = abs(movespeed)
		state = states.normal
		thrown_enem = false
		backto = 0
		if !ds_list_empty(local_grab_list)
			state = states.grab
	}
	
	
	if global.arena_perks.final == 2 image_speed = 0.7 
	else image_speed = 0.35 
	landAnim = 0
	if ((!instance_exists(obj_dashcloud2)) && grounded && movespeed > 3)
	{
		with (instance_create(x, y, obj_dashcloud2))
			image_xscale = other.xscale
	}
	if (punch_afterimage > 0)
		punch_afterimage--
	else
	{
		punch_afterimage = 5
		create_mach3effect(x, y, sprite_index, image_index, xscale)
	}
	
	
	
	
	exit;
}

function scr_pizzelle_finishingblow() {
	static backto = 0;
	static once = true;
	move = (key_right + key_left);
    hsp = movespeed + backto;	
	backto = Approach(backto, 0, 0.25);
	if floor(image_index) < 5 && sprite_index != spr_player_swingdingend {
		vsp = 0;
		movespeed = Approach(movespeed, 0, 0.25);
	} else {
		movespeed = Approach(movespeed, move * 8, 0.5);
	}		
	if anim_end() {
		backto = 0;
		once = true;
		state = states.normal;
		movespeed = abs(movespeed);
	}

	if (floor(image_index) == 0 && (!instance_exists(obj_swordhitbox)))
	{
		GamepadSetVibration((object_index == obj_player1 ? 0 : 1), 0.8, 0.8, 0.65)
		backto = 5 * -xscale
		scr_soundeffect(sfx_punch)
		scr_soundeffect(sfx_killingblow)
		with (instance_create(x, y, obj_swordhitbox))
			playerid = other.object_index
	}

	

	image_speed = 0.35;
	landAnim = 0;
}
