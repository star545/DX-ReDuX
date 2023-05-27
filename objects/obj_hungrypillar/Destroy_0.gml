if room == rm_editor
	exit;

if ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == false
{
	with (instance_create(x, y, obj_johnhitstun)) {
        image_xscale = other.image_xscale
		set_music = other.set_music	
	}
    ds_list_add(global.saveroom, id)
	var _w = sprite_width / 2
	var _h = sprite_height / 2
    
    repeat (15)
    {
		var _xrange = random_range(x - _w, x + _w)
		var _yrange = random_range(y - _h, y + _h)
        with (create_debris(_xrange, _yrange, spr_johnDebris_generic))
        {
            hsp = (obj_player.hsp + random_range(-8, 8))
            vsp = (obj_player.vsp + random_range(-8, 8))
        }
    }
    camera_zoom(0.8, 0.03)
	/*
    repeat (6)
        instance_create(_xrange, _yrange, obj_slapstar)
    repeat (6)
        instance_create(_xrange, _yrange, obj_baddiegibs)
	*/
    with (obj_camera)
    {
        shakex_mag = 10
        shakex_mag_acc = 2.5
        shakex_mag_maxdelay = 3
        tgt_angle = (other.image_xscale * -2)
        anglespd = 0.1
    }
    with (obj_player)
    {
        if (state != states.chainsaw)
        {
            tauntstoredmovespeed = movespeed
            tauntstoredsprite = sprite_index
            tauntstoredstate = state
            tauntstoredvsp = vsp
        }
        with (instance_create(x, y, obj_parryeffect))
            sprite_index = spr_kungfueffect
        tauntstoredsprite = sprite_index
        if (state == states.handstandjump)
        {
            if grounded
                sprite_index = spr_player_groundedattack
            else
                sprite_index = spr_player_ungroundedattack
        }
		if room != tower_finalhallway flash = true
        image_index = irandom_range(0, (image_number - 1))
        hitLag = 30
        hitX = x
        hitY = y
        state = states.chainsaw
    }
	/*
	with obj_baddie
	{
		if escape == true
		{
			visible = true
			instance_create(x, y, obj_genericpoofeffect)
		}
	}
	
	global.fill = 4000 // time left in frames
	with obj_tv
		chunkmax = global.fill
	
	with obj_escapecollect
		image_alpha = 1
	with obj_escapecollectbig
		image_alpha = 1
	
	scr_soundeffect(sfx_escaperumble)
	obj_camera.alarm[1] = 60
	
	instance_create(x, y, obj_bangeffect)
	instance_create(x, y, obj_slapstar)
	instance_create(x, y, obj_slapstar)
	instance_create(x, y, obj_slapstar)
	instance_create(x, y, obj_baddiegibs)
	instance_create(x, y, obj_baddiegibs)
	instance_create(x, y, obj_baddiegibs)
	
	if global.coop == true
	{
		obj_player1.x = x
		obj_player2.x = x
		obj_player1.y = y
		obj_player2.y = y
	}
	with obj_camera
	{
		shake_mag = 3
		shake_mag_acc = (3 / room_speed)
	}
	
	instance_destroy()
	with instance_create(x, y, obj_sausageman_dead)
		sprite_index = spr_hungrypillar_dead
	scr_soundeffect(sfx_killenemy)
	instance_create(x, y + 600, obj_itspizzatime)
	global.panic = true
	
	switch room
	{
		case entrance_10:
			global.minutes = 2
			global.seconds = 30
			break
		case medieval_10:
			global.minutes = 2
			global.seconds = 15
			break
		case ruin_11:
			global.minutes = 2
			global.seconds = 59
			break
		case dungeon_10:
			global.minutes = 4
			global.seconds = 30
			break
		case chateau_6:
			global.minutes = 3
			global.seconds = 15
			break
		case strongcold_1:
			global.minutes = 4
			global.seconds = 0
			break
		case dragonlair_1:
			global.minutes = 0
			global.seconds = 59
			break
		case desert_16:
			global.minutes = 2
			global.seconds = 30
			break
		case graveyard_6:
			global.minutes = 3
			global.seconds = 59
			break
		case farm_11:
			global.minutes = 3
			global.seconds = 59
			break
		case pinball_17:
			global.minutes = 3
			global.seconds = 12
			break
		case beach_13:
			global.minutes = 3
			global.seconds = 30
			break
		case forest_5:
			global.minutes = 3
			global.seconds = 30
			break
		case minigolf_8:
			global.minutes = 7
			global.seconds = 30
			break
		case space_9:
			global.minutes = 5
			global.seconds = 30
			break
		case sewer_8:
			global.minutes = 5
			global.seconds = 30
			break
		case city_11:
			global.minutes = 5
			global.seconds = 30
			break
		case mansion_7:
			global.minutes = 5
			global.seconds = 30
			break
		case factory_10:
			global.minutes = 6
			global.seconds = 30
			break
		case freezer_3:
			global.minutes = 5
			global.seconds = 30
			break
		case war_1:
			global.minutes = 6
			global.seconds = 30
			break
		case exit_1:
			global.minutes = 9
			global.seconds = 59
			break
		case kidsparty_lastroom:
			global.minutes = 3
			global.seconds = 30
			break
		case custom_lvl_room:
			global.minutes = 2
			global.seconds = 15
			break
		default:
			global.minutes = 5
			global.seconds = 30
			break
	}
	*/
}
