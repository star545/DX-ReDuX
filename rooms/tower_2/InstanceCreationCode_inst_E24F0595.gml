targetRoom = badland_1
msg = "Oregano Mirage"
level = "badland"
tex_groups = ["desertgroup"]
details = [
gate_createlayer(spr_gate_badland, get_level_pct(level) == 100 ? sprite_get_number(spr_gate_badland) - 1 : 0),
gate_createlayer(spr_gate_badland, 1),
gate_createlayer(spr_gate_badland, 2, 1),
gate_createlayer(spr_gate_badland, 3, 0.66),
gate_createlayer(spr_gate_badland, 4, 0.33),
]
