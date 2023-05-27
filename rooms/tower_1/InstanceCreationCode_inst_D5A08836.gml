targetRoom = ruin_1
msg = "The Ancient Cheese"
level = "ruin"
tex_groups = ["ruingroup"]
details = [
gate_createlayer(spr_gate_ruin, get_level_pct(level) == 100 ? sprite_get_number(spr_gate_ruin) - 1 : 0),
gate_createlayer(spr_gate_ruin, 1),
gate_createlayer(spr_gate_ruin, 2, 1),
gate_createlayer(spr_gate_ruin, 3, 0.66),
gate_createlayer(spr_gate_ruin, 4, 0.33),
]
