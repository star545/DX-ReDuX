perk_id.func()
array_push(percs, current_perk)
scr_soundeffect_3d(sfx_buyweapon)
current_perk++
if current_perk < array_length(percs) && !final {
	perk_id = perk[percs[current_perk]]
	var mult = power(current_perk, 1.6) * 0.03
	perk_id.cost *= (1 + mult)
	perk_id.cost = round(perk_id.cost)
}

