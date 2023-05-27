/*
if used
	image_index = 1
else
	image_index = 0
var s = 16
if place_meeting(x, (y - s), obj_player)
{
	with (obj_player)
	{
		var by = 4
		if (state == states.mach3)
			by = 10
		var bx = 8
		if (state == states.mach3 or state == states.ratmounttumble || state == states.ratmount)
			bx = 18
		if ((state == states.mach2 or state == states.knightpepslopes || state == states.ratmount || state == states.ratmounttumble or state == states.trashroll or state == states.tumble or state == states.mach3 or state == states.trickjump || state == states.ratmounttrickjump) && y <= (other.y + by) && xscale == sign(other.image_xscale) && place_meeting(x, (y + s), other))
		{
			vsp = -14
			movespeed = 14
			
			image_index = 0
			if (!other.used)
			{
				ramp = 1
				if state == states.knightpepslopes sprite_index = spr_knightpep_doublejump
				else sprite_index = spr_trickramp
				other.used = 1
			}
			if isgustavo
			{
				sprite_index = spr_player_ratmountwalljump
				state = states.ratmounttrickjump
			}
			else
				state = states.trickjump
			
			ramp_buffer = 16
			did_ramp = false
			trace("trickjump")
		}
	}
} else used = false
*/
if place_meeting(x, y - 16, obj_player) {
	with (obj_player) {
		if place_meeting(x, y + 16, other.id) && !place_meeting_collision(x + xscale, y, Exclude.SLOPES) && bbox_bottom <= other.bbox_top && xscale == sign(other.image_xscale) {
			if (state == states.mach2 || state == states.ratmounttumble || state == states.trashroll || state == states.tumble || state == states.mach3 || state == states.knightpepslopes || state == states.ratmount || state == states.ratmounttumble || state == states.ratmounttrickjump || state == states.trickjump) {
				vsp = -12;
				movespeed = 14;
				//sprite_index = spr_trickramp;
				image_index = 0;
				
				if (!other.used)
				{
					ramp = 1
					if state == states.knightpepslopes sprite_index = spr_knightpep_doublejump
					else sprite_index = spr_trickramp
					other.used = 1
				}
				if isgustavo {
					sprite_index = spr_player_ratmountwalljump;
					state = states.ratmounttrickjump;
				} else {
					state = states.trickjump;
				}
				ramp_buffer = 16;
				did_ramp = false;
				trace("trickjump");
			}
		}
		//var by = 4;
		//if (state == states.mach3)
		//	by = 10;
		//var bx = 8;
		//if (state == states.mach3 or state == states.ratmounttumble)
		//	bx = 18;
		//if ((state == states.mach2 or state == states.ratmounttumble or state == states.trashroll or state == states.tumble or state == states.mach3 or state == states.trickjump) && y <= (other.y + by) && xscale == sign(other.image_xscale) && place_meeting(x, (y + s), other))
		//{

		//}
	}
} else used = false
