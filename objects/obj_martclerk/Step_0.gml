if (place_meeting(x, y, obj_player) && sprite_index == spr_clerk && (obj_player1.state == states.mach3 || obj_player1.state = states.handstandjump || obj_player1.state == states.mach2 || obj_player1.state == states.punch || obj_player1.state == states.firemouth))
{
	global.combotime = 60
	if (!audio_is_playing(sfx_collecttoppin))
		scr_soundeffect(sfx_collecttoppin)
	if (content == obj_pizzakinshroom)
	{
		with (instance_create(x, y, obj_smallnumber))
			number = "1000"
		if place_meeting(x, y, obj_player1)
			global.collect += 1000
		else
			global.collectN += 1000
		instance_create(x, y, obj_taunteffect)
		with (instance_create(x, (y - 25), content))
		{
			sprite_index = spr_toppinshroom_intro
		}
		if (global.toppintotal < 5)
			obj_tv.message = (("YOU NEED " + string((5 - global.toppintotal))) + " MORE TOPPINS!")
		if (global.toppintotal == 5)
			obj_tv.message = "YOU HAVE ALL TOPPINS!"
		obj_tv.showtext = 1
		obj_tv.alarm[0] = 150
		global.toppintotal += 1
		global.shroomfollow = 1
	}
	if (content == obj_pizzakincheese)
	{
		with (instance_create(x, y, obj_smallnumber))
			number = "1000"
		if place_meeting(x, y, obj_player1)
			global.collect += 1000
		else
			global.collectN += 1000
		with (instance_create(x, (y - 25), content))
		{
			sprite_index = spr_toppincheese_intro
		}
		instance_create(x, y, obj_taunteffect)
		if (global.toppintotal < 5)
			obj_tv.message = (("YOU NEED " + string((5 - global.toppintotal))) + " MORE TOPPINS!")
		if (global.toppintotal == 5)
			obj_tv.message = "YOU HAVE ALL TOPPINS!"
		obj_tv.showtext = 1
		obj_tv.alarm[0] = 150
		global.toppintotal += 1
		global.cheesefollow = 1
	}
	if (content == obj_pizzakintomato)
	{
		with (instance_create(x, y, obj_smallnumber))
			number = "1000"
		if place_meeting(x, y, obj_player1)
			global.collect += 1000
		else
			global.collectN += 1000
		with (instance_create(x, (y - 25), content))
		{
			sprite_index = spr_toppintomato_intro
		}
		instance_create(x, y, obj_taunteffect)
		if (global.toppintotal < 5)
			obj_tv.message = (("YOU NEED " + string((5 - global.toppintotal))) + " MORE TOPPINS!")
		if (global.toppintotal == 5)
			obj_tv.message = "YOU HAVE ALL TOPPINS!"
		obj_tv.showtext = 1
		obj_tv.alarm[0] = 150
		global.toppintotal += 1
		global.tomatofollow = 1
	}
	if (content == obj_pizzakinsausage)
	{
		with (instance_create(x, y, obj_smallnumber))
			number = "1000"
		if place_meeting(x, y, obj_player1)
			global.collect += 1000
		else
			global.collectN += 1000
		with (instance_create(x, (y - 25), content))
		{
			sprite_index = spr_toppinsausage_intro
		}
		instance_create(x, y, obj_taunteffect)
		if (global.toppintotal < 5)
			obj_tv.message = (("YOU NEED " + string((5 - global.toppintotal))) + " MORE TOPPINS!")
		if (global.toppintotal == 5)
			obj_tv.message = "YOU HAVE ALL TOPPINS!"
		obj_tv.showtext = 1
		obj_tv.alarm[0] = 150
		global.toppintotal += 1
		global.sausagefollow = 1
	}
	if (content == obj_pizzakinpineapple)
	{
		with (instance_create(x, y, obj_smallnumber))
			number = "1000"
		if place_meeting(x, y, obj_player1)
			global.collect += 1000
		else
			global.collectN += 1000
		with (instance_create(x, (y - 25), content))
		{
			sprite_index = spr_toppinpineapple_intro
		}
		instance_create(x, y, obj_taunteffect)
		global.heattime = 60
		global.style += 10
		ds_list_add(global.saveroom, id)
		if (global.toppintotal < 5)
			obj_tv.message = (("YOU NEED " + string((5 - global.toppintotal))) + " MORE TOPPINS!")
		if (global.toppintotal == 5)
			obj_tv.message = "YOU HAVE ALL TOPPINS!"
		obj_tv.showtext = 1
		obj_tv.alarm[0] = 150
		global.toppintotal += 1
		global.pineapplefollow = 1
	}
	instance_destroy()
}
