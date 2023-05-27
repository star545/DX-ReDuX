// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_grabbedclone(){

	var xPos = 0
	var f = obj_player1
	var player = obj_player1
	sprite_index = spr_hurt
	stunned = 200
	var g = grabbedby
	if !instance_exists(g) {
		state = states.normal
		exit;
		
	}
	if !instance_exists(g) || (g.state != states.grab && g.state != states.finishingblow)
	xscale = -g.image_xscale
	//f.baddiegrabbedID = id
	// Normal Grab anim Pos
	if g.state == states.grabbing || g.state == states.grab || g.state == states.slam || g.state == states.handstandjump {
		var _y = clamp((g.image_index - 1) * 10, 0, 40)
		x = g.x
		if (g.sprite_index != spr_player_haulingstart) y = g.y - 40
		else y = g.y - _y
		

	}
	if g.state == states.finishingblow {
		x = g.x + (g.image_xscale * 60)
		 y = g.y	
		
	}

	if !place_meeting(x, y, obj_destructibles) && place_meeting_collision(x, y)
	{
		var _dist = abs(x - g.x)
		x = g.x
		y = g.y
		if !place_meeting_collision(x + g.image_xscale, y)
		{
			var i = 0
			while !place_meeting_collision(x + g.image_xscale, y)
			{
				x += g.image_xscale
				i++
				if (i > _dist)
					break
				else
					continue
			}
			if place_meeting_collision(x + g.image_xscale, y)
			{
				i = 0
				while place_meeting_collision(x + g.image_xscale, y)
				{
					x -= g.image_xscale
					i++
					if (i > _dist)
						break
					else
						continue
				}
			}
		}
	}




}