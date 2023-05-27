targetRoom = dungeon_1
msg = "Bloodsauce Dungeon"
level = "dungeon"
tex_groups = ["dungeongroup"]
details = [
gate_createlayer(spr_gate_dungeon, get_level_pct(level) == 100 ? sprite_get_number(spr_gate_dungeon) - 1 : 0),
gate_createlayer(spr_gate_dungeon, 1),
gate_createlayer(spr_gate_dungeon, 2, 1),
gate_createlayer(spr_gate_dungeon, 3, 0, -0.5),
gate_createlayer(spr_gate_dungeon, 4, 0.33),
]
