
var pir = number_in_range(obj_player1.x, 1152, 1856)

barfill_x -= 0.4
bell_index += 0.35

if (barfill_x < -23)
    barfill_x = 0
	
if (bell_index > (sprite_get_number(bell_sprite) - 1))
    bell_index = frac(bell_index)


if time > 0 && !dead {
	showtime_buffer = 100
	if number_in_range(obj_player1.x, 1152, 1856) timer_y = lerp(timer_y, timer_ystart, 0.1)
	else timer_y = lerp(timer_y, timer_ystart + 212, 0.1)
	if pir time -= 1
}
else {
	dead = true
	if (bell_sprite == spr_bosstimer_bell)
    {
		layer_change_background(bg_castle1, bg_castle1escape)
        bell_sprite = spr_bosstimer_hitbell
        bell_index = 0
    }
    else if (showtime_buffer > 0)
        showtime_buffer--
    else
        timer_y = Approach(timer_y, (timer_ystart + 212), 1)
	
	
}

time = clamp(time, 0, maxtime)
