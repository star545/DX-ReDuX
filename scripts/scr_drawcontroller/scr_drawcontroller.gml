function get_dark(argument0, argument1)
{
	if argument1
	{
		var d = (room_width * room_height)
		var b = d
		var bb = b
		with (obj_lightsource)
		{
			var dis = distance_to_object(other)
			if (distance_to_object(other) < d)
			{
				bb = (dis / distance)
				if (bb < b)
				{
					b = bb
					d = dis
				}
			}
		}
		var t = ((b + 0.4) * 255)
		t = clamp(t, 0, 255)
		return make_color_rgb((color_get_red(argument0) - t), (color_get_green(argument0) - t), (color_get_blue(argument0) - t));
	}
	else
		return argument0;
}

function draw_sprite_ext_flash(spr, ind, xx, yy, xsc, ysc, ang, col, alp, col2 = col) {
	shader_reset()
	shader_set(aftimg_shader)
	var colorblend1 = shader_get_uniform(aftimg_shader, "blendcolor1");
	shader_set_uniform_f(colorblend1, color_get_red(col) / 255, color_get_green(col) / 255, color_get_blue(col) / 255)
	var colorblend2 = shader_get_uniform(aftimg_shader, "blendcolor2");
	shader_set_uniform_f(colorblend2, color_get_red(col2) / 255, color_get_green(col2) / 255, color_get_blue(col2) / 255)
    draw_sprite_ext(spr, ind, xx, yy, xsc, ysc, ang, c_white, alp);
    shader_reset()
    return;
}
function draw_self_flash(col, col2 = col) {
	shader_reset()
	shader_set(aftimg_shader)
	var colorblend1 = shader_get_uniform(aftimg_shader, "blendcolor1");
	shader_set_uniform_f(colorblend1, color_get_red(col) / 255, color_get_green(col) / 255, color_get_blue(col) / 255)
	var colorblend2 = shader_get_uniform(aftimg_shader, "blendcolor2");
	shader_set_uniform_f(colorblend2, color_get_red(col2) / 255, color_get_green(col2) / 255, color_get_blue(col2) / 255)
    draw_self()
    shader_reset()
    return;
}

function draw_sprite_ext_centerscale(_spr, _ind, _x, _y, _xscale, _yscale, _rot, _col, _alpha) {
    var _xoff = (sprite_get_xoffset(argument0) * image_xscale)
    var _yoff = (sprite_get_yoffset(argument0) * image_yscale)
    var _sprite_width = (sprite_get_width(argument0) * image_xscale)
    var _sprite_height = (sprite_get_width(argument0) * image_yscale)
    draw_sprite_ext(argument0, argument1, (argument2 - (((_sprite_width - _xoff) * (argument4 - image_xscale)) / 2)), (argument3 - (((_sprite_height - _yoff) * (argument5 - image_yscale)) / 2)), argument4, argument5, argument6, argument7, argument8)
    return;
}

function scr_draw_outline_ext(_spr, _ind, _x, _y, _xscale, _yscale, _rot, _ocol, _alpha, _othi) {
    var __xdirA = argument9
    var __xdirB = 0
    var __ydirA = 0
    var __ydirB = argument9
    if ((argument6 % 90) != 0)
    {
        __xdirA = lengthdir_x(argument9, argument6)
        __xdirB = lengthdir_x(argument9, (argument6 + 90))
        __ydirA = lengthdir_y(argument9, (argument6 + 90))
        __ydirB = lengthdir_y(argument9, argument6)
    }
    draw_sprite_ext_flash(argument0, argument1, (argument2 + __xdirA), (argument3 + __ydirA), argument4, argument5, argument6, _ocol, argument8)
    draw_sprite_ext_flash(argument0, argument1, (argument2 - __xdirA), (argument3 - __ydirA), argument4, argument5, argument6, _ocol, argument8)
    draw_sprite_ext_flash(argument0, argument1, (argument2 + __xdirB), (argument3 + __ydirB), argument4, argument5, argument6, _ocol, argument8)
    draw_sprite_ext_flash(argument0, argument1, (argument2 - __xdirB), (argument3 - __ydirB), argument4, argument5, argument6, _ocol, argument8)
    return;
}

function scr_draw_sprite_tiled_area(spr, s_img, _xx, _yy, _x1, _y1, _x2, _y2, _xscale, _yscale, OPT_col, OPT_alpha) {
    var sprite = argument[0]
    var subimg = argument[1]
    var xx = argument[2]
    var yy = argument[3]
    var x1 = argument[4]
    var y1 = argument[5]
    var x2 = argument[6]
    var y2 = argument[7]
    var xscale = argument[8]
    var yscale = argument[9]
    var col = (argument_count > 10 ? argument[10] : c_white)
    var alpha = (argument_count > 11 ? argument[11] : 1)
    var sw = (sprite_get_width(sprite) * xscale)
    var sh = (sprite_get_height(sprite) * yscale)
    var i = ((x1 - ((x1 % sw) - (xx % sw))) - (sw * (x1 % sw) < (xx % sw)))
    var j = ((y1 - ((y1 % sh) - (yy % sh))) - (sh * (y1 % sh) < (yy % sh)))
    var jj = j
    while (i <= x2)
    {
        while (j <= y2)
        {
            if (i <= x1)
                var left = (x1 - i)
            else
                left = 0
            var X = (i + left)
            if (j <= y1)
                var top = (y1 - j)
            else
                top = 0
            var Y = (j + top)
            if (x2 <= (i + sw))
                var width = (((sw - ((i + sw) - x2)) + 1) - left)
            else
                width = (sw - left)
            if (y2 <= (j + sh))
                var height = (((sh - ((j + sh) - y2)) + 1) - top)
            else
                height = (sh - top)
            draw_sprite_part_ext(sprite, subimg, left, top, width, height, X, Y, xscale, yscale, col, alpha)
            j += sh
        }
        j = jj
        i += sw
    }
    return 0;
}

function draw_text_outline(xx, yy, txt, ocol) {
    var resetcolor = draw_get_color()
    draw_set_color(argument3)
    draw_text((argument0 - 1), argument1, argument2)
    draw_text((argument0 - 1), (argument1 - 1), argument2)
    draw_text((argument0 - 1), (argument1 + 1), argument2)
    draw_text((argument0 + 1), argument1, argument2)
    draw_text((argument0 + 1), (argument1 + 1), argument2)
    draw_text((argument0 + 1), (argument1 - 1), argument2)
    draw_text(argument0, (argument1 + 1), argument2)
    draw_text(argument0, (argument1 - 1), argument2)
    draw_set_color(resetcolor)
    draw_text(argument0, argument1, argument2)
    return;
}

