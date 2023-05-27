playerindex = 0
depth = 1
var a = get_chardetail("metalb")
sprite_index = a[0]
image_index = random_range(0, (image_number - 1))
arena = 0
particlespr = spr_towerblockdebris
dustspr = spr_deadjohnsmoke
animate = 1
range = 64

switch sprite_index {
	
	case spr_ss_metalb:
		particlespr = spr_ss_debrismetal
		animate = 0
		dustspr = spr_johnsmoke_white
	break
	case spr_metaltowerblock:
		particlespr = spr_metalblockdebris
		animate = 0
		dustspr = spr_johnsmoke_white
	break
	default:
		particlespr = spr_metalblockdebris
		animate = 0
		dustspr = spr_johnsmoke_white
	break
	
}
