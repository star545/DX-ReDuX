if tower with obj_drawcontroller { force_dark = 0 event_perform(ev_other, ev_room_start) 
for (var i = 0; i < array_length(dark_arr); i++)
		layer_shader(dark_arr[i], shd_normal)	
}
global.fill = escape_time()
with (obj_tv) {
    chunkmax = global.fill
	targetfill = global.fill	
}
with obj_deathmode {
	time += time_in_frames(0, 30)
	if room = champ_john time = time_in_frames(3, 0)	
}
if set_music != -4
	obj_music.escapemusic = set_music
	if global.death_mode && obj_player.character = characters.snick obj_music.escapemusic = mu_snickchallengeend
with (obj_escapecollect)
    image_alpha = 1
with (obj_escapecollectbig)
    image_alpha = 1
with (obj_deathcollectescape)
    image_alpha = 1
obj_parallax.bgflash = 1
scr_soundeffect(sfx_escaperumble)
scr_soundeffect(sfx_killenemy)
var _w = sprite_width / 2
var _h = sprite_height / 2
audio_stop_sound(sfx_jon)
//audio_stop_sound(global.music)
repeat (8)
{
	var _xrange = random_range(x - _w, x + _w)
	var _yrange = random_range(y - _h, y + _h)
    with (create_debris(_xrange, _yrange, spr_johnDebris_generic))
    {
        hsp = (obj_player.hsp + random_range(-8, 8))
        vsp = (obj_player.vsp + random_range(-8, 8))
    }
}

obj_camera.alarm[1] = 60
instance_create(x, y, obj_bangeffect)
repeat (6) create_baddiedebris()
camera_zoom(1, 0.33)
if (global.coop == 1)
{
    obj_player1.x = x
    obj_player2.x = x
    obj_player1.y = y
    obj_player2.y = y
}
with (obj_camera)
{
    shake_mag = 3
    shake_mag_acc = (3 / room_speed)
	shakex_mag = 20
    shakex_mag_acc = 2
    shakex_mag_maxdelay = 2
    tgt_angle = tgt_angle * 1.25
    //angle = 0
    maxanglespd = 1
    alarm[6] = 1
}
instance_destroy()
//with (instance_create(x, y, obj_sausageman_dead))
   // sprite_index = spr_hungrypillar_dead
scr_soundeffect(sfx_killenemy)
instance_create(x, (y + 600), obj_itspizzatime)
global.panic = 1

var _spr = debris_spr[debris_type]
var _num = sprite_get_number(_spr)
for (var i = 0; i < _num; i++) {
	var _a = debris_detail[debris_type][i]
	//trace(_a)
	
	var _x = _a[0] * image_xscale
	
	with instance_create(x + _x, y + _a[1], obj_johnDebris) {
		sprite_index = _spr
		image_index = i
		image_xscale = other.image_xscale
		
		hsp = (-image_xscale * (random_range(-4, 4) + obj_player1.tauntstoredmovespeed))
		vsp = (random_range(-4, 4) + obj_player1.tauntstoredvsp) - 6
		
		
	}
	
}
global.combo++
global.combotime = 60
if tower {
	global.leveltosave = "exit"
	obj_player1.backtohubroom = tower_greenroom
	obj_player1.backtohubstartx = 672
	obj_player1.backtohubstarty = 384
	global.leveltorestart = tower_greenroom
	global.levelreset = 0
	global.resetlevel = 0
	global.exitlevel = false
	global.levelname = "The Crumbling Tower of Pizza"

	
	
}