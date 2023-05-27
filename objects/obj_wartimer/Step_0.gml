if (room == rank_room)
{
	visible = false
	instance_destroy()
}
else
	visible = true

if targetfill >= fill	
	fill = Approach(fill, 0, 1)
targetfill = Approach(targetfill, fill, 30)
if fill <= 0
	dead = true
if fill == 660 && targetfill == fill scr_soundeffect(sfx_warlowtime)	
if dead {
	fill = 0
	timer_out--
	if timer_out <= 0 {
		instance_destroy(obj_fadeout)
		with (obj_player)
		{
			targetDoor = "A"
			room = timesuproom
			state = states.timesup
			sprite_index = spr_Timesup
			image_index = 0
			audio_stop_all()
			scr_soundeffect(mu_timesup)
		}
		instance_create(0, 0, obj_timesupwar)
		instance_destroy()	
	}
	
}
fill = clamp(fill, 0, time_in_frames(2, 0))