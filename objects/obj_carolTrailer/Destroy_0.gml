var arr = [
spr_pizzagoblin_dead,
spr_fencer_dead,
spr_sausageman_shot]
var i = 0
repeat (3) {
	var _x = ((i - 1) * 20)
	with (instance_create(x + _x, y, obj_sausageman_dead))
	{
		sprite_index = arr[i]
		canrotate = 1
	}	
	repeat (4) create_baddiedebris(x + _x)
	instance_create(x + _x, y, obj_parryeffect)
	i++
}