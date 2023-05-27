if use_dark
{
	for (var i = 0; i < array_length(objdark_arr); i++)
	{
		with (objdark_arr[i])
		{
			if visible
			{
				var b = get_dark(image_blend, other.use_dark)
				draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, b, image_alpha)
			}
		}
	}
}
if (obj_player1.finisher || (obj_player.state == states.playersuperattack && obj_player.superattackstate == states.transitioncutscene)) || (instance_exists(obj_johnhitstun) && room != tower_finalhallway)
	finisher_alpha = Approach(finisher_alpha, 0.3, 0.1)
else if (finisher_alpha > 0)
	finisher_alpha = Approach(finisher_alpha, 0, 0.02)
if (finisher_alpha > 0)
{
	draw_set_alpha(finisher_alpha)
	draw_rectangle_color(-32, -32, (room_width + 32), (room_height + 32), c_black, c_black, c_black, c_black, 0)
	draw_set_alpha(1)
}
var _kungfu = 1
with (obj_baddie)
{
	var _stun = 0
	var shake_x = 0, shake_y = 0
	var cur_pos = grabbedby == obj_player1 || grabbedby == obj_player2 ? ds_list_find_index(grabbedby.local_grab_list, id) : 0
	var grab_x = cur_pos > 0 ? sin(cur_time / 300) * (cur_pos * 2) : 0
	if (state == states.stun && thrown == false ) || (state = states.grabbed && obj_player1.character == characters.pizzelle) || (state == states.hit && sprite_index = stunfallspr)
		_stun = 25
	if (state == states.hit && (mach3destroy || instakilled)) || shake_timer > 0 || state = states.lungeattack {
		shake_x = random_range(-6, 6)
		shake_y = random_range(-6, 6)
		
	}
	draw_set_alpha(0.33)
	if object_index == obj_soldier_sniper && use_heat() && state != states.walk && state != states.stun && state != states.hit && state != states.scared {
		var col = collision_line(x, y, (image_xscale == 1 ? room_width : 0), y, obj_solid, false, true)
		var col2 = collision_line(x, y, plyr.x, plyr.y, obj_player, false, true)
		var in_sight = (image_xscale == 1 ? (plyr.x > x) : (plyr.x < x)) && number_in_range(y, plyr.bbox_top, plyr.bbox_bottom)
		var end_point = (image_xscale == 1 ? room_width : 0)
		if col2 < 0 && in_sight {
			end_point = plyr.x
			//draw_sprite_ext(spr_soldier_laser, 0, plyr.x, y, -image_xscale, 1, 0, c_white, 1)		
		} else if col > 0 {
			
			end_point = col.x + col.sprite_width
			
		}
		if end_point != -4 draw_rectangle_color(x, y - 1, end_point, y, c_red, c_red, c_red, c_red, 0)
		
	}
	draw_set_alpha(1)
	
	if (visible && object_index != obj_pizzaball && bbox_in_camera(view_camera[0], 32))
	{
		var c = image_blend
		if on_fire c = #ec5508
		b = get_dark(c, other.use_dark)
		shader_set(global.Pal_Shader)
		//if (object_index == obj_peppinoclone && !flash) player_palette()
		if (usepalette && !flash) pal_swap_set(spr_palette, paletteselect, 0)
		
		if !flash draw_sprite_ext(sprite_index, image_index, x + shake_x + grab_x, (y + _stun - shake_y), (xscale * image_xscale), yscale, angle, b, image_alpha)
		else draw_sprite_ext_flash(sprite_index, image_index, x + shake_x + grab_x, (y + _stun - shake_y), (xscale * image_xscale), yscale, angle, c_white, image_alpha)
		var _hp = hp / maxhp
		if elite
			_hp = elitehit / maxelitehit
			
		if _kungfu
		{
			if (hp > maxhp)
				maxhp = hp
			if (elitehit > maxelitehit)
				maxelitehit = elitehit
			
		}
		if (object_index == obj_peppinoclone or usepalette)
			shader_reset()
		if _hp > 0 && _hp < 1 && (state != states.hit || shownHealth) && destroyable {
				if state != states.hit shownHealth = true
				//draw_healthbar((x - 16), (y - 50), (x + 16), (y - 45), (_hp * 100), c_black, c_red, c_red, 0, 1, 1)
				var pos = [x, y]
				if state = states.hit {
					pos[0] += random_range(-6, 6)	
					pos[1] += random_range(-6, 6)	
				}
				var w = 70 * (_hp)
				
				
				draw_sprite_part_ext(spr_healthbar, 5, 17, 0, w, 121, pos[0] + 42, pos[1] - 62, -1, 1, c_white, 1)
				draw_sprite(spr_healthbar, 3, pos[0], pos[1])	
				draw_sprite(spr_healthbar, _hp <= 0.5 ? 1 : 0, pos[0], pos[1])	
			}	
		if (object_index == obj_hamkuff)
		{
			if (state == states.blockstance && instance_exists(playerid))
			{
				var x1 = (x + 3)
				var y1 = (y + 30)
				if (sprite_index == spr_hamkuff_chain2)
				{
					x1 = (x + 7)
					y1 = (y + 33)
				}
				var dis = point_distance(x1, y1, playerid.x, playerid.y)
				var w = 24
				var len = (dis div w)
				var dir = point_direction(x1, y1, playerid.x, (playerid.y + 16))
				var xx = lengthdir_x(w, dir)
				var yy = lengthdir_y(w, dir)
				for (i = 0; i < len; i++)
					draw_sprite_ext(spr_hamkuff_sausage, -1, (x1 + (xx * i)), (y1 + (yy * i)), 1, 1, dir, b, 1)
			}
		}
	}
}
shader_set(global.Pal_Shader)
with (obj_sausageman_dead)
{
	if (visible && bbox_in_camera(view_camera[0], 32))
	{
		if use_player_palette 
			player_palette()
		else 
			pal_swap_set(spr_palette, paletteselect, 0)
		b = get_dark(image_blend, other.use_dark)
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, b, image_alpha)
	}
}
with (obj_heatafterimage)
{
	if visible
	{
		pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, 0)
		draw_sprite_ext(obj_player1.sprite_index, obj_player1.image_index, x, y, obj_player1.xscale, obj_player1.yscale, 1, c_white, alpha)
	}
}
with (obj_player2)
{
	if (visible && bbox_in_camera(view_camera[0], 32))
	{
		pal_swap_set(spr_palette, paletteselect, 0)
		b = get_dark(image_blend, other.use_dark)
		draw_sprite_ext(sprite_index, image_index, x, y, (xscale * scale_xs), (yscale * scale_ys), image_angle, b, image_alpha)
	}
}
shader_reset()

