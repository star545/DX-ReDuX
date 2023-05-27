if active {

	scr_soundeffect(sfx_cheeseland)

	sprite_index = spr_spiderwebjump
	image_index = 0
	active = 0
	//obj_player1.webID = -4
	var cam_x = camera_get_view_x(view_camera[0])
	var cam_w = camera_get_view_width(view_camera[0])
	var xx = cam_x - 64
	if (choose(0, 1) == 1)
		xx = cam_x + cam_w + 64
	if (x < (room_width / 2))
	{
		xx = -64
	}
	var _dir = sign(x - xx)

	with (instance_create(xx, y, obj_spider))
	{
		image_xscale = _dir
		webID = other.id
	}
}