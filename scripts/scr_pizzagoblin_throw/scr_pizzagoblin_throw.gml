function scr_pizzagoblin_throw()
{
	
	
	hsp = 0
	if place_meeting(x, y + 1, obj_railh)
		hsp = -5
	else if place_meeting(x, y + 1, obj_railh2)
		hsp = 5
	
	if floor(image_index) == image_number - 1
	{
		state = states.walk
		sprite_index = walkspr
	}
	
	if bombreset <= 0 && floor(image_index) == throw_frame
	{
	

		sprite_index = throwspr
		if point_in_rectangle(x, y, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])))
			scr_soundeffect(sfx_enemyprojectile)
		
		switch object_index
		{
			case obj_pizzagoblin:
				if !use_heat(true)
					with (instance_create(x, y, obj_pizzagoblinbomb))
					{
						defused = 1
						movespeed = 5
						image_xscale = other.image_xscale
						vsp = -10
						countdown = 80
					}
				else 
					with (instance_create(x, y, obj_impactbomb))
						{
							movespeed = 5
							image_xscale = other.image_xscale
							vsp = -10
						}
				bombreset = 200		
				break
			case obj_canongoblin:
				var a = use_heat()
				with (instance_create(x, y, obj_canongoblinbomb)) {
					image_xscale = other.image_xscale
					elite = a	
					hsp = 10 * image_xscale
				}
				bombreset = 200		
				var _sound = choose(sfx_cannon1, sfx_cannon2, sfx_cannon3)
				scr_soundeffect_at(_sound, x, y, 0, 400, 1000, 1, false, 1)
				break
			case obj_noisegoblin:
				var a = use_heat()
				with (instance_create(x, y, obj_noisegoblin_arrow))
				{
					turn = a
				}
				bombreset = 200	
				break
			case obj_cheeserobot:
				with (instance_create(x, y, obj_cheeseblob))
				{
					sprite_index = spr_cheeserobot_goop
					image_xscale = other.image_xscale
					hsp = (other.image_xscale * 8)
					vsp = 0
					grav = 0
				}
				break
			case obj_spitcheese:
				with (instance_create((x + (image_xscale * 6)), (y - 6), obj_spitcheesespike))
				{
					image_xscale = other.image_xscale
					hsp = (other.image_xscale * 5)
					vsp = -6
				}
				
				bombreset = 100
				break
			case obj_trash:
			case obj_invtrash:
				with (instance_create((x + (image_xscale * 6)), (y - 6), obj_cheeseball))
				{
					image_xscale = other.image_xscale
					hsp = (other.image_xscale * 5)
					vsp = -4
				}
				break
			case obj_robot:
				with (instance_create((x + (image_xscale * 4)), y, obj_robotknife))
				{
					grav = 0
					image_xscale = other.image_xscale
					hsp = (other.image_xscale * 5)
				}
				break
			case obj_kentukykenny:
				if !use_heat(true)
					with (instance_create(x, y, obj_kentukykenny_projectile))
						image_xscale = other.image_xscale
				else {
					with (instance_create(x, y, obj_fire_projectile))
						image_xscale = other.image_xscale
					repeat (12) create_fire_effect(x, y, spr_firemouth_projectile)		
				}
				bombreset = 200			
				break
			case obj_pizzard:
			
				with (instance_create(x, y, obj_pizzard_bolt))
					image_xscale = other.image_xscale
				if use_heat()
					instance_create(x, y, obj_pizzardcloud)
				bombreset = 100
				break
			case obj_pepperwitch:
				if !elite {
					with (instance_create(x, y, obj_pepperbullet)) {
						
					}
				}
				else {
					with (instance_create(x, y, obj_pepperbomb)) 
					{
						movespeed = 5
						image_xscale = other.image_xscale
						vsp = -8
					}
				}
				bombreset = 300
				if elite
					bombreset = 600	
				break
			case obj_swedishmonkey:
				if use_heat()
				{
					with (instance_create(x, y, obj_evilbanana))
					{
						baddieID = other.id
						image_xscale = other.image_xscale
						hsp = ((-other.image_xscale) * 4)
						vsp = -5
					}
				}
				else
				{
					with (instance_create(x, y, obj_slipnslide))
					{
						baddieID = other.id
						image_xscale = other.image_xscale
						hsp = ((-other.image_xscale) * 4)
						vsp = -5
					}
				}
				with (obj_slipnslide)
				{
					if (baddieID == other.id)
						banana += 1
				}
				with (obj_evilbanana)
				{
					if (baddieID == other.id)
						banana += 1
				}
				bombreset = 200	
				break
			case obj_pepgoblin:
				with (instance_create(x, y, obj_pepgoblin_kickhitbox))
				{
					baddieID = other.id
					image_xscale = other.image_xscale
				}
				bombreset = 200	
				break
			case obj_pepbat:
				with (instance_create(x, y, obj_pepgoblin_kickhitbox))
				{
					baddieID = other.id
					image_xscale = other.image_xscale
				}
				bombreset = 200	
				break
			case obj_pickle:
				attacking = 0
				with (instance_create(x, y, obj_forkhitbox))
				{
					ID = other.id
					image_xscale = other.image_xscale
					sprite_index = other.sprite_index
				}
				bombreset = 200
				break
			case obj_tank:
				with (instance_create((x + (image_xscale * 6)), (y - 6), obj_canongoblinbomb))
				{
					image_xscale = other.image_xscale
					hsp = (other.image_xscale * 5)
				}
				break
			case obj_thug_blue:
			case obj_thug_red:
				with (instance_create((x + (8 * image_xscale)), y, obj_robotknife))
				{
					image_xscale = other.image_xscale
					hsp = (other.image_xscale * 5)
				}
				bombreset = 200	
				break
			case obj_rancher:
				if (use_heat() && face_obj(obj_player) != 0) image_xscale = face_obj(obj_player)
				with (instance_create((x + (image_xscale * 6)), (y + 26), obj_rancher_bullet))
					image_xscale = other.image_xscale
				max_shot--
				if max_shot > 0 && use_heat() {
					image_index = throw_frame - 4
					bombreset = 0
				} else { 
					bombreset = 100		
					max_shot = use_heat() ? 3 : 1
				}
				break
			case obj_smokingpizzaslice:
				substate = choose(states.walk, states.idle, states.idle)
				if (substate == states.walk)
					image_xscale = choose(-1, 1, (-image_xscale))
				substate_buffer = substate_max
				with (instance_create((x + (50 * image_xscale)), (y + 20), obj_smokingprojectile))
					image_xscale = other.image_xscale
				bombreset = 10	
				break
			case obj_thug_green:
				with instance_create(x + (image_xscale * 8), y - 50, obj_junkhurt) {
					hsp = other.image_xscale * 7
					vsp = -8
				}
				bombreset = 200
				break
			case obj_miniufo:
				instance_create(x, y + 40, obj_blackhole)
				bombreset = 500	
				break
			case obj_miniufo_grounded:
				if !use_heat() {
				with (instance_create((x + (8 * image_xscale)), y, obj_enemybullet))
				{
					sprite_index = spr_ufogrounded_bullet
					image_xscale = other.image_xscale
				}
				} else {
					with (instance_create((x + (8 * image_xscale)), y, obj_xenopop))
					{
						sprite_index = spr_ufogrounded_bullet
						image_xscale = other.image_xscale
					}
					
				}
				bombreset = 100
				break
			case obj_kentukybomber:
				instance_create(x, (y + 70), obj_kentukybomb)
				bombreset = 100
				break
			case obj_bazookabaddie:
				var xx = (x + (72 * image_xscale))
				instance_create(xx, y, obj_bazooka)
				create_particle(xx, y, particle.balloonpop)
				bombreset = 400	
				break
		}

	}
	if ((!grounded) && hsp < 0)
		hsp += 0.1
	else if ((!grounded) && hsp > 0)
		hsp -= 0.1
	exit;
}

