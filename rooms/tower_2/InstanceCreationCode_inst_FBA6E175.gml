targetRoom = farm_2
msg = "Fun Farm"
level = "farm"
tex_groups = ["farmgroup"]
details = [
gate_createlayer(spr_gate_farm, get_level_pct(level) == 100 ? sprite_get_number(spr_gate_farm) - 1 : 0),
gate_createlayer(spr_gate_farm, 1),
gate_createlayer(spr_gate_farm, 2, 1),
gate_createlayer(spr_gate_farm, 3, 0.66),
gate_createlayer(spr_gate_farm, 4, 0.33),
]
