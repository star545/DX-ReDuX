with (other)
{
	if (other.hurtplayer == 0 && character == characters.vigilante)
	{
		if key_jump2
		{
			vsp = -20
			if (state == states.normal or state == states.jump or state == states.mach2 || state == states.mach3 || hsp == 0)
			{
				sprite_index = spr_playerV_superjump
				//state = states.jump
			}
			image_index = 0
			jumpAnim = 1
			jumpstop = 1
			other.hurtplayer = 1
		}
	}
}
