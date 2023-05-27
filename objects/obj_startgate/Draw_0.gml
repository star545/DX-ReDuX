draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)

var xLeft = x - sprite_get_xoffset(sprite_index)
var yTop = y - sprite_get_yoffset(sprite_index)
var gate = details[0]
var mask = details[1]
if !global.option_performance {
	if !surface_exists(surf)
		surf = surface_create(sprite_width, clamp(y_crop, 1, sprite_height))
	else {	
		surface_resize(surf, sprite_width, clamp(y_crop, 1, sprite_height))
		surface_set_target(surf)
		var yy = y_crop
			draw_clear_alpha(c_black, 0)
			draw_set_color(c_white)
			draw_rectangle(0, 0, sprite_width, sprite_height, false)
			//draw_set_alpha(1)	
			for (var i = array_length(details) - 1; i > 1; i--) {
				//var ri = i - 2
				var _layer = details[i]
				with _layer {
					if func != -4 {
						func()		
					}
					x += hspeed
					y += vspeed
					image_index += image_speed
					draw_sprite_tiled_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_blend, image_alpha)
				}
				//draw_sprite_tiled(sprite_index, i, bg_x[ri], bg_y[ri])	
			}
		
		
			// Draw White
			draw_set_alpha(fade)
			gpu_set_colorwriteenable(true, true, true, false);
			if show_fade
			draw_rectangle(0, 0, sprite_width, sprite_height, false)
			draw_set_alpha(1)
			gpu_set_colorwriteenable(true, true, true, true);
			if closed draw_sprite_tiled(spr_gate_closed, 0, 0, 0)
			// Gate Mask
			gpu_set_blendmode(bm_subtract)
			with mask {
				if func != -4 {
					func()		
				}
				x += hspeed
				y += vspeed
				image_index += image_speed
				draw_sprite_tiled_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_blend, image_alpha)
			}
			gpu_set_blendmode(bm_normal)
		
			with gate {
				if func != -4 {
						func()		
				}
				x += hspeed
				y += vspeed
				image_index += image_speed
				draw_sprite_tiled_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_blend, image_alpha)
			}


		
		surface_reset_target()
	}
	if (surface_exists(surf)) {
		var shake = state == states.transitioncutscene ? random_range(-3, 3) : 0
		draw_surface(surf, xLeft + shake, yTop + (sprite_height - y_crop))
		
	}
} else {
	if surface_exists(surf) surface_free(surf)
	var a = gate.sprite_index
	var low_perf = asset_get_index(concat(sprite_get_name(a), "lowperf"))
	sprite_index = sprite_exists(low_perf) ? low_perf : spr_entrancegatelowperf
	image_index = get_level_pct(level) == 100
	draw_self()
	
	
}


//draw_sprite(sprite_index, 0, x, y)
var tpnY = y - 277
draw_set_font(global.bigfont)

	

if drawing && !closed
{
	if !arena {
		var use_time = mode && death_rank != -4 ? death_time : best_time
		var milisecs = use_time % 60
		var timeinsecs = floor(use_time / (60))
		var mins = floor(timeinsecs / 60)
		var secs = timeinsecs % 60
		if secs < 10 secs = concat("0", secs)
		if mins < 10 mins = concat("0", mins)
		if milisecs < 10 milisecs = concat("0", milisecs)
		var timer = concat(mins, ":", secs, ".", milisecs)
		var use_highscore = mode && death_rank != -4 ? death_highscore : highscore
	
	
	    if use_highscore != 0 draw_text_scribble(x , tpnY - 75, string(use_highscore) + "[spr_tomatocollect, 0, 0.35]")
	    if timer != "00:00.00" draw_text_scribble(x , tpnY - 40, string(timer) + "[spr_escapecollect, 0, 0.35]")
	
		if percent != 0 draw_text(x, tpnY - 5 , string(percent) + "%")
		var _xx = death_rank == -4 ? x : x - 50
		if rank != -4 { 
			draw_sprite(spr_normal_ranks, rank_as_num, _xx, tpnY - 140)
			draw_sprite_ext(treasure_spr, treasure_index, x - 155, tpnY - 40, 1, 1, 0, has_treasure ? c_white : c_black, 1)
		}
		if death_rank != -4 draw_sprite(spr_death_ranks, death_as_num, x + 50, tpnY - 140)
	} else {
		var use_time = arena_time
		var milisecs = use_time % 60
		var timeinsecs = floor(use_time / (60))
		var mins = floor(timeinsecs / 60)
		var secs = timeinsecs % 60
		if secs < 10 secs = concat("0", secs)
		if mins < 10 mins = concat("0", mins)
		if milisecs < 10 milisecs = concat("0", milisecs)
		var timer = concat(mins, ":", secs, ".", milisecs)
		
		if rank != -4 { 
			draw_sprite(spr_normal_ranks, rank_as_num, x, tpnY - 140)
			//draw_sprite_ext(treasure_spr, treasure_index, x - 155, tpnY - 40, 1, 1, 0, has_treasure ? c_white : c_black, 1)
		}
		if arena_highscore != 0 draw_text_scribble(x , tpnY - 75, string(arena_highscore) + "[spr_tomatocollect, 0, 0.35]")
	    if arena_time != "00:00.00" draw_text_scribble(x , tpnY - 40, string(timer) + "[spr_escapecollect, 0, 0.35]")
		if arena_round != 0 draw_text(x, tpnY - 5 , string(arena_round) + " ROUNDS")
		
	}
}
if state == states.options {
	draw_sprite(spr_attackselect, mode, x, y)
}