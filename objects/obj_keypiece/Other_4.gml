if !is_undefined(global.pizzaboy_quest[? keyid]) && global.pizzaboy_quest[? keyid] == true instance_destroy()
if get_keypieces() < keyr instance_destroy()
if quick_ini_read_real("BabyPeppino", "progress", 0) < progressr instance_destroy()