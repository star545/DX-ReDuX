/// @desc Initializes Collision Variables. To be used in Create Event.
function scr_collision_init() {

    usesCollision = true;
    grounded = false;
    groundedSlope = false;    
    terminalVelocity = 10;
    onMovingPlatform = noone;
	platformid = -4
    grav = 0;        
    hsp = 0;
    vsp = 0;
    prevHsp = 0;
    prevVsp = 0;    
    hsp_carry = 0;
    vsp_carry = 0;

}

/// @desc Handles Collision Physics.
function scr_collision(go_down_slopes = true) {
    grounded = false;
    groundedSlope = false;
    onMovingPlatform = noone;

    /*
    #region // Moving Platforms
    with (obj_movingplatform) { 
        var _hspeed = (x - xprevious);
        var _vspeed = (y - yprevious);
        with (other.id) {
            x += _hspeed;
            y += _vspeed;
            if (place_meeting_collision(x, y + 1, ~Exclude.MOVING) && place_meeting(x, y + 1, other)) {
                onMovingPlatform = other.id;
            }
            x -= _hspeed;
            y -= _vspeed;            
        }
    }
    if (instance_exists(onMovingPlatform)) { // If collision with Moving Platform is detected, run kinematics.
        kinematics_movingPlatforms(id, onMovingPlatform, true);        
    }
    #endregion
	*/
	with (instance_place(x, (y + 2), obj_movingplatform))
	{
		with (other)
		{
			if (!(place_meeting(x, (y - (3 + abs(other.v_velocity))), other)))
			{
				platformid = other.id
				hsp_carry = other.hsp
				if (abs(other.vsp) > 2)
					vsp_carry = other.vsp
			}
		}
	}
	
    
    // Subpixel Fix
    var true_hsp = hsp;
    var true_vsp = vsp;
    hsp = (hsp > 0 ? floor(hsp) : ceil(hsp));
    vsp = (vsp > 0 ? floor(vsp) : ceil(vsp));
    
    var hsp_final = (hsp + hsp_carry)
    hsp_carry = 0
    var vsp_final = (vsp + vsp_carry)
    vsp_carry = 0
    
    // Horizontal
    // To Do: Optimize Collision Code.
    //var bbox_width = abs(bbox_left - bbox_right);
    //var move_hsp = clamp(abs(hsp), 0, bbox_width) * sign(hsp); // Calculate max units to move.
    //if (!place_meeting_collision(x + move_hsp, y)) {
    //    x += move_hsp;    
    //} else {
    repeat(abs(hsp_final)) {
        
        // Move Up Slopes
        y -= slope_check_up(x + sign(hsp_final), y);
        // Move Down Slopes
        if go_down_slopes y += slope_check_down(x + sign(hsp_final), y);    
    
    
        // Move Down Upside Down Slopes
        y += reverseSlope_check_down(x + sign(hsp_final), y);
        
        // Move Up Upside Down Slopes
        if (vsp_final <= 0 && place_meeting_collision(x, y - 1)) {
            y -= reverseSlope_check_up(x + sign(hsp_final), y);
        }
        
    
        if (!place_meeting_collision(x + sign(hsp_final), y)) {
            x += sign(hsp_final); 
        } else {
            true_hsp = 0;
            hsp = 0;
            break;
        }
    }
    
    // Vertical
    repeat(abs(vsp_final)) {
        
        if (vsp_final < 0) {
            // Move Left Slopes
            x -= slope_check_left(x, y + sign(vsp_final));
            // Move Right Slopes
            x += slope_check_right(x, y + sign(vsp_final));
        }

        if (!place_meeting_collision(x, y + sign(vsp_final))) {
            y += sign(vsp_final); 
        } else {
            true_vsp = 0;
            vsp = 0;
            break;
        }
    }    


    hsp = true_hsp;
    vsp = true_vsp;    
    
    // Gravity
	if vsp < terminalVelocity
		vsp += grav
    //vsp = Approach(vsp, terminalVelocity, grav);        
	if (platformid != noone)
	{
		if (vsp < 0 or (!instance_exists(platformid)) or (!(place_meeting(x, ((y + 12) + (abs(platformid.v_velocity) * 2)), platformid))))
		{
			platformid = noone
			y = floor(y)
		}
		else
		{
			grounded = true
			vsp = grav
			if (platformid.vsp > 0)
				vsp = abs(platformid.v_velocity)
			y = (platformid.y - 46)
			if (!(place_meeting(x, (y + 1), platformid)))
			{
				var i = 0
				while (!(place_meeting(x, (y + 1), platformid)))
				{
					y++
					if (i > abs(sprite_height))
						break
					else
						continue
				}
			}
			if (platformid.v_velocity != 0)
			{
				if scr_solid(x, y)
				{
					i = 0
					while scr_solid(x, y)
					{
						y--
						if (i > 32)
							break
						else
						{
							i++
							continue
						}
					}
				}
				if scr_solid(x, y)
				{
					i = 0
					while scr_solid(x, y)
					{
						y++
						if (i > 64)
							break
						else
						{
							i++
							continue
						}
					}
				}
			}
		}
	}
    
    // Grounded Check
    grounded = (place_meeting_collision(x, y + 1));
    groundedSlope = (place_meeting_slope(x, y + 1));

    
    // Previous hsp and vsp
    prevHsp = hsp;
    prevVsp = vsp;    
}

