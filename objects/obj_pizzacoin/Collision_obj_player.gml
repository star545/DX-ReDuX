global.pizzacoin += 1
quick_ini_write_real("Collectibles", "pizzacoin", global.pizzacoin)
if audio_is_playing(sfx_pizzacoin)
	audio_stop_sound(sfx_pizzacoin)
scr_soundeffect(sfx_pizzacoin)
with instance_create(x, y, obj_pizzacoinindicator)
	show = 120
instance_destroy()
