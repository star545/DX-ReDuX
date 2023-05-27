if global.comboscore > 0 {
	global.comboscore -= removal_amt 
	var a = get_chardetail("collect")
	create_collect(obj_player1.x, obj_player1.y, choose(a[irandom(array_length(a) - 1)]));
	if global.comboscore < 0 {
		global.comboscore = 0
		removal_amt = 100	
	}
	else { 
		alarm[2] = 1
		removal_amt += 100	
	}
}