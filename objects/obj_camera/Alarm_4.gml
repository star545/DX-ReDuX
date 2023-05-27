trace("ALARM 4")
with (obj_comboend)
{
	for (var i = 0; i < comboscore; i += comboscore)
		create_collect((obj_player1.x + irandom_range(-60, 60)), ((obj_player1.y - 100) + irandom_range(-60, 60)), choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect))
	comboscore = 0
	instance_destroy()
}
with (instance_create(830, 200, obj_comboend))
{
	combo = global.savedcombo
	var sfx_name = combo_sfx[clamp(floor(combo / 5), 0, 19)]
	var rname = asset_get_index(concat("sfx_comboend_", sfx_name))
	if !global.sugary scr_soundeffect(rname)
	comboscore = global.comboscore
	combominus = round((comboscore / 50))
}
global.comboscore = 0
global.savedcombo = 0
