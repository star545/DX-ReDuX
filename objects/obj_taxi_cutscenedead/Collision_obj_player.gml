if (targetplayer.id != other.id)
	exit;
with other {
	visible = false
	//state = states.actor
	hsp = 0
	vsp = 0
	grav = 0
	
	
	
}

scr_soundeffect(sfx_taxi2)

sprite_index = spr_taximove
hsp = 10
obj_player1.cutscene = 1

if (pickedup == 0) with instance_create(x, y, obj_genericpoofeffect) depth = other.depth - 1
pickedup = 1
