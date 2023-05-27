//visible = obj_tv.visible
var pop = set_pop[global.stylethreshold, 1]
var idle = set_pop[global.stylethreshold, 0]
var pop2 = set_pop2[global.stylethreshold, 1]
var idle2 = set_pop2[global.stylethreshold, 0]


if (global.style > 55 && global.stylethreshold < 3)
{
	global.stylethreshold += 1
	global.style = (global.style - 55)
	pop = set_pop[global.stylethreshold, 1]
	idle = set_pop[global.stylethreshold, 0]
	pop2 = set_pop2[global.stylethreshold, 1]
	idle2 = set_pop2[global.stylethreshold, 0]

	index = 0
	sprite = pop
	shit = pop2
	//scr_heatup()
}
if (global.style < 0 && global.stylethreshold != 0)
{
	global.stylethreshold -= 1
	global.style = (global.style + 55)
	pop = set_pop[global.stylethreshold, 1]
	idle = set_pop[global.stylethreshold, 0]
	pop2 = set_pop2[global.stylethreshold, 1]
	idle2 = set_pop2[global.stylethreshold, 0]

	index = 0
	sprite = pop
	shit = pop2
	//scr_heatdown()
}
if anim_end(sprite_get_number(sprite), index) {
	sprite = idle
	shit = idle2	
}
if (global.style < 0 && global.stylethreshold == 0)
	global.style = 0
if (global.stylethreshold == 3 && global.style > 55)
	global.style = 55
visible = obj_tv.visible
if (obj_player.y < 200)
	alpha = 0.3
else if (!((room == rank_room or room == timesuproom or room == boss_room1 or room == Realtitlescreen or room == characterselect)))
	alpha = 1
index += 0.35
global.stylemultiplier = ((global.style + (global.stylethreshold * 55)) / 220)
