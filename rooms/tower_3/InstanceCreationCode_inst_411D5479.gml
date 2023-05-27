targetRoom = forest_1
msg = "Gnome Forest"
level = "forest"
tex_groups = ["forestgroup"]
details = [
gate_createlayer(spr_gate_forest, get_level_pct(level) == 100 ? sprite_get_number(spr_gate_forest) - 1 : 0),
gate_createlayer(spr_gate_forest, 1),
gate_createlayer(spr_gate_forest, 2, 1),
gate_createlayer(spr_gate_forest, 3, 0.66),
gate_createlayer(spr_gate_forest, 4, 0.33),
]