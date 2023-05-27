function in_ds_list(_id, list) {
	return ds_list_find_index(list, _id) != -1
	
}

function in_array(_arr, _val) {
	var _length = array_length(_arr);

	//search the array from left to right and return first index if found
	for (var i = 0; i < _length; i++) {
		if (_arr[i] == _val) 
			return true;
	}
	return false
		

	
}


function number_in_range(num, a, b)
{
	if num >= a && num <= b
		return true;
	return false;
}

function scr_sin(range, time) {
    return (sin(cur_time / (time * 100)) * range)
}

function get_heat_player() {
	if global.option_heatmeter return global.stylethreshold
	else if global.combo >= 50 return 3;
	else if global.combo >= 25 return 2;
	else if global.combo >= 10 return 1;
	else return 0;
}



function time_in_frames(minutes, seconds) {
	return (((minutes * 60) + seconds) * 60)
	
}

function face_obj(obj) {
	var a = instance_nearest(x, y, obj)	
	var b = sign(a.x - x)
	//if b != 0
	return b
}


function array_push_unique(_arr, _val, _try = 1) {
	var length = array_length(_arr)
	var count = 0
	while (count < _try) {
		count++
		if !in_array(_arr, _val) {
			return array_push(_arr, _val)	
			
		}
		
		
	}
	
}



function string_contains(_str, _substr) {
	var a = false
	if string_count(_substr, _str) > 0
		a = true
	return a
	
}
function cam_shakex(_shk, _acc, _delay) {
	with obj_camera {
		shakex_mag = _shk
		shakex_mag_acc = _acc
		shakex_mag_maxdelay = _delay
		
	}
	
}

function Approach(a, b, amount)
{
	if a < b
	{
		a += amount;
		if a > b
			return b;
	}
	else
	{
		a -= amount;
		if a < b
			return b;
	}
	return a;
}
function shake_cam(mag, mag_acc = mag / room_speed) {
	with obj_camera {
		shake_mag = mag
		shake_mag_acc = mag_acc
		/*
		repeat (ceil(abs(mag / mag_acc))) ds_queue_enqueue(camshake_queue, mag_acc)
		shake_mag = clamp(shake_mag, 0, 20)
		*/
	}
}
function camera_zoom(zoom_target, zoom_speed)
{
	with obj_camera
	{
		targetzoom = zoom_target
		targetzoom = clamp(targetzoom, 0, max_zoom)
		
		if zoom_speed != undefined
			zoomspd = abs(zoom_speed)
		camzoom = lerp(camzoom, targetzoom, zoomspd)
		var vw = (zoomw * camzoom)
		var vh = (zoomh * camzoom)
		camera_set_view_size(view_camera[0], vw, vh)
	}
}

function camera_tilt(tilt_target, tilt_speed) {
	with obj_camera
	{
		tgt_angle = tilt_target
		anglespd = abs(tilt_speed)
		angle = lerp(angle, tgt_angle, anglespd)	
	}
	camera_set_view_angle(view_camera[0], angle)
	
}


function camera_set_zoom(argument0)
{
	with obj_camera
		zoom = argument0
}

function try_solid(xplus, yplus, object, tries)
{
	var old_x = x
	var old_y = y
	var n = -1
	
	for(var i = 0; i < tries; i++)
	{
		x += xplus
		y += yplus
		
		if !scr_solid(x, y)
		{
			n = i + 1
			break
		}
	}
	
	x = old_x
	y = old_y
	return n;
}


function ledge_bump(argument0)
{
	var old_x = x
	var old_y = y
	
	x += xscale * 4
	var ty = try_solid(0, -1, obj_solid, argument0)
	x = old_x
	
	if ty != -1
	{
		y -= ty
		x += xscale
		if scr_solid(x, y)
		{
			x = old_x
			y = old_y
			return true;
		}
		return false;
	}
	return true;
}

function snap_to_solid(dir, attempts) {
	var old_y = y
	if place_meeting_collision(x + dir, y) {
		var i = 0
		while (i < attempts) {
			i++
			y--
			if !place_meeting_collision(x + dir, y) return true;
		}
	}
	y = old_y
	return false;
}


function instance_create_unique(argument0, argument1, argument2)
{
	if instance_exists(argument2)
		return noone;
	var b = instance_create(argument0, argument1, argument2)
	return b;
}

function get_solid_difference(argument0, argument1, argument2)
{
	var old_x = x
	var old_y = y
	
	var n = 0
	for (i = 0; i < argument2; i++)
	{
		x += argument0
		y += argument1
		if !scr_solid(x, y)
			n++
	}
	
	x = old_x
	y = old_y
	return n;
}

