targetRoom = graveyard_1
msg = "Wasteyard"
level = "graveyard"
tex_groups = ["graveyardgroup"]
sprite_index = spr_gate_wasteyard
details = [
gate_createlayer(spr_gate_wasteyard, get_level_pct(level) == 100 ? sprite_get_number(spr_gate_wasteyard) - 1 : 0 ),
gate_createlayer(spr_gate_wasteyard, 1),
gate_createlayer(spr_gate_wasteyard, 2, 0.5),
gate_createlayer(spr_gate_wasteyard, 3, 0),
gate_createlayer(spr_gate_wasteyard, 4, 0),
]
