switch negative
{
	case 0:
		draw_set_color(make_colour_rgb(255, 255, 255))
		break
	case 1:
		draw_set_color(make_colour_rgb(248, 0, 0))
		break
}

draw_set_font(global.smallfont)
draw_set_halign(fa_center)

	draw_text(x, y, letters)
