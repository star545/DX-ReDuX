targetRoom = dungeon_1
msg = "Pizzaboy Palace"
level = "palace"
tex_groups = ["palacegroup"]
details = [
gate_createlayer(spr_gate_palace, get_level_pct(level) == 100 ? sprite_get_number(spr_gate_palace) - 1 : 0),
gate_createlayer(spr_gate_palace, 1),
gate_createlayer(spr_gate_palace, 2, 1),
gate_createlayer(spr_gate_palace, 3, 0, -0.5),
gate_createlayer(spr_gate_palace, 4, 0.33),
]
if get_level_pct("champ") == 0 instance_destroy(self)
