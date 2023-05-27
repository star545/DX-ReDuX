function scr_player_boxxedpepspin()
{
	if !audio_is_playing(sfx_Nspin)
		scr_soundeffect(sfx_Nspin)
	image_speed = 0.5;
	hsp = xscale * movespeed;
	doublejump = true;
	if (place_meeting(x, y + 1, obj_railparent))
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		railmovespeed = _railinst.movespeed;
		raildir = _railinst.dir;
	}
	move = key_left + key_right;
	hsp = movespeed + (railmovespeed * raildir);
	if (abs(movespeed) > 0)
		movespeed = Approach(movespeed, 0, 0.1);
	instance_destroy(instance_place(x + hsp, y, obj_destructibles));
	if (scr_solid((x + sign(hsp)), y) && (!(place_meeting((x + hsp), y, obj_destructibles))) && ((!(place_meeting((x + hsp), y, obj_slope))) or scr_solid_slope((x + hsp), y)))
		movespeed = (-((sign(hsp) * 6)))
	instance_destroy(instance_place((x + hsp), y, obj_destructibles))
	if (!key_slap)
	{
		state = states.boxxedpepjump
		sprite_index = spr_boxxedpepair
		audio_stop_sound(sfx_Nspin)
	}
	exit;
}