/// @desc Handles movement of object affected by MOVING PLATFORMS.
/// @param {any*} obj The ID of the object affected/
/// @param {any*} platform_id The ID of the MOVING platform.
/// @param {bool} [collisions] Toggles checking of collisions.
function kinematics_movingPlatforms(obj, platform_id, collisions = true) {
	with (platform_id) {
		var _hsp = round(x - xprevious);
		var _vsp = round(y - yprevious);		
		if (!collisions) { // Ignore Collisions
			with (obj) {
				x += _hsp;
				y += _vsp;
			}
		} else { // Collision Checks
			with (obj) {
				repeat(abs(_hsp)) {	
					if (!place_meeting_collision(x + sign(_hsp), y)) {
						x += sign(_hsp); 
					} else {
						_hsp = 0;
						break;
					}
				}
				repeat(abs(_vsp)) {	
					if (!place_meeting_collision(x, y + sign(_vsp))) {
						y += sign(_vsp); 
					} else {
						_vsp = 0;
						break;
					}
				}
			}
		}
	}
}


/// @desc Returns by how much (in pixel) upwards until a valid surface is found. Used in slope collisions.
/// @param {any*} x The x position to check.
/// @param {any*} y The y position to check.
/// @param {real} [max_units] The max amount of pixels to check.
/// @returns {real}
function slope_check_up(x_pos, y_pos, max_units = 3) {
	// Move up slope
	for (var i = max_units; i > 0; --i) {
		var _check = true;
		var _z = (i - 1);
		repeat (i - 1) {
			if (!place_meeting_collision(x_pos, y_pos - _z)) {
				_check = false;
			}
			_z--;
		}
		if (place_meeting_collision(x_pos, y_pos) && _check && !place_meeting_collision(x_pos, y_pos - i)) {
			return i;
		}
	}
	return 0;	
}
	
/// @desc Returns by how much (in pixel) downwards until a valid surface is found. Used in slope collisions.
/// @param {any*} x The x position to check.
/// @param {any*} y The y position to check.
/// @param {real} [max_units] The max amount of pixels to check.
/// @returns {real}
function slope_check_down(x_pos, y_pos, max_units = 3) {
	// Move down slope
	for (var i = 1; i < max_units + 1; ++i) {
		var _check = true;
		var _z = 1;
		repeat (i) {
			if (place_meeting_collision(x_pos, y_pos + _z)) {
				_check = false;
			}
			_z++;
		}			
		if (!place_meeting_collision(x_pos, y_pos) && _check && place_meeting_collision(x_pos, y_pos + (i + 1))) {
			return i;
		}
	}	
	return 0;	
}
	
/// @desc Returns by how much (in pixel) to the left until a valid surface is found. Used in slope collisions.
/// @param {any*} x The x position to check.
/// @param {any*} y The y position to check.
/// @param {real} [max_units] The max amount of pixels to check.
/// @returns {real}
function slope_check_left(x_pos, y_pos, max_units = 3) {
	// Move to the left
	for (var i = 0; i < max_units; ++i) {
		if (place_meeting_collision(x_pos, y_pos) && !place_meeting_collision(x_pos - i, y_pos)) {
			return i;
		}
	}
	return 0;	
}
	
/// @desc Returns by how much (in pixel) to the right until a valid surface is found. Used in slope collisions.
/// @param {any*} x The x position to check.
/// @param {any*} y The y position to check.
/// @param {real} [max_units] The max amount of pixels to check.
/// @returns {real}
function slope_check_right(x_pos, y_pos, max_units = 3) {
	// Move to the Right
	for (var i = 0; i < max_units; ++i) {
		if (place_meeting_collision(x_pos, y_pos) && !place_meeting_collision(x_pos + i, y_pos)) {
			return i;
		}
	}
	return 0;		
}	

/// @desc Returns by how much (in pixel) going down until a valid surface is found. Used in slope collisions.
/// @param {any*} x The x position to check.
/// @param {any*} y The y position to check.
/// @param {real} [max_units] The max amount of pixels to check.
/// @returns {real}
function reverseSlope_check_down(x_pos, y_pos, max_units = 3) {
	// Move to the Bottom
	for (var i = 0; i < max_units; ++i) {
		if (place_meeting_collision(x_pos, y_pos) && !place_meeting_collision(x_pos, y_pos + i)) {
			return i;
		}
	}
	return 0;	
}
	
/// @desc Returns by how much (in pixel) going up until a valid surface is found. Used in slope collisions.
/// @param {any*} x The x position to check.
/// @param {any*} y The y position to check.
/// @param {real} [max_units] The max amount of pixels to check.
/// @returns {real}
function reverseSlope_check_up(x_pos, y_pos, max_units = 3) {
	// Move to the Top
	for (var i = 0; i < max_units; ++i) {
		if (!place_meeting_collision(x_pos, y_pos) && !place_meeting_collision(x_pos, y_pos - i) && place_meeting_collision(x_pos, y_pos - (i + 1))) {
			return i;
		}		
	}
	return 0;		
}	