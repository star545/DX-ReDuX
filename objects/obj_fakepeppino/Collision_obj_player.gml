if (state == states.normal && other.state != states.backbreaker && sprite_index != spr_pepclone_death && sprite_index != spr_pepclone_form)
{

    scr_hurtplayer(other)
	if obj_player1.prevstate != states.hurt && obj_player1.state == states.hurt {
		state = states.timesup
		appeartimer = 400
	    image_speed = 0.35
	    image_index = 0
	    sprite_index = spr_pepclone_death
	    ds_queue_clear(followqueue)
		
	} 
}