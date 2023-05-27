hsp = (image_xscale * movespeed)
mask_index = spr_player_mask

if place_meeting_solid(x, y + 1) && vsp > 0
{
	vsp = -5
	if (movespeed > 0)
		movespeed -= 1
}

if playerid.key_shoot2 && playerid.state != states.dynamite && playerid.character == characters.vigilante instance_destroy()

if bump_wall(hsp, 24) image_xscale *= -1
if scr_meeting_destructibles(hsp, vsp) || place_meeting(x + hsp, y + vsp, obj_metalblock) || place_meeting(x + hsp, y + hsp, obj_ratblock) || place_meeting(x + hsp, y + hsp, obj_tntblock) instance_destroy()


if (countdown > 0) countdown--
else instance_destroy()


if (sprite_index == spr_dynamite && countdown < 60)
	sprite_index = spr_dynamiteabouttoexplode

scr_collision()
