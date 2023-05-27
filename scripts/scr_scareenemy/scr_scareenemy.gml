function scr_scareenemy()
{
	var player = instance_nearest(x, y, obj_player)
	if (state != states.grabbed && state != states.stun && state != states.hit && state != states.secret)
	{
		if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60) && ((player.xscale > 0 && x >= player.x) or (player.xscale < 0 && x <= player.x)))
		{
			if (state != states.stun && state != states.staggered && (player.state == states.chainsawbump or player.state == states.mach3 or player.state == states.rideweenie or player.state == states.rocket or player.state == states.tacklecharge or player.state == states.knightpepslopes or (player.state == states.grab && player.swingdingdash <= 0 && player.sprite_index == player.spr_swingding)))
			{
				if state != states.scared {
					state = states.scared
					sprite_index = scaredspr
					hsp = 0
					if (x != player.x) image_xscale = (-(sign((x - player.x))))
					if grounded vsp = -3
				}
			
				var buf = 100
				if global.laps >= 3
					buf = 10
				scaredbuffer = buf
			}
		}
	}
	scaredbuffer--
	if state == states.scared {
		hsp = 0
		var flying_enemies = [
		obj_ancho,
		obj_miniufo,
		obj_kentukybomber,
		obj_pepbat,
		]
		if in_array(flying_enemies, object_index) vsp = Approach(vsp, 0, 0.5)	
		
		
		if ((vsp >= 0 || in_array(flying_enemies, object_index)) && scaredbuffer <= 0)
		{
			state = states.walk
			sprite_index = walkspr
			if (object_index == obj_treasureguy)
				state = states.chase
			if (object_index == obj_pickle && attacking)
			{
				attacking = 0
				bombreset = 0
			}
		}
		
	}
	exit;
}

