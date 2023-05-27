function scr_player_cotton()
{
	image_speed = 0.35;
	if movespeed > 8 && key_attack && !key_attack2 && sprite_index != spr_cotton_run
		sprite_index = spr_cotton_maxrun;
	
	// move
    if sprite_index != spr_cotton_slam
move = (key_right + key_left)
	hsp = movespeed
	
	// running shit why
	var running = false;
	var drilling = sprite_index == spr_cotton_drill;
	
	if sprite_index == spr_cotton_run or sprite_index == spr_cotton_maxrun
	{
		running = true;
		
		// from run to maxrun
		if sprite_index == spr_cotton_run && floor(image_index) >= image_number - 1
	    {
	        sprite_index = spr_cotton_maxrun;
	        flash = true;
	    }
		
		// accelerate
		if sprite_index != spr_cotton_maxrun
			movespeed += 0.15;
		else if movespeed < 12
			movespeed += 0.35;
		else if floor(movespeed) == 12
			movespeed = 12;
		
		if movespeed < 5
			movespeed = 5;
		
		// bump
		if scr_solid(x + xscale, y) && !place_meeting(x + xscale, y, obj_destructibles)
	    {
	        if sprite_index == spr_cotton_maxrun
	        {
				instance_create(x + 10 * xscale, y + 10, obj_bumpeffect)
				
				scr_soundeffect(sfx_groundpound)
				scr_soundeffect(sfx_bumpwall)
				
				with obj_camera
				{
					shake_mag = 3;
					shake_mag_acc = 4 / room_speed;
				}
				
	            sprite_index = spr_cotton_slam
	            vsp = -6
	            movespeed = -4
	        }
	        else if sprite_index == spr_cotton_run
	        {
	            sprite_index = spr_cotton_idle
	            vsp = 0
	            movespeed = 0
	        }
			running = false;
			image_index = 0;
	    }
		else if !key_attack
		{
			// stop abruptly
			sprite_index = spr_cotton_idle;
			if move == 0
				movespeed = 0;
			image_index = 0;
			running = false;
		}
	}
	else if move != 0
	{
		if dir != xscale
	    {
	        dir = xscale;
	        movespeed = 0;
	    }
        xscale = move;
	}
	
	if !running
	{
		if drilling
			hsp = 0;
		else
		{
		    hsp = move * movespeed;
			if movespeed < 4
				movespeed = 4;
			else if movespeed > 4
			{
				if move != 0
					movespeed -= 0.1;
				else
					movespeed = 4;
			}
		}
	}
	else
		hsp = xscale * movespeed;
    if vsp > 5 && !drilling && !running
        vsp = 5;
	
	// jump
    if key_jump && grounded && !drilling
    {
        vsp = -14;
		if running
			vsp = -12;
		else
		{
	        image_index = 0
	        sprite_index = spr_cotton_jump
		}
        instance_create(x, y, obj_highjumpcloud2)
        scr_soundeffect(sfx_jump)
    }
	
	// attack
    if key_slap2 && sprite_index != spr_cotton_attack && !running
    {
		jumpstop = true
        flash = true
        image_index = 0
        sprite_index = spr_cotton_attack
        grounded = false
        vsp = -4
        scr_soundeffect(sfx_suplexdashSP)
    }
	
	//Jump Stop
	if !key_jump2 && !jumpstop && vsp < 0.5
	{
		vsp /= 2;
		jumpstop = true;
	}
	if grounded
		jumpstop = false;
	
	// attack

    if sprite_index == spr_cotton_attack
    {
        hsp += 8 * xscale
        movespeed = 0
        move = xscale
		
		if grounded
	    {
			scr_soundeffect(sfx_step)
			instance_create(x, y, obj_landcloud)
			
	        image_index = 0
			if move == 0
				sprite_index = spr_cotton_land;
			else
			{
				if key_attack
				{
					sprite_index = spr_cotton_maxrun;
					running = true;
				}
				else
					sprite_index = spr_cotton_walk;
			}
		}
    }
	
	// animation
    if sprite_index == spr_cotton_idle && move != 0
    {
        image_index = 0
        sprite_index = spr_cotton_walk
    }
    if sprite_index == spr_cotton_walk
    {
		image_speed = 0.35 * movespeed / 4;
		if move == 0
		{
	        image_index = 0
	        sprite_index = spr_cotton_idle
		}
    }
	
	if floor(image_index) == image_number - 1
	{
		if sprite_index == spr_cotton_jump
	    {
	        image_index = 0;
	        sprite_index = spr_cotton_fall;
	    }
	    if sprite_index == spr_cotton_doublejump
	    {
	        image_index = 0;
	        sprite_index = spr_cotton_doublefall;
	    }
	    if sprite_index == spr_cotton_slam
	    {
	        image_index = 0;
	        sprite_index = spr_cotton_idle;
	    }
		if sprite_index == spr_cotton_land
		{
			image_index = 0;
			sprite_index = spr_cotton_idle;
		}
	}
	
	// land
    if (sprite_index == spr_cotton_fall or sprite_index == spr_cotton_doublefall or sprite_index == spr_cotton_jump or sprite_index == spr_cotton_doublejump) && (grounded && vsp >= 0)
    {
        image_index = 0
        sprite_index = spr_cotton_land
        instance_create(x, y, obj_landcloud)
        scr_soundeffect(sfx_step)
    }
	
	// double jump
    if !grounded && (sprite_index == spr_cotton_fall or sprite_index == spr_cotton_jump) && key_jump && vsp > 0
    {
		jumpstop = false
        vsp = -10
        image_index = 0
        sprite_index = spr_cotton_doublejump
        instance_create(x, y, obj_highjumpcloud2)
        scr_soundeffect(sfx_jump)
    }
	
	// drill move
    if key_down2 && !grounded && !suplexmove && sprite_index != spr_cotton_slam && !running
    {
        vsp = 9
        sprite_index = spr_cotton_drill
        image_index = 0
        scr_soundeffect(sfx_suplexdashSP)
        flash = true
        suplexmove = true;
		
		with instance_create(x, y, obj_mach3effect)
		{
			hspeed = -7;
			playerid = other.object_index;
		}
		with instance_create(x, y, obj_mach3effect)
		{
			hspeed = 7;
			playerid = other.object_index;
		}
		with instance_create(x, y, obj_mach3effect)
		{
			vspeed = -7;
			playerid = other.object_index;
		}
		with instance_create(x, y, obj_mach3effect)
		{
			vspeed = 7;
			playerid = other.object_index;
		}
		with obj_mach3effect
		{
			if playerid == other.object_index
			{
				image_index = other.image_index - 1;
				image_xscale = other.xscale;
				sprite_index = other.sprite_index;
				keep = true;
			}
		}
    }
	
	// fall off
    if !grounded && sprite_index != spr_cotton_jump && sprite_index != spr_cotton_attack && sprite_index != spr_cotton_doublejump && sprite_index != spr_cotton_doublefall && sprite_index != spr_cotton_drill && sprite_index != spr_cotton_slam && !running
        sprite_index = spr_cotton_fall
	
	// start running
    if key_attack && !scr_solid(x + xscale, y) && sprite_index != spr_cotton_slam && grounded && !running && !drilling
    {
        sprite_index = spr_cotton_run
        image_index = 0
        movespeed = 5
    }
	
    if sprite_index == spr_cotton_slam
    {
        movespeed = 0
        hsp = 0
        move = 0
        dir = 0
    }
	
	// land while drilling
	if drilling && grounded
	{
		instance_create(x, y, obj_landcloud)
		scr_soundeffect(sfx_step)
		
	    sprite_index = spr_cotton_land
	    vsp = 0
	    movespeed = 0
	    image_index = 0
	}
	
	// walking cloud
	if sprite_index == spr_cotton_walk
	{
		var step1 = 10;
		var step2 = 21;
		if floor(image_index) == step1 or floor(image_index) == step2
		{
			if !steppy
			{
				instance_create(x, y + 43, obj_cloudeffect)
				steppy = true
			}
		}
		else
			steppy = false;
	}
}
