var player = instance_place(x, y, obj_player)
if player > 0 && !colliding {
	scr_soundeffect_3d(sfx_pinballbouncer1, sfx_pinballbouncer2)
	sprite_index = bounce_spr
	image_index = 0
	scr_soundeffect_3d(sfx_pinballflip)
	player.xscale = image_xscale
	player.movespeed = 12
	player.jumpstop = 1
	player.state = states.mach2
	player.sprite_index = player.spr_machfreefall
	player.vsp = -16
	colliding = true
	
}
if player < 0 && colliding colliding = false



if (sprite_index == bounce_spr && floor(image_index) == (image_number - 1))
	sprite_index = idle_spr