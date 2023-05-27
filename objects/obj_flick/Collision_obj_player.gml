with (other)
{
	if (other.active && other.sprite_index == spr_flicker && state != states.gotoplayer && state != states.actor)
	{

		x = other.x
		y = other.y - 16
		var i = 0
		while (i < 35) {
			if scr_solid(x, y) {
				y--
				i++
				continue
			}
			else {
				break	
			}
			
		}
		var angel = other.image_xscale ? 0 : 180
		movespeed = 15
		wallspeed = angel
		hsp = lengthdir_x(movespeed, wallspeed)	
		vsp = lengthdir_y(movespeed, wallspeed)	
		xscale = other.image_xscale
		instance_create(x, (y - 20), obj_bangeffect)
		scr_soundeffect(sfx_punch)
		state = states.flick
		other.image_index = 0
		other.active = false;
		other.sprite_index = spr_flicker_shoot
	}
}
