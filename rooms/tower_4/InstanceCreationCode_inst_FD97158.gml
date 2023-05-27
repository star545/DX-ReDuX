john = true
closedspr = spr_towerdoor4closed
visitedspr = spr_towerdoor4
normalspr = visitedspr
targetRoom = tower_pizzaboy4
if get_keypieces() < 25 {
	sprite_index = closedspr
	locked = true
	
}