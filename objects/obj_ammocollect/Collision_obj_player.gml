if (sprite_index == spr_bulletHUD && global.bullet < 10)
{
	global.bullet += 1
	with (instance_create(x, y, obj_smallletters))
		letters = "BULLET"
	instance_destroy()
}
if (sprite_index == spr_fuelHUD && global.fuel < 10)
{
	global.fuel += 1
	with (instance_create(x, y, obj_smallletters))
		letters = "FUEL"
	instance_destroy()
}
if (sprite_index == spr_pizzashield_collectible)
{
	instance_create(x, y, obj_pizzashield_collectible)
	with (instance_create(x, y, obj_smallletters))
		letters = ("PIZZASHIELDS: " + string(obj_player.pizzashield + 1))
	instance_destroy()
}
