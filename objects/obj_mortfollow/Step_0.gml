if (obj_player1.spotlight == 1)
	playerid = obj_player1
else
	playerid = obj_player2
if (playerid.mort == 0)
	visible = true
else
	visible = false
if (room == rank_room)
	visible = false
image_speed = 0.35
if (obj_player1.hsp != 0)
	sprite_index = spr_mortwalk
else
	sprite_index = spr_mortidle
depth = -6
if visible && (instance_exists(obj_mortegg) || instance_exists(obj_mortFlame) || playerid.state == states.mort || playerid.state == states.morthook || playerid.state == states.mortattack || playerid.state == states.mortjump) visible = false
/*
if (global.mort == 0)
	instance_destroy()
