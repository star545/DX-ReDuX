var cam = new camera_get_position_struct(view_camera[0])

if global.option_funnyhud
	drawing = true
if (instance_exists(obj_debugcontroller) && (!obj_debugcontroller.showhud))
	drawing = false
// copied directly from the TV code, i dont have a flying fuck of an idea what to do if this doesnt work
if (room == Realtitlescreen or room == rm_eggplantdisclaimer or room == rank_room or room == rm_levelselect or room == timesuproom or room == boss_room1 or room == characterselect or room == hub_loadingscreen)
{
	drawing = false
}


if drawing {
var i = 0

#region OLD TV
var alpha = 1
var px = obj_player1.x - cam.cam_x
var py = obj_player1.y - cam.cam_y

draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
var tv_x = 845
var tv_y = 80
draw_sprite(spr_stylepizzabox, box_index, tv_x + 1, tv_y + 65)
draw_sprite_ext(tvsprite, -1, tv_x, tv_y, 1, 1, 1, c_white, alpha)
// how the fuck do i do depth. how do i do it i want the D3 COMBO GRAA draw_sprite_part(spr_tvcombo, -1, global.combotime, 1, 1, 1, x, y)
draw_text(xi, yi, message)
if ((global.combo != 0) && ((global.combotime != 0) && ((tvsprite == spr_tvdefault) || (tvsprite == spr_tvcombo))))
    draw_text(tv_x + 20, tv_y + 1, global.combo)
if ((tvsprite == spr_tvdefault) && ((room != strongcold_endscreen) && (global.miniboss == 0)))
	draw_text(tv_x, tv_y - 14, global.collect)
	
draw_sprite(spr_stylepizzadown, global.stylethreshold, tv_x + 1, tv_y + 65)	
var cutoff2 = (global.style / 55) * 51
draw_sprite_part(spr_stylepizza, global.stylethreshold, 0, 0, 164, cutoff2, tv_x - 81, tv_y + 40)
draw_sprite_ext(asset_get_index("spr_shieldbar" + string(obj_player.pizzashield)), -1, tv_x, tv_y + 170, 1, 1, 0, barblend, alpha)
#endregion

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
end