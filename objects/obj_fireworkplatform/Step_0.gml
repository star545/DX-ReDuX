if y != targety y += vsp
if vsp >= 1 { 
	vsp -= 1 
	sprite_index = spr_fireworkplatform_on
	scr_soundeffect_3d(sfx_firemouthambience)
}
else sprite_index = spr_fireworkplatform_off