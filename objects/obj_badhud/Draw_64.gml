
var tv_x = 832
var tv_y = 74
var alpha = 1

if global.option_funnyhud
	drawing = true
if (instance_exists(obj_debugcontroller) && (!obj_debugcontroller.showhud))
	drawing = false
// copied directly from the TV code, i dont have a flying fuck of an idea what to do if this doesnt work
if (room == SPOOK || room == Realtitlescreen or room == rm_eggplantdisclaimer or room == rank_room or room == rm_levelselect or room == timesuproom or room == boss_room1 or room == characterselect or room == hub_loadingscreen)
{
	drawing = false
}


if drawing {

#region OLD CAMERA
	shader_set(global.Pal_Shader)
	player_palette()
	var pep_head_x = 145
	var pep_head_y = 95 
	if character == "PEPPINO" {
		draw_sprite_ext(pepheadspr, pepheadindex, pep_head_x, pep_head_y, 1, 1, 0, c_white, alpha)
	}
	else if character == "THE NOISE" {
		draw_sprite_ext(noisespr, noiseindex, pep_head_x, pep_head_y, 1, 1, 0, c_white, alpha)
	}
	else if character == "PIZZELLE" {
		draw_sprite_ext(pizzyheadspr, pizzyheadindex, pep_head_x, pep_head_y, 1, 1, 0, c_white, alpha)
	}
	else if character == "SNICK" {
		draw_sprite_ext(snickspr, snickindex, pep_head_x, pep_head_y, 1, 1, 0, c_white, alpha)
	}
	shader_reset()
	draw_sprite_ext(speedbarspr, speedbarindex, pep_head_x, pep_head_y + 40, 1, 1, 0, c_white, alpha)
	
#endregion


#region OLD TIMER
if (global.panic && !global.death_mode) {
var _ttx = 480
var _tty = 80
	var timeinsecs = floor(targetfill / (60))
	var mins = floor(timeinsecs / 60)
	var secs = timeinsecs % 60
	if secs < 10
		secs = concat("0", secs)
	draw_set_font(global.bigfont)
	draw_set_halign(fa_center)
	draw_text(_ttx, _tty, concat(mins, ":", secs))
}
#endregion

#region OLD TV
            drawx = (832)
            drawy = (74)
            drawx2 = (750)
            drawy2 = (-14)
            draw_set_font(global.bigfont)
            draw_set_halign(fa_center)
            draw_set_color(c_white)
			draw_sprite(spr_stylepizzabox, box_index, drawx + 1, drawy + 65)
			draw_text(xi, yi, message)
            if (global.combo != 0 && global.miniboss == 0 && global.combotime != 0 && (tvsprite == spr_tvdefault || tvsprite == spr_tvcombo))
            {
                var combotimer = (global.combotime / 60)
                var xoffset = clamp((sprite_get_width(spr_tvdefault) * combotimer), 13, sprite_get_width(spr_tvdefault))
                if (xoffset <= 13)
                    draw_sprite_ext(spr_tvdefault, -1, drawx, drawy, 1, 1, 0, c_white, alpha)
                else
                    draw_sprite_part_ext(spr_tvdefault, -1, (sprite_get_width(spr_tvdefault) * combotimer), 0, sprite_get_width(spr_tvdefault), sprite_get_height(spr_tvdefault), (drawx2 + xoffset), drawy2, 1, 1, c_white, alpha)
                draw_sprite_part_ext(tvsprite, -1, 0, 0, (sprite_get_width(tvsprite) * combotimer), sprite_get_height(tvsprite), drawx2, drawy2, 1, 1, c_white, alpha)
                if (room != strongcold_endscreen && global.combotime <= 0)
                {
                   if ((tvsprite == spr_tvdefault) && ((room != strongcold_endscreen) && (global.miniboss == 0)))
					   draw_text(tv_x, tv_y - 14, global.collect)
                }
                else if (room != strongcold_endscreen && global.combotime > 0)
                {
                    draw_sprite_ext(spr_tvcombotext, -1, 832, 74, 1, 1, 0, c_white, 1)
                    draw_text(852, 75, string_hash_to_newline(global.combo))
                }
            }
            else if (room != strongcold_endscreen)
                draw_sprite_ext(tvsprite, -1, drawx, drawy, 1, 1, 0, c_white, alpha)
            if (tvsprite == spr_tvdefault && room != strongcold_endscreen && global.miniboss == 0 && global.combo == 0)
            {
                chose = 0
            }
		if ((tvsprite == spr_tvdefault) && ((room != strongcold_endscreen) && (global.miniboss == 0)))
			draw_text(tv_x, tv_y - 14, global.collect)
	draw_sprite_ext(asset_get_index("spr_shieldbar" + string(obj_player.pizzashield)), -1, tv_x, tv_y + 170, 1, 1, 0, barblend, alpha)
#endregion
}