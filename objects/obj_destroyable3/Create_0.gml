hp = 2
depth = 1

var a = get_chardetail("bigdestroyable")
if object_index != obj_bigforestblock sprite_index = a[0]
image_index = random_range(0, (image_number - 1))
arena = 0
particlespr = spr_towerblockdebris
dustspr = spr_deadjohnsmoke
animate = 1
range = 64

switch sprite_index {
	case spr_bigforestblock:
		particlespr = spr_forestblockdebris
		animate = 0
		dustspr= spr_johnsmoke_orange
	break
	case spr_halloweenbigblock:
		particlespr = spr_halloweenbigdebris
		animate = 0
		dustspr = spr_null
	break

	case spr_halloweensmallblock:
		particlespr = spr_halloweendebris
		animate = 0
		dustspr = spr_null
	break
	case spr_ss_destroyable:
		particlespr = spr_ss_debrisbig
		animate = 0
		dustspr = spr_johnsmoke_orange
	break
	case spr_ss_smallbreak:
		particlespr = spr_ss_debris
		animate = 0
		dustspr = spr_johnsmoke_orange
	break
	case spr_ss_destroyable2:
		particlespr = spr_ss_debrisbigcollect
		animate = 0
		dustspr = spr_johnsmoke_pink
	break
	case spr_ss_smallbreak2:
		particlespr = spr_ss_debriscollect
		animate = 0
		dustspr = spr_johnsmoke_pink
	break
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
		particlespr = spr_towerblockdebris
		dustspr = spr_deadjohnsmoke
		animate = 1	
	break
	
}
