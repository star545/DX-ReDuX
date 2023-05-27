targetRoom = minigolf_1
msg = "GOLF"
level = "minigolf"
tex_groups = ["minigolfgroup"]
details = [
gate_createlayer(spr_gate_golf, get_level_pct(level) == 100 ? sprite_get_number(spr_gate_golf) - 1 : 0),
gate_createlayer(spr_gate_golf, 1),
gate_createlayer(spr_gate_golf, 2, 1),
gate_createlayer(spr_gate_golf, 3, 0.66),
gate_createlayer(spr_gate_golf, 4, 0.33),
]