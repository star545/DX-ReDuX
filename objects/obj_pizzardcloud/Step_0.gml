switch state {
	case states.chase:
		var tgtx = obj_player1.x
		var tgty = obj_player1.y - 100
		x = lerp(x, tgtx, 0.05)
		y = lerp(y, tgty, 0.05)
	
	break
	case states.fall:
		if anim_end(11) && sprite_index == spr_totemcloud_attack && !shot {
			shot = 1
			with (instance_create(x, y, obj_cloudthunder))
			{
				other.thunderID = id
				cloudID = other.id
				depth = (other.depth + 1)
				alarm[0] = 25
			}
		}
		if shot && !instance_exists(thunderID) && alarm[0] == -1 && sprite_index != spr_totemcloud_end
			alarm[0] = 25
	break
}
if anim_end() {
	switch sprite_index {
		
		case spr_totemcloud_spawn: sprite_index = spr_totemcloud_idle break	
		case spr_totemcloud_attack: sprite_index = spr_totemcloud_end break	
		case spr_totemcloud_end: instance_destroy() break	
		
	}
	
}