if (obj_player1.state = states.bossdefeat)
	dead_alpha = Approach(dead_alpha, 1, 0.02)
else if (dead_alpha > 0)
	dead_alpha = Approach(dead_alpha, 0, 0.02)
if (dead_alpha > 0)
{
	draw_set_alpha(dead_alpha)
	draw_rectangle_color(-32, -32, (room_width + 32), (room_height + 32), c_black, c_black, c_black, c_black, 0)
	draw_set_alpha(1)
}



with (obj_player1)
{
	if (visible && bbox_in_camera(view_camera[0], 32))
	{
		
		var _p_shakex = 0, _p_shakey = 0
		if state = states.chainsaw {
			_p_shakex = random_range(-4, 4)
			_p_shakey = random_range(-4, 4)
		}
		var height = max(sprite_get_height(spr_peppalette),sprite_get_height(spr_guspalette),sprite_get_height(spr_noisepalette))
		var real_char = character
		if isgustavo real_char = characters.gus
		var _pal = get_chardetail("palette",,real_char)
		var _p = 0
		if !surface_exists(custom_pep_surf)	{
			
			custom_pep_surf = surface_create(2, height)	
			surface_set_target(custom_pep_surf)	
			draw_clear_alpha(c_white,0)
			pal_swap_draw_palette(_pal,0,0,0)
			pal_swap_draw_palette(_pal, 1,1,0)
			var p = 0
			var arr = global.color_array[real_char][custom_slot]
			for (_p = 0; _p < array_length(arr); _p++) {
				//trace(arr[_p])
				var c = make_color_rgb(arr[_p].r, arr[_p].g, arr[_p].b)
				draw_point_color(1, _p, c)	
		
			}
			surface_reset_target();	
			custom_update = false
		} else if custom_update {
			surface_set_target(custom_pep_surf)	
			draw_clear_alpha(c_white,0)
			pal_swap_draw_palette(_pal,0,0,0)
			pal_swap_draw_palette(_pal, 1,1,0)
			var p = 0
			var arr = global.color_array[real_char][custom_slot]
			for (_p = 0; _p < array_length(arr); _p++) {
				//trace(arr[_p])
				var c = make_color_rgb(arr[_p].r, arr[_p].g, arr[_p].b)
				draw_point_color(1, _p, c)	
		
			}
			surface_reset_target();	
			custom_update = false
			
			
			//pal_swap_set(custom_pep_surf, 1, true)
			
			
		}
		

		if !flash {
			shader_set(global.Pal_Shader)
			player_palette()
		}
		b = get_dark(image_blend, other.use_dark)
		var _string = sprite_get_name(sprite_index)
        var _shotgunspr = string_pos("shotgun", _string)
        if (shotgunAnim && _shotgunspr == 0)
            draw_sprite_ext(spr_shotgunback, 0, (x - (xscale * 7) + _p_shakex), (y + 15 + _p_shakey), (xscale * scale_xs), (yscale * scale_ys), angle, b, image_alpha)	
		if draw_uparrow >= 0
			draw_sprite_ext(spr_uparrow, draw_uparrow, x, y - 50, 1, 1, 1, c_white, 1)
			
		
		var ps = global.peterplusmode && sprite_exists(drawn_sprite) ? drawn_sprite : sprite_index
		if !flash draw_sprite_ext(ps, image_index, x + _p_shakex, y + _p_shakey, (xscale * scale_xs), (yscale * scale_ys), angle, b, image_alpha)
		else draw_sprite_ext_flash(ps, image_index, x + _p_shakex, y + _p_shakey, (xscale * scale_xs), (yscale * scale_ys), angle, c_white, image_alpha)
		
		shader_reset()
		//if surface_exists(custom_pep_surf) draw_surface_ext(custom_pep_surf, x - 100, y - 100, 15, 15, 0, c_white, 1)

	}
}

