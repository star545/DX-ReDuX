image_xscale = playerid.xscale
var p = playerid
var gus_check = playerid.isgustavo && ((playerid.state != states.ratmount && playerid.state != states.ratmountjump) || abs(playerid.hsp) <= 12)
if p.isgustavo {
	if gus_check instance_destroy()
	
} else {
	if (playerid.state != states.rocket && playerid.state != states.mach3 && playerid.state != states.crouchslide && playerid.state != states.shoulderbash)
	instance_destroy()
	
}

x = p.x + (p.isgustavo || p.state == states.rocket ? (18 * p.xscale) : 0)
y = p.y


visible = (!(room == rank_room))
if (place_meeting(x, y, obj_secretportal) or place_meeting(x, y, obj_secretportalstart))
	visible = false
