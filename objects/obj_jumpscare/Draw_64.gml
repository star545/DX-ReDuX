switch state
{
	case 0:
	case 2:
		draw_sprite(sprite_index, image_index, 0, 0)
		break
	case 1:
		var p = 4
		var t = 0
		if (yy > p)
			yy -= 32
		else
		{
			yy = p
			t = p
		}
		draw_sprite(spr_monsterjumpscarebg, 0, 0, 0)
		var td_spr = spr_3dshroom
		switch monsterid {
			default: td_spr = spr_3dshroom break;	
			case 1: td_spr = spr_3dcheese break;	
			case 2: td_spr = spr_3dtomato break;	
			case 3: td_spr = spr_3dsausage break;	
			case 4: td_spr = spr_3dpineapple break;	
		}
		if !threedee draw_sprite(spr_monsterjumpscare, monsterid, (0 + irandom_range((-t), t)), (yy + irandom_range((-t), t)))
		else draw_sprite(td_spr, td_index, 0, 0)
		if oktoberfest
		{
			draw_sprite(spr_oktoberfestbg, 0, 0, 0)
			draw_sprite(spr_oktoberfest, 0, 0, 0)
		}
		break
}

