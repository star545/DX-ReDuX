if (vsp < 20)
	vsp += grav
x += hsp
y += vsp
angle += (sign(hsp) * 10)
if scr_solid(x, (y + 1))
{
	vsp = 0
	hsp = 0
	angle = 0
	if (sprite_index != spr_bombexplosion)
	{
		audio_falloff_set_model(audio_falloff_linear_distance)
		
		scr_soundeffect_at(sfx_explosion, x, y, 0, 900, 2000, 1.5, false, 1)
		image_index = 0
		sprite_index = spr_bombexplosion
	}
}
