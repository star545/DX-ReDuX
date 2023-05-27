
yoffset = 0
if sprite_index != spr_gerome_taunt {
	event_inherited()
	sprite_index = (x != xprevious ? spr_gerome_keymove : spr_gerome_keyidle)
} else if obj_player1.state != states.backbreaker sprite_index = spr_gerome_keyidle
if ((xprevious - x) != 0)
	image_xscale = (-(sign((xprevious - x))))
else if (playerid.hsp == 0)
	image_xscale = playerid.xscale
