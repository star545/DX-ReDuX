targetRoom = street_intro
msg = "The Pig City"
level = "street"
tex_groups = ["citygroup"]
details = [
gate_createlayer(spr_gate_streets, get_level_pct(level) == 100 ? sprite_get_number(spr_gate_streets) - 1 : 0),
gate_createlayer(spr_gate_streets, 1),
gate_createlayer(spr_gate_streets, 2, 1),
gate_createlayer(spr_gate_streets, 3, 0.66),
gate_createlayer(spr_gate_streets, 4, 0.33),
]