function scr_player_machslide()
{
	if (!(place_meeting(x, (y + 1), obj_railparent)))
		hsp = (xscale * movespeed)
	else
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		hsp = ((xscale * movespeed) + (_railinst.movespeed * _railinst.dir))
	}
	move = (key_right + key_left)
	movespeed = Approach(movespeed, 0, 0.4)
	if (sprite_index == spr_machslidestart && floor(image_index) == (image_number - 1))
		sprite_index = spr_machslide
	if (floor(image_index) == (image_number - 1) && (sprite_index == spr_machslideboost or sprite_index == spr_clownturn || sprite_index == spr_mach3boost)) {
		image_speed = 0
		if sprite_index = spr_player_machslideboost3 && !grounded sprite_index = spr_player_mach3boost_fall
		if sprite_index = spr_player_machslideboost && !grounded sprite_index = spr_player_machboost_fall
	}
	else
		image_speed = 0.35
	landAnim = 0
	if (floor(movespeed) <= 0 && (sprite_index == spr_machslide or sprite_index == spr_crouchslide))
	{
		state = states.normal
		image_index = 0
		if (sprite_index == spr_machslide)
			machslideAnim = 1
		movespeed = 0
	}
	if (place_meeting_solid(x + xscale, y) && (sprite_index == spr_machslide or sprite_index == spr_machslidestart))
	{
		sprite_index = spr_wallsplat
		state = states.bump
		image_index = 0
	}
	if ((anim_end() && (sprite_index == spr_machslideboost || sprite_index == spr_clownturn) || sprite_index == spr_player_machboost_fall)  && (grounded || character != characters.peppino))
	{
		hsp = 0
		image_index = 0
		xscale *= -1
		movespeed = 8
		state = states.mach2
	}
	if (((anim_end() && sprite_index == spr_mach3boost) || sprite_index == spr_player_mach3boost_fall) && (grounded || character != characters.peppino))
	{
		if (!launch)
		{
			hsp = 0
			sprite_index = spr_mach4
			image_index = 0
			xscale *= -1
			movespeed = 12
			state = states.mach3
		}
		else
		{
			xscale *= -1
			sprite_index = spr_dashpadmach
			image_index = 0
			state = states.mach3
			movespeed = 14
			launched = 1
			launch = 0
			launch_buffer = 20
		}
	}
	if (sprite_index == spr_player_crouchslide && movespeed == 0 && grounded)
	{
		facehurt = 1
		state = states.normal
		sprite_index = spr_facehurtup
	}
	if ((!instance_exists(dashcloudid)) && grounded && (!(place_meeting(x, (y + 1), obj_water))))
	{
		with (instance_create(x, y, obj_dashcloud2))
		{
			image_xscale = other.xscale
			other.dashcloudid = id
		}
	}
	if ((!instance_exists(dashcloudid)) && grounded && place_meeting(x, (y + 1), obj_water))
	{
		with (instance_create(x, y, obj_dashcloud2))
		{
			sprite_index = spr_watereffect
			image_xscale = other.xscale
			other.dashcloudid = id
		}
	}
	exit;
}

function scr_pizzelle_machslide() {
	if (!(place_meeting(x, (y + 1), obj_railparent)))
		hsp = (xscale * movespeed)
	else
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		hsp = ((xscale * movespeed) + (_railinst.movespeed * _railinst.dir))
	}
	move = (key_right + key_left)
	if (movespeed >= 0) && !scr_slope() && grounded 
		movespeed -= 0.2;
	mask_index = spr_crouchmask;
	if ((key_attack2) && (!scr_solid((x + 27), (y - 32))) && (!scr_solid((x - 27), (y - 32))) && (!scr_solid(x, (y - 32))) && (!scr_solid(x, (y - 16)))) { /*&& key_attack && sprite_index != spr_player_shootslide*/

			sprite_index = spr_player_rollgetup;
			image_index = 0;
			mach2 = 35;
			state = states.mach2;
			if (movespeed < 10) {
				movespeed = 10;
			}

		
	}


	if movespeed <= 0 && (!groundedSlope || place_meeting_collision(x + hsp, y, Exclude.SLOPES)) && !place_meeting((x + sign(hsp)), y, obj_destructibles) {
		state = states.normal;
	    movespeed = 0;
	    mach2 = 0;
	    crouchslideAnim = 1;
	    image_index = 0;
	    crouchAnim = 1;
	    start_running = 1;
	    alarm[4] = 14;
	}
	if place_meeting_collision(x + hsp, y, Exclude.SLOPES) && !place_meeting((x + sign(hsp)), y, obj_destructibles) {
	    state = states.crouch;
	    landAnim = 0;
	    crouchAnim = 1;
	    image_index = 0;
	    idle = 0;
	}
	scr_player_addslopemomentum(0.25, 0.25)
	if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 5) instance_create(x, y, obj_slidecloud);
	image_speed = 0.35;
	
	
}
