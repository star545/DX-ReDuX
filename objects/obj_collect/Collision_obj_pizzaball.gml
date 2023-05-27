if (room == rm_editor)
	exit;
var a = get_chardetail("sfx", "collect")
for (var i = 0; i < array_length(a); i++) audio_stop_sound(a[i])
scr_soundeffect(a[irandom(array_length(a) - 1)])
if (obj_player1.character == "V")
	global.playerhealth = clamp((global.playerhealth + 1), 0, 100)
global.heattime += 10
global.heattime = clamp(global.heattime, 0, 60)
global.combotime += 10
global.combotime = clamp(global.combotime, 0, 60)
with (obj_camera)
	healthshaketime = 30
var val = heat_calculate(10)
global.collect += val
create_collect(x, y, sprite_index)
with (instance_create((x + 16), y, obj_smallnumber))
	number = string(val)
instance_destroy()
