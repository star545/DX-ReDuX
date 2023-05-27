if ((!other.active) && active && other.id == webID)
{
	other.active = 1
	other.sprite_index = spr_spiderwebreform
	other.image_index = 0
	image_index = 0
	audio_falloff_set_model(audio_falloff_linear_distance)
	scr_soundeffect_at(sfx_spiderfix, x, y, 0, 300, 900, 1.5, false, 1)
	sprite_index = spr_spider_build
	active = 0
	create_particle(other.x, other.y, particle.genericpoofeffect, 0)
}
