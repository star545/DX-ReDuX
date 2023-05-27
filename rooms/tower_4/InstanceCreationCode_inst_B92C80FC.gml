targetRoom = sewer_1
msg = "Oh Shit!"
level = "sewer"
tex_groups = ["sewergroup"]
details = [
gate_createlayer(spr_gate_sewer, get_level_pct(level) == 100 ? sprite_get_number(spr_gate_sewer) - 1 : 0),
gate_createlayer(spr_gate_sewer, 1),
gate_createlayer(spr_gate_sewer, 2, 1),
gate_createlayer(spr_gate_sewer, 3, 0.66),
gate_createlayer(spr_gate_sewer, 4, 0.33),
]