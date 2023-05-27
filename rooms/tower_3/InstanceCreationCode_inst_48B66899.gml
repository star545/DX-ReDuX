targetRoom = plage_entrance
msg = "Crust Cove"
level = "plage"
tex_groups = ["beachgroup"]
details = [
gate_createlayer(spr_gate_plage, get_level_pct(level) == 100 ? sprite_get_number(spr_gate_plage) - 1 : 0),
gate_createlayer(spr_gate_plage, 1),
gate_createlayer(spr_gate_plage, 2, 1),
gate_createlayer(spr_gate_plage, 3, 0.66),
gate_createlayer(spr_gate_plage, 4, 0.33),
]