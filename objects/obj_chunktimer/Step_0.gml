if (global.panic == true && !global.death_mode && global.fill > 0 && (!instance_exists(obj_ghostcollectibles)))
	global.fill--
if (global.fill <= 0 && !global.death_mode && global.panic == true && (!instance_exists(obj_pizzaface)))
{
	instance_create(obj_player1.x, obj_player1.y, obj_pizzaface)
	scr_soundeffect(sfx_pizzaface)
}
floor((global.fill / 100))
