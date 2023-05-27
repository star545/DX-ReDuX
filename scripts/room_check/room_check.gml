function is_bossroom()
{
	return (room == boss_pepperman or room == boss_noise or room == boss_vigilante or room == boss_pizzaboy or room == boss_pizzaface or room == boss_pizzaface_p3);
}
function is_pizzaboyroom() {
	return (room == tower_secret6 || room == tower_pizzaboy1 || room == tower_pizzaboy2 || room == tower_pizzaboy3 || room == tower_pizzaboy4)
}
function is_hub() {
	var rooms = [
		tower_entrancehall,
		tower_1,
		tower_2,
		tower_3,
		tower_4,
		tower_5,
		tower_smipsfunhouse,
		tower_entrancesmip,
		tower_secret1,
		tower_secret2,
		tower_secret3,
		tower_secret4,
		tower_secret5,
		tower_secret6,
		tower_snick,
		tower_snick2,
		tower_top,
		tower_finale,
		tower_finale2,
		tower_greenroom,
		tower_quickwarp,
		tower_broomcloset,
		tower_arenatutorial,
		LoadLevelRoom,
		credits,
		Titlescreen,
		boss_pizzaboy
	]
	if string_starts_with(room_get_name(room), "tower") return true
	for (var i = 0; i < array_length(rooms); i++) {
		if room = rooms[i] return true			
	}
	return false
	
}