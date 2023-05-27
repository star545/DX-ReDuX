global.breaksound = 0
arena = 0
var a = get_chardetail("destroyable")
sprite_index = a[1]

image_index = random_range(0, (image_number - 1))
depth = 1
particlespr = spr_towerblockdebris
dustspr = spr_deadjohnsmoke
animate = 1
range = 64
center = 0
switch sprite_index {
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

	default:
		particlespr = spr_null
		dustspr = spr_pizzablockdead
		animate = 1	
		center = 1
	break
	
}
