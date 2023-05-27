if get_level_pct("exit") != 100 {
	instance_destroy() 
	exit;
}




targetRoom = champ_1
level = "champ"
msg = "Champion's Road"
tex_groups = ["champgroup"]
if get_level_pct("champ") == 100 {
	details = [
	gate_createlayer(spr_gate_champ, 0),
	gate_createlayer(spr_gate_champ_100, 1),
	gate_createlayer(spr_gate_champ_100, 2, -0.8),
	gate_createlayer(spr_gate_champ_100, 3, -0.6),
	gate_createlayer(spr_gate_champ_100, 4, -0.4),
	gate_createlayer(spr_gate_champ_100, 5, -0.2),
	gate_createlayer(spr_gate_champ_100, 6,  0)
	]
	
} else {
	details = [
	gate_createlayer(spr_gate_champ, 0),
	gate_createlayer(spr_gate_champ, 1),
	gate_createlayer(spr_gate_champ, 2, -0.8),
	gate_createlayer(spr_gate_champ, 3, -0.6),
	gate_createlayer(spr_gate_champ, 4, -0.4),
	gate_createlayer(spr_gate_champ, 5, -0.2),
	gate_createlayer(spr_gate_champ, 6,  0.1, 0.1),
	gate_createlayer(spr_gate_champ, 7),
	]
}