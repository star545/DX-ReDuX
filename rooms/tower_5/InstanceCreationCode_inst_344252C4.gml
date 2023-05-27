targetRoom = chateau_1
msg = "Pizzascare"
level = "chateau"
tex_groups = ["chateaugroup"]
sprite_index = spr_gate_chateau
details = [
gate_createlayer(spr_gate_chateau, get_level_pct(level) == 100 ? sprite_get_number(spr_gate_chateau) - 1 : 0),
gate_createlayer(spr_gate_chateau, 1),
gate_createlayer(spr_gate_chateau, 2, 1),
gate_createlayer(spr_gate_chateau, 3, 0.66),
gate_createlayer(spr_gate_chateau, 4, 0.33),
gate_createlayer(spr_gate_chateau, 5, 0),
]
