targetRoom = space_1
msg = "Deep Dish 9"
level = "space"
tex_groups = ["spacegroup"]
sprite_index = spr_gate_space
details = [
gate_createlayer(spr_gate_space, get_level_pct(level) == 100 ? sprite_get_number(spr_gate_space) - 1 : 0),
gate_createlayer(spr_gate_space, 1),
gate_createlayer(spr_gate_space, 2, 1),
gate_createlayer(spr_gate_space, 3, -0.66, -0.66),
gate_createlayer(spr_gate_space, 4, 0.33, 0.33),
]