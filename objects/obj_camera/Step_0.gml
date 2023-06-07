if (room == editor_room)
	exit;
player = (obj_player1.spotlight == 1 ? obj_player1 : obj_player2)
if (!instance_exists(obj_pizzaball))
	targetgolf = noone
if (collect_shake > 0)
	collect_shake *= 0.5
if (healthshaketime > 0)
{
	healthshaketime--
	healthshake = random_range(-2, 2)
}
if (healthshaketime == 0)
	healthshake = 0
if (obj_player1.character == characters.vigilante)
{
	if (healthold != global.playerhealth)
	{
		playerhealthup = healthold < global.hp
		healthshaketime = 30
		healthold = global.playerhealth
	}
}

if (global.coop == true)
{
	var p1 = player
	var p2 = (obj_player1.spotlight == 1 ? obj_player2 : obj_player1)
	p2pdistance = point_distance(p1.x, 0, p2.x, 0)
	p2pdistancex = (p1.x >= p2.x ? ((-p2pdistance) / 5) : (p2pdistance / 5))
}
else
	p2pdistancex = 0
if (floor(image_index) == 10)
	shoving = 0
if (room == strongcold_endscreen || (is_hub() && !global.panic) || room == rm_eggplantdisclaimer || room == SPOOK or room == rm_levelselect or room == timesuproom or room == Realtitlescreen or room == characterselect or room == hub_hall or room == hub_loadingscreen)
	visible = false
else
	visible = true
if (instance_exists(obj_debugcontroller) && (!obj_debugcontroller.showhud))
	visible = false
if obj_player1.super_mario visible = true	
if (global.combo >= 10)
	global.SAGEcombo10 = 1
/*	
if (global.combo > 0)
{
	alarm[4] = 2
	trace(alarm[4])
	global.savedcombo = global.combo
	var ct = global.combotime
	if (ct <= 40)
	{
		if (alarm[5] == -1)
		{
			if (ct >= 20)
				alarm[5] = 12
			else
				alarm[5] = 5
		}
	}
	else
		combobubblevisible = 1
}
*/

if (shoving == 0)
	bang = 0
if (global.seconds <= 0 && global.minutes <= 0 && ded == 0)
{
	alarm[1] = -1
	if (global.miniboss or instance_exists(obj_toppinwarrior))
		alarm[2] = 1
	else
		alarm[3] = 1
	ded = 1
}
if (global.seconds > 59)
{
	global.minutes += 1
	global.seconds -= 59
}
if global.timedgatetimer
{
	if (global.timedgatetime > 0)
		global.timedgatetime--
	else
	{
		global.timedgatetime = 0
		global.timedgatetimer = 0
	}
}


#region Screen Tilting && Zooming
var pct = clamp(1 - (global.fill / obj_tv.chunkmax), 0, 1)
var tilt_percent = 0
if pct >= 0.2 tilt_percent = lerp(0, 1, pct - 0.2)
tilt_percent = clamp(tilt_percent, 0, 1)

if !instance_exists(obj_ghostcollectibles) && global.panic || global.clownprogress == 1 || global.towerarenaprogress == 1 {
	panicshake = clamp(lerp(1, 2, pct),1,2)
    panicshakeacc = (3 / room_speed)
} else {
	panicshake = 0;
	panicshakeacc = 0;		
}
panicshake = Approach(panicshake, 0, panicshakeacc);

//var _sin = (global.ScrollOffset / 3) * (0.45 * funnypct)
var tgt_angle = 0, angle_spd = 0
if instance_exists(obj_johnhitstun) { 
	tgt_angle = obj_johnhitstun.image_xscale * 5 
	angle_spd = 0.15 
}
else if !instance_exists(obj_ghostcollectibles) && (global.panic || global.clownprogress == 1 || global.towerarenaprogress == 1) && global.option_escapetilt { 
	if global.leveltosave == "exit" {
		tgt_angle = tilt_percent * 8
		angle_spd = 0.15
		
	} else {
		tgt_angle = scr_sin(tilt_percent * 5, 65 - (5 * tilt_percent))
		angle_spd = 0.15
	}
}
else { 
	tgt_angle = 0
	angle_spd = 0.15 
	}

if (instance_exists(obj_johnhitstun)) camera_zoom(0.8, 0.03)
else if obj_player1.state == states.chainsaw camera_zoom(0.95, 0.05)
else camera_zoom(1, 0.33)
	
angle = lerp(angle, tgt_angle, angle_spd)
camera_set_view_angle(view_camera[0], angle)	



#endregion

