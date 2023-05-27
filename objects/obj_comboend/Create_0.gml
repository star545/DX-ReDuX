combo_sfx = [
"lame",
"cheesy",
"notbad",
"gettingsomewhere",
"nice",
"cheflike",
"brutal",
"evil",
"unclean",
"disturbing",
"twisted",
"toomuch",
"psychotic",
"illwilled",
"crushing",
"delirious",
"funny",
"unfunny",
"elegant",
"enough",
]

combo = 0
comboscore = 0
combominus = 0
timer_max = 1
timer = 0
title_index = 0
depth = obj_tv.depth - 1
alarm[0] = 1
scr_soundeffect(sfx_comboend)
with (obj_player)
{
	if (!(place_meeting(x, y, obj_exitgate)))
		global.combodropped = 1
}
