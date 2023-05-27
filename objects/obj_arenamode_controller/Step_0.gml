var enem_left = 0
var proceed_bad = true
with obj_baddie {
	if arenaID != -4 {
		proceed_bad = false
		enem_left++	
	}
}
var proceed_spawner = 1

with obj_arenaspawner {
	if current_enem < array_length(enemy_array) proceed_spawner = false
	enem_left += (array_length(enemy_array) - current_enem)
}
enemies_left = enem_left	


if proceed_bad && proceed_spawner && showround = 0 {
	showround = 1
	time = 2100
	player_hp = player_hp_max
	alarm[0] = 120
	alarm[1] = 20
	obj_player1.can_auto_parry = 1
	instance_destroy(obj_ammocollect)
}


maxtime = 2100 + (global.waterskin * 50)
var timermv = 2.1
timermv += (global.arenaintensity / 9)
timermv = round(timermv)
if global.arena_perks.time timermv /= 1.5
if time > 0 && !showround && global.arenaphase != 1 {
	time -= timermv
	
	
}

barfill_x -= 0.4
bell_index += 0.35

if (barfill_x < -23)
    barfill_x = 0
	
if (bell_index > (sprite_get_number(bell_sprite) - 1))
    bell_index = frac(bell_index)


if time > 0 {
	if instance_exists(obj_pizzaface) instance_destroy(obj_pizzaface)
	bell_sprite = spr_bosstimer_bell
	showtime_buffer = 100
	if global.arenaphase > 1 timer_y = lerp(timer_y, timer_ystart, 0.1)
	else timer_y = lerp(timer_y, timer_ystart + 212, 0.1)
}
else {
	dead = true
	if (bell_sprite == spr_bosstimer_bell)
    {
        bell_sprite = spr_bosstimer_hitbell
        bell_index = 0
    }
    else if (showtime_buffer > 0)
        showtime_buffer--
    else
        timer_y = Approach(timer_y, (timer_ystart + 212), 1)
	
	
}
if (dead && (!instance_exists(obj_pizzaface)))
{
    instance_create(obj_player1.x, obj_player1.y, obj_pizzaface)
    scr_soundeffect(sfx_pizzaface)
}
time = clamp(time, -500, maxtime)
global.arenaintensity = floor(global.arenaphase / 3)