if (shake_mag > 0)
{
	if !ds_queue_empty(camshake_queue) shake_mag -= ds_queue_dequeue(camshake_queue)
	else shake_mag = Approach(shake_mag, 0, shake_mag_acc)
	if shake_mag <= 0 {
		shake_mag = 0
		ds_queue_clear(camshake_queue)
	}

} else {
	shake_mag = 0
	if !ds_queue_empty(camshake_queue)	ds_queue_clear(camshake_queue)		
}



if shakex_mag > 0 {
	shake_dirx = random_range(-1, 1)
	if shakex_mag_delay > 0 
		shakex_mag_delay--
	else {
		shakex_mag = Approach(shakex_mag, 0, shakex_mag_acc)	
		shakex_mag_delay = shakex_mag_maxdelay
		
		draw_shakexmag = shake_dirx * shakex_mag
	}
	
}
detachedby = -1
detach = 0
follow_golf = 0






if (instance_exists(player) && player.state != states.timesup && player.state != states.gameover && (!follow_golf) && (!detach))
{
	if (room != custom_lvl_room)
	{
		var target = player
		var coopdistance = (distance_to_object(obj_player2) / 2)
		var _tgtChargey = 0
		var _tspeedy = 6
		var meet_gate = 0
		with player {
			var a = -4
			if instance_exists(obj_startgate)
				var a = instance_place(x, y, obj_startgate)
			else if instance_exists(obj_arcademachinesmip)
				var a = instance_place(x, y, obj_arcademachinesmip)
			if a > 0 && !a.closed
				meet_gate = 1
			
		}
		if meet_gate chargecamera_y = Approach(chargecamera_y, -100, 1)
		else chargecamera_y = Approach(chargecamera_y, 0, 2)
		if (player.state == states.mach2 or player.state == states.mach3)
		{
			var _targetcharge = (player.xscale * ((player.movespeed / 4) * 50))
			var _tspeed = 0.3
			chargecamera = Approach(chargecamera, _targetcharge, _tspeed)
		}
		else if ((abs(player.hsp) >= 16 or (player.state == states.chainsaw && player.tauntstoredmovespeed >= 16)) && player.state != states.climbwall && player.state != states.Sjump)
		{
			_targetcharge = (player.xscale * ((abs(player.movespeed) / 4) * 50))
			_tspeed = 2
			if ((_targetcharge > 0 && chargecamera < 0) or (_targetcharge < 0 && chargecamera > 0))
				_tspeed = 8
			chargecamera = Approach(chargecamera, _targetcharge, _tspeed)
		}
		else if (player.state == states.machslide)
			chargecamera = Approach(chargecamera, 0, 10)
		else
			chargecamera = Approach(chargecamera, 0, 6)
		
		var cam_width = camera_get_view_width(view_camera[0])
		var cam_height = camera_get_view_height(view_camera[0])
		if (targetgolf != noone && (!instance_exists(targetgolf)))
			targetgolf = noone
			
		var _left_limit = !obj_player1.super_mario || room == Realtitlescreen || room == hub_hall ? 0 : -192	
		var _right_limit = !obj_player1.super_mario || room == Realtitlescreen || room == SPOOK || room == hub_hall ? (room_width - cam_width) : (room_width - cam_width) + 192
			
			
		if (targetgolf == noone)
		{
			if ((!global.coop) or room == characterselect or room == rm_levelselect or room == Realtitlescreen || room == SPOOK || room == hub_hall)
			{
				var cam_x = (((target.x - (cam_width / 2)) + chargecamera) + p2pdistancex)
				var cam_y = ((target.y - (cam_height / 2)) - 50 + chargecamera_y)
				cam_x = clamp(cam_x, _left_limit, _right_limit)
				cam_y = clamp(cam_y, 0, (room_height - cam_height))
				//camera_zoom(1, 0.035)
			}
			else if (obj_player2.state != states.titlescreen)
			{
				cam_x = (((obj_player1.x + obj_player2.x) / 2) - (cam_width / 2))
				cam_y = (((obj_player1.y + obj_player2.y) / 2) - (cam_height / 2))
				var disx = (abs((obj_player1.x - obj_player2.x)) / coop_zoom_width)
				var disy = (abs((obj_player1.y - obj_player2.y)) / coop_zoom_height)
				var dis = max(disx, disy)
				dis = max(1, dis)
				camera_zoom(dis, 0.035)
			}
		}
		else
		{
			var _px = 0
			var _py = 0
			if global.coop
			{
				_px = obj_player2.x
				_py = obj_player2.y
			}
			cam_x = ((((obj_player1.x + targetgolf.x) + _px) / 2) - (cam_width / 2))
			cam_y = (((((obj_player1.y + targetgolf.y) + _py) / 2) - (cam_height / 2)) - 50)
			disx = (abs(((obj_player1.x - targetgolf.x) - _px)) / coop_zoom_width)
			disy = (abs(((obj_player1.y - targetgolf.y) - _py)) / coop_zoom_height)
			dis = max(disx, disy)
			dis = max(1, dis)
			camera_zoom(dis, 0.035)
		}
		cam_x += irandom_range((-panicshake), panicshake);
		cam_y += irandom_range((-panicshake), panicshake);
		
		if (shake_mag != 0 && room != strongcold_arenatrailer)
		{
			cam_x += irandom_range((-shake_mag), shake_mag)
			cam_y += irandom_range((-shake_mag), shake_mag)
		}
		if shakex_mag > 0 
			cam_x += draw_shakexmag
		var room_normal = room_width / 3	
		if room == strongcold_arenatrailer {
		cam_x = 0
		cam_y = (room_height - cam_height) - 225
			
		}

		camera_set_view_pos(view_camera[0], cam_x, cam_y)
	}
	else
	{
		target = player
		coopdistance = (distance_to_object(obj_player2) / 2)
		if (player.state == states.mach3 or player.state == states.rideweenie or player.state == states.machroll)
		{
			if (chargecamera > (player.xscale * 100))
				chargecamera -= 2
			if (chargecamera < (player.xscale * 100))
				chargecamera += 2
		}
		else
		{
			if (chargecamera > 0)
				chargecamera -= 2
			if (chargecamera < 0)
				chargecamera += 2
		}
		cam_width = camera_get_view_width(view_camera[0])
		cam_height = camera_get_view_height(view_camera[0])
		cam_x = (((target.x - (cam_width / 2)) + chargecamera) + p2pdistancex)
		cam_y = (target.y - (cam_height / 2))
		var _room_x = 0
		var _room_y = 0
		var _room_width = room_width
		var _room_height = room_height
		if bound_camera
		{
			_room_x = obj_player.cam.x
			_room_y = obj_player.cam.y
			_room_width = obj_player.cam_width
			_room_height = obj_player.cam_height
			if (obj_player.cam != noone)
			{
				instance_deactivate_object(obj_minijohn_hitbox)
				instance_deactivate_object(obj_pepgoblin_kickhitbox)
				instance_deactivate_object(obj_forkhitbox)
				instance_deactivate_object(obj_baddiecollisionbox)
				instance_deactivate_object(obj_baddie)
				instance_activate_object(obj_inputAssigner)
				offset = 64
				instance_activate_region((_room_x - offset), (_room_y - offset), (_room_width + offset), (_room_height + offset), true)
			}
		}
		if (shake_mag != 0)
		{
			cam_x += irandom_range((-shake_mag), shake_mag)
			cam_y += irandom_range((-shake_mag), shake_mag)
		}
		camera_set_view_pos(view_camera[0], clamp(cam_x, 0, (_room_width - cam_width)), (clamp(cam_y, 0, (_room_height - cam_height)) + irandom_range((-shake_mag), shake_mag)))
	}
}
else if follow_golf
{
	if (instance_exists(targetgolf) && targetgolf.thrown == true)
	{
		var _xx = targetgolf.x
		var _yy = targetgolf.y
		var _freecamera = 0
		_room_x = 0
		_room_y = 0
		var _width = room_width
		var _height = room_height
		if (room == custom_lvl_room)
		{
			if (obj_player1.cam != noone)
			{
				_room_x = obj_player1.cam.x
				_room_y = obj_player1.cam.y
				_width = obj_player1.cam_width
				_height = obj_player1.cam_height
			}
			else
				_freecamera = 1
		}
		_width -= camera_get_view_width(view_camera[0])
		_height -= camera_get_view_height(view_camera[0])
		_xx -= (camera_get_view_width(view_camera[0]) / 2)
		_yy -= (camera_get_view_height(view_camera[0]) / 2)
		if _freecamera
			camera_set_view_pos(view_camera[0], _xx, _yy)
		else
			camera_set_view_pos(view_camera[0], clamp(_xx, _room_x, _width), clamp(_yy, _room_y, _height))
	}
	else
	{
		targetgolf = noone
		follow_golf = 0
	}
}
else if detach
{
	camera_zoom(max((room_width / original_cam_width), (room_height / original_cam_height)), 0.035)
	_width = room_width
	_height = room_height
	_width -= camera_get_view_width(view_camera[0])
	_height -= camera_get_view_height(view_camera[0])
	_xx = camera_get_view_x(view_camera[0])
	_yy = camera_get_view_y(view_camera[0])
	_xx = (obj_player1.x - (camera_get_view_width(view_camera[0]) / 2))
	_yy = (obj_player1.y - (camera_get_view_height(view_camera[0]) / 2))
	camera_set_view_pos(view_camera[0], _xx, _yy)
}
