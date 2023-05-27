if (state == states.normal && obj_player1.state != states.chainsaw)
{
	var xx = obj_player1.x
    var yy = obj_player1.y
    var ixs = obj_player1.xscale
    var v = obj_player1.vsp
    var img = obj_player1.image_index
    var spr = obj_player1.sprite_index
    ds_queue_enqueue(followqueue, [xx, yy, ixs, v, img, spr])
    if (ds_queue_size(followqueue) > LAG_STEPS)
    {
        var b = ds_queue_dequeue(followqueue)
        x = b[0]
        y = b[1]
        image_xscale = b[2]
        vsp = b[3]
        image_index = b[4]
        sprite_index = b[5]
    }
	//image_speed = 0.35
	if (sprite_index == spr_pepclone_form && anim_end())
        sprite_index = spr_player_idle
	var grounded = place_meeting_collision(x, y + 1)
	switch substate
	{
		case states.normal:
			
			if grounded && x != xprevious && global.ScrollOffset % 10 == 0 create_particle(x, y + 38, particle.cloudeffect)
			if (!grounded)
			{
				substate = states.jump
				if (vsp < 0) create_particle(x, y, particle.highjumpcloud1)
			}
			break
		case states.jump:

			if (grounded && vsp > 0)
			{
				create_particle(x, y, particle.landcloud, 0)
				substate = states.normal
			}
			break
	}

}
if (state == states.timesup)
{
    appeartimer--
    if (floor(image_index) >= (image_number - 1))
        image_speed = 0
    if (appeartimer <= 0)
    {
        x = obj_player.x
        y = obj_player.y
        state = 0
        ds_queue_clear(followqueue)
        sprite_index = spr_pepclone_form
        image_index = 0
      
    }
}