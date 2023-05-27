
set_music = -4
tower = 0
if room = tower_finalhallway tower = 1
if tower with obj_drawcontroller { force_dark = 1 event_perform(ev_other, ev_room_start) }
hitx = x
hity = y
if !audio_is_playing(sfx_jon)
	scr_soundeffect_loop(sfx_jon)
debris_type = irandom(1)
debris_spr = [spr_johnDebris_break, spr_johnDebris_shatter]
debris_detail[0] = [
[41, 101],
[3, 10],
[-20, -62],
[-22, 215],
]
debris_detail[1] = [
[-22, -24],
[-20, -89],
[45, -84],
[57, -68],
[-41, -50],
[-10, -51],
[29, -52],
[-3, 21],
[-39, 81],
[27, 83],
]