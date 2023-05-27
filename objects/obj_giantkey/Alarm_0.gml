playerid.state = states.normal
instance_destroy()
with playerid {
	var ex = x
	var ey = y
	var cx = camera_get_view_x(view_camera[0])
	var cy = camera_get_view_y(view_camera[0])
	rankpos_x = (ex - cx)
	rankpos_y = (ey - cy)
	if (global.timeattack == 1)
		obj_timeattack.stop = 1
	targetDoor = "none"
	obj_camera.alarm[2] = -1
	var roomname = room_get_name(room)
	var namestring = string_letters(roomname)
		
	global.rank = "p"
	scr_soundeffect(mu_rankp)
	if room == tower_entrancehall && global.leveltosave == "exit" global.exit_cutscene = true
	if (global.combo > 0)
	{
		global.combotime = 0
		global.combo = 0
		obj_camera.alarm[4] = -1
		for (var i = 0; i < min(global.comboscore, 500); i += 10)
			create_collect((obj_player1.x + irandom_range(-60, 60)), ((obj_player1.y - 100) + irandom_range(-60, 60)), choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect))
		global.comboscore = 0
	}
	if (!instance_exists(obj_endlevelfade))
		instance_create(x, y, obj_endlevelfade)
	obj_player1.state = states.door
	obj_player1.sprite_index = obj_player1.spr_lookdoor
	if instance_exists(obj_player2)
	{
		obj_player2.state = states.door
		obj_player2.sprite_index = obj_player2.spr_lookdoor
		if global.coop
			obj_player2.visible = true
	}
	obj_endlevelfade.alarm[0] = 235
	image_index = 0
	global.panic = false
	global.snickchallenge = 0
	//gamesave_async_save()
}