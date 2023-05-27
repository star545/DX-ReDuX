targetRoom = mansion_start
msg = "Meat Lover's Mansion"
level = "mansion"
tex_groups = ["mansiongroup"]
details = [
gate_createlayer(spr_gate_mansion, get_level_pct(level) == 100 ? sprite_get_number(spr_gate_mansion) - 1 : 0),
gate_createlayer(spr_gate_mansion, 1),
gate_createlayer(spr_gate_mansion, 2, 1),
gate_createlayer(spr_gate_mansion, 3, 0.66),
gate_createlayer(spr_gate_mansion, 4, 0.33),
]