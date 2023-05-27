
if instance_exists(baddieID) && instance_exists(other.baddieID)
{
	var bID = baddieID
	var bID2 = other.baddieID
	if !bID.thrown && !bID.fake_thrown && bID.state != states.hit && bID2.state != states.grabbed && bID.state != states.grabbed && bID2.state != states.hit && bID.invtime <= 0 && !bID.invincible && bID.instantkillable && bID.killbyenemy && bID != bID2 && (bID2.thrown || bID2.fake_thrown) && !bID2.mach3destroy
    {
        scr_soundeffect(sfx_punch)
		with bID {
			state = states.stun
			fake_thrown = true
			stunned = 100
			hitvsp = -8
			hithsp = -bID2.image_xscale * 15
			hsp = hithsp
			vsp = hitvsp
			shake_timer = 5
			invtime = 5
			hp--
			if elitehit > 0 && elite {
				elitehit--
				baddie_destroy_points()
			}
			repeat (6) create_baddiedebris()
			if destroyable && (!elite || elitehit <= 0)
				instance_destroy()
		}
	
        
    }
}