targetRoom = war_1
msg = "War"
level = "war"
tex_groups = ["wargroup"]
details = [
gate_createlayer(spr_gate_war, get_level_pct(level) == 100 ? sprite_get_number(spr_gate_war) - 1 : 0),
gate_createlayer(spr_gate_war, 1),
gate_createlayer(spr_gate_war, 2, 1),
gate_createlayer(spr_gate_war, 3, 0.66),
gate_createlayer(spr_gate_war, 4, 0.33),
]