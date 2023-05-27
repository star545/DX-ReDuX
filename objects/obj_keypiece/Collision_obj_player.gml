instance_destroy()
scr_soundeffect(sfx_secretfound)
if keyid != "invalid_key" global.pizzaboy_quest[? keyid] = 1
else show_message("Picked up a key that does not count toward the quest. Please report this so I can fix it ASAP!")
ds_map_secure_save(global.pizzaboy_quest, global.pizzaboy_name)
var cur = ds_map_size(global.pizzaboy_quest)
scr_controlprompt(string(cur) + " / 36 Key Pieces Collected	")
gamesave_async_save()
