barflash = 0
barblend = image_blend
image_speed = 0.1
var a = object_index
if (instance_number(a) > 1) {
	var _first = instance_find(a, 0);
	if (id != _first) {
		instance_destroy(); 
		exit; 
	}
}
pshown = false
snickspr = spr_snickHUD
chose = 0
message = ""
showtext = 0
tvsprite = spr_tvdefault
noisesprite = spr_noiseHUD_idle
targetfill = 0
xi = 125
yi = 95
pepheadindex = 0
pepheadspr = spr_pepinoHUD
pizzyheadspr = spr_pizzyHUD
pizzyheadindex = 0
noiseindex = 0
snickindex = 0
noisespr = spr_pepinoHUD
speedbarspr = spr_speedbar
speedbarindex = 0
box_index = 0
imageindexstore = 0
once = 0
alpha = 1
pshown = 0
shownranks = 0
shownranka = 0
shownrankb = 0
shownrankc = 0

if (obj_player.character == characters.peppino)
    character = "PEPPINO"
else if obj_player.character == characters.noise || obj_player.character == characters.jetpack_noise
    character = "THE NOISE"
else if obj_player.character == characters.pizzelle
	character = "PIZZELLE"
else if obj_player.character == characters.snick
	character = "SNICK"