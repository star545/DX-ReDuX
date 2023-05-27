if !active exit;
if !surface_exists(surf)
	surf = surface_create(200, 100)
else {
	surface_set_target(surf)
	draw_clear_alpha(c_black, 0)
	var timeinsecs = floor(time / (60))
	var mins = floor(timeinsecs / 60)
	var secs = timeinsecs % 60
	if secs < 10
		secs = concat("0", secs)
	draw_set_font(global.bigfont)
	draw_text(100, 50, concat(mins, ":", secs))
	surface_reset_target()
	var a = floor(show_time / (20))
	var b = a % 2 == 0
	if show_time == 0 b = 1
	var s = 200 * (1 + surfscale)
	draw_surface_ext(surf, 480 - (s/2), 440 - surfy, 1 + surfscale, 1 + surfscale, 0, c_white, b)
}

draw_set_font(global.font_small)
var ss = 200 * (1 + surfscale)
var alp = clamp(1 - (time_fx_y / -50), 0, 1)
draw_set_alpha(alp)
draw_text(380, 500 + time_fx_y, "+" + string(time_fx))