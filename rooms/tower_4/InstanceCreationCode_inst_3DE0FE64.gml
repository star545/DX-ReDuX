targetRoom = industrial_1
msg = "Peppibot Factory"
level = "industrial"
tex_groups = ["factorygroup"]
details = [
gate_createlayer(spr_gate_industrial, get_level_pct(level) == 100 ? sprite_get_number(spr_gate_industrial) - 1 : 0),
gate_createlayer(spr_gate_industrial, 1),
gate_createlayer(spr_gate_industrial, 2, 1),
gate_createlayer(spr_gate_industrial, 3, 0.66),
gate_createlayer(spr_gate_industrial, 4, 0.33),
]