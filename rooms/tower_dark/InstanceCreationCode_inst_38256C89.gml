targetRoom = dungeon_1
msg = "Mystery Castle"
level = "secret"
tex_groups = ["secretgroup"]
details = [
gate_createlayer(spr_gate_secret, get_level_pct(level) == 100 ? sprite_get_number(spr_gate_palace) - 1 : 0),
gate_createlayer(spr_gate_secret, 1),
gate_createlayer(bg_secret, 2, 1, 1),
]
if get_level_pct("champ") == 0 instance_destroy(self)