function trace()
{
	var _string = ""
	for (var i = 0; i < argument_count; i++) {
		_string += string(argument[i])
	}
	show_debug_message(_string)
	exit;
}

function concat()
{
	var _string = ""
	for (var i = 0; i < argument_count; i++)
		_string += string(argument[i])
	return _string;
}

function ds_list_add_unique(argument0)
{
	if argument_count > 1
	{
		for (var i = 1; i < argument_count; i++)
		{
			var b = argument[i]
			if ds_list_find_index(argument0, b) == -1
				ds_list_add(argument0, b)
		}
	}
}

function point_in_camera(argument0, argument1, argument2)
{
	var cam_x = camera_get_view_x(argument2)
	var cam_y = camera_get_view_y(argument2)
	var cam_w = camera_get_view_width(argument2)
	var cam_h = camera_get_view_height(argument2)
	return point_in_rectangle(argument0, argument1, cam_x, cam_y, (cam_x + cam_w), (cam_y + cam_h));
}

function point_in_camera_ext(argument0, argument1, argument2, argument3, argument4)
{
	var cam_x = camera_get_view_x(argument2)
	var cam_y = camera_get_view_y(argument2)
	var cam_w = camera_get_view_width(argument2)
	var cam_h = camera_get_view_height(argument2)
	return point_in_rectangle(argument0, argument1, (cam_x - argument3), (cam_y - argument4), ((cam_x + cam_w) + argument3), ((cam_y + cam_h) + argument4));
}

function bbox_in_camera(argument0, argument1)
{
	if is_undefined(argument1)
		argument1 = 0
	var cam_x = camera_get_view_x(argument0)
	var cam_y = camera_get_view_y(argument0)
	var cam_w = camera_get_view_width(argument0)
	var cam_h = camera_get_view_height(argument0)
	return bbox_left < cam_x + cam_w + argument1 && bbox_right > cam_x - argument1 && bbox_top < cam_y + cam_h + argument1 && bbox_bottom > cam_y - argument1;
}

function instance_nearest_random(argument0, argument1)
{
	var l = instance_furthest(x, y, argument0)
	var list = ds_list_create()
	for (i = 0; i < instance_number(argument0); i++)
	{
		var b = instance_find(argument0, i)
		var t = distance_to_object(b)
		if t <= l
			ds_list_add(list, b)
	}
	
	var b = undefined
	if ds_list_size(list) > 0
	{
		var n = irandom(argument1)
		if ds_list_size(list) < n
			n = ds_list_size(list) - 1
		b = ds_list_find_value(list, ds_list_size(list) - n)
	}
	ds_list_destroy(list)
	return b;
}

function instance_random(object) {
	return instance_find(object, irandom(instance_number(object) - 1));
}

function heat_calculate(num)
{
	//trace(global.stylemultiplier)
	if !global.option_heatmeter
		return num
	return num + round(num * global.stylemultiplier);
}

function create_level(world, name, rm, save_name) {
	if level_array[world][0] == 0
		level_array[world][0] = [name, rm, save_name]
	else	
		array_push(level_array[world], [name, rm, save_name])
	
}
function create_world(number, name) {
	world_array[number] = name
	level_array[number] = [0]
	
}



function chance(percent) {
	return random(100) <= percent	
	
}
function save_option(_to, save_name) {
	ini_open("saveData.ini")
	switch save_name {
		case "fullscreen":
			global.option_fullscreen = _to
			window_set_fullscreen(global.option_fullscreen)
		break	
		case "resolution":
			global.option_resolution = _to
			var _os_r = global.option_resolution
			var resolutionX = (_os_r == 0 ? 480 : (_os_r == 1 ? 960 : 1920))
			var resolutionY = (_os_r == 0 ? 270 : (_os_r == 1 ? 540 : 1080))
			window_set_size(resolutionX, resolutionY)
		break	
		case "vibration": global.option_vibration = _to break	
		case "peter": global.peterplusmode = _to break	
		case "hardmode": global.hardmode = _to break	
		case "performance": global.option_performance = _to break	
		case "double": global.option_doubleenem = _to break
		case "attackstyle": global.attackstyle = _to break
		case "sidemove": global.sidemove = _to break
		case "tilt": global.option_escapetilt = _to break
		case "funnyhud": global.option_funnyhud = _to break
		case "heatmeter": global.option_heatmeter = _to break
		case "sjumpstyle": global.sjumpstyle = _to break
		
	}
	ini_write_real("Option", save_name, _to)
	ini_close()	
	
}