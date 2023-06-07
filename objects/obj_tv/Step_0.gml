if barflash > 0 {
	barflash -= 1
}
else barblend = image_blend
//scr_tvsprites()
if (room == SPOOK || room == hub_hall || room == Realtitlescreen or room == rm_eggplantdisclaimer or room == rank_room or room == rm_levelselect or room == timesuproom or room == boss_room1 or room == characterselect or room == hub_loadingscreen)
{
	visible = false
}
else
	visible = true
if (instance_exists(obj_debugcontroller) && (!obj_debugcontroller.showhud))
	visible = false
image_speed = 0.35
if (targetgolf != noone && (!instance_exists(targetgolf)))
	targetgolf = -4
if (targetgolf != -4 && (!view_visible[1]))
{
	view_visible[1] = true
	view_enabled = true
}
if (bubblespr != -4 && bubblespr != spr_tv_bubbleclosed)
{
	if (prompt != -4)
		prompt_buffer = 2
	bubbleindex += image_speed
	if (floor(bubbleindex) == sprite_get_number(bubblespr))
	{
		bubbleindex = 0
		switch bubblespr
		{
			case spr_tv_bubbleopen:
				bubblespr = spr_tv_bubble
				break
			case spr_tv_bubbleclose:
				bubblespr = spr_tv_bubbleclosed
				if (prompt == -4 or prompt == "")
					bubblespr = -4
				break
		}

	}
}

var p = obj_player1
global.sugary = if_char(characters.pizzelle)
var sugary = global.sugary
var _state = obj_player1.state
if (_state == states.backbreaker or _state == states.chainsaw)
	_state = obj_player1.tauntstoredstate
switch state
{
	case states.normal:
		draw_static = false
		idlespr = global.panic ? tv_panic : tv_idle
		if get_heat_player() == 3 idlespr = tv_heat
		if ((p.shotgunAnim || p.mortGun) && idlespr != tv_panic) idlespr = p.shotgunAnim ? tv_shotgun : tv_mort
		if obj_player.isgustavo idlespr = global.panic ? spr_tv_escapeG : spr_tv_idleG

		
		
		var _transfo = 1
		if !obj_player1.isgustavo {
			switch _state {
				case states.mach1: 
					if sugary idlespr = tv_mach1 
					_transfo = 0
				break;	
				case states.mach2: 
					if sugary idlespr = tv_mach2 
					if p.skateboarding idlespr = tv_clown
					else _transfo = 0
				break;	
				case states.mach3: 
				
					idlespr = tv_mach3
					if p.movespeed >= 16 idlespr = tv_mach4
				break;	
				case states.climbwall:
					if sugary = tv_mach2
					if p.wallspeed >= 12 idlespr = tv_mach3
					if p.wallspeed >= 16 idlespr = tv_mach4
					if p.skateboarding idlespr = tv_clown
					else _transfo = 0
				break
				case states.tumble:
					if p.movespeed >= 12 idlespr = tv_mach3
					if p.movespeed >= 16 idlespr = tv_mach4
					if p.sprite_index == p.spr_tumble idlespr = tv_tumble
					else _transfo = 0
				break	
				case states.machslide:
					if p.sprite_index == p.spr_mach3boost idlespr = tv_mach3
					else if sugary idlespr = tv_mach2
					_transfo = 0
				break
				case states.knightpep:
				case states.knightpepattack:
				case states.knightpepslopes:
					idlespr = tv_knight
				break
				case states.bombpep: idlespr = tv_bomb break;
				case states.fireass: idlespr = (p.sprite_index == p.spr_scaredjump1 || p.sprite_index == p.spr_scaredjump2) ? tv_scaredjump : tv_fireass break;
				case states.ghost: idlespr = tv_ghost break;
				case states.stunned: if (p.sprite_index == p.spr_squished) idlespr = tv_squished else _transfo = 0 break;
				case states.barrel: 
				case states.barrelclimbwall:
				case states.barreljump:
				case states.barrelslide:
					idlespr = tv_barrel
					break;
				case states.golf: idlespr = tv_golf break;
				case states.rocket: idlespr = tv_rocket break;
				case states.cheeseball:
					idlespr = tv_cheeseball
					break
				case states.cheesepep:
				case states.cheesepepstick:
				case states.cheesepepstickside:
				case states.cheesepepstickup:
					idlespr = tv_cheesepep
					break
				case states.boxxedpep:
				case states.boxxedpepjump:
				case states.boxxedpepspin:
					idlespr = tv_boxxed
					break	
				case states.rideweenie: break;	
				default: _transfo = 0 break;
			}
		} else _transfo = 0

		if (!_transfo)
		{

			if (p.state == states.hurt) tv_do_expression(tv_hurt, 60)
			else if (p.state == states.ratmounthurt) tv_do_expression(spr_tv_hurtG, 60)
			else if (global.combo >= 3 && saved_combo != global.combo && !p.isgustavo) {
				tv_do_expression(tv_combo, 250)
				saved_combo = global.combo	
			}
			
		}
		//trace(sprite_get_name(idlespr))
		
		
		
		switch sprite_index
		{
			case tv_off:
				if visible
				{
					sprite_index = tv_turnon
					image_index = 0
				}
				break
			case tv_turnon:
				if (floor(image_index) == (image_number - 1))
					sprite_index = idlespr
				break
			case tv_idle:
				if (idleanim > 0)
					idleanim--
				//if (sprite_index != idlespr)
				//	sprite_index = idlespr
				if (idleanim <= 0 && floor(image_index) == (image_number - 1))
				{
					sprite_index = choose(tv_idleanim1, tv_idleanim2)
					image_index = 0
				}
				break
			case tv_idleanim1:
			case tv_idleanim2:
				if (floor(image_index) == (image_number - 1))
				{
					sprite_index = idlespr
					idleanim = (240 + (60 * irandom_range(-1, 2)))
				}
				if (idlespr != tv_idle)
					sprite_index = idlespr
				break
			default:
				
				
			break
		}
		
		if saved_tv_spr != idlespr && !draw_static {
			saved_tv_spr = idlespr
			draw_static = true
			//trace("TO WHITE NOISE")
			state = states.tv_whitenoise
			static_index = 0
				
		}
		
		break
	case states.transitioncutscene:
		if (sprite_index == spr_tv_open && floor(image_index) == (image_number - 1))
			sprite_index = tvsprite
		if (sprite_index == tvsprite)
		{
			if (prompt_buffer > 0)
				prompt_buffer--
			else
			{
				promptx = promptxstart
				ds_list_delete(tvprompts_list, 0)
				state = states.normal
			}
		}
		break
	case states.tv_whitenoise:
		//sprite_index = spr_tv_whitenoise
		draw_static = true
		if (noisebuffer > 0)
			noisebuffer--
		if floor(static_index) >= 4
		{
			//trace("Switch")
			noisebuffer = noisemax
			if (expressionsprite != -4)
			{
				state = states.tv_expression
				sprite_index = expressionsprite
			}
			else {
				state = states.normal
				sprite_index = saved_tv_spr	
			}
			image_index = 0
			draw_static = 0
		}
		break
	case states.tv_expression:
		switch expressionsprite
		{
			case tv_hurt:
			case spr_tv_hurtG:
				if (_state != states.hurt && state != states.ratmounthurt)
				{
					if (expressionbuffer > 0)
						expressionbuffer--
					else
					{
						state = states.tv_whitenoise
						expressionsprite = -4
						draw_static = true
						static_index = 0
					}
				}
				break
			default:
				if (expressionbuffer > 0)
					expressionbuffer--
				else
				{
					state = states.tv_whitenoise
					expressionsprite = -4
					draw_static = true
					static_index = 0
				}
				break
			
		}
		break
}

var change_pos = 0
if (obj_player.x > (room_width - 224) && obj_player.y < 187)
	change_pos = 1
if (bubblespr != -4 && obj_player.x > 316 && obj_player.y < 101)
	change_pos = 1
var spd = 15
if change_pos
	hud_posY = Approach(hud_posY, -300, spd)
else
	hud_posY = Approach(hud_posY, 0, spd)
pizzaface_index += 0.35
hand_index += 0.35
johnface_index += 0.35
prop_index += 0.5

if (global.panic && global.fill > 0)
{
	
	showtime_buffer = 100
	pizzaface_sprite = spr_timer_pizzaface1
	if (!instance_exists(obj_ghostcollectibles))
		timer_y = Approach(timer_y, timer_ystart, 1)
	else
		timer_y = Approach(timer_y, (timer_ystart + 212), 4)
}
else if global.panic
{
	if (pizzaface_sprite == spr_timer_pizzaface1)
	{
		pizzaface_sprite = spr_timer_pizzaface2
		pizzaface_index = 0
	}
	else if (pizzaface_sprite == spr_timer_pizzaface2)
	{
		if (floor(pizzaface_index) == (sprite_get_number(pizzaface_sprite) - 1))
		{
			pizzaface_sprite = spr_timer_pizzaface3
			pizzaface_index = 0
		}
	}
	else if (showtime_buffer > 0)
		showtime_buffer--
	else
		timer_y = Approach(timer_y, (timer_ystart + 212), 1)
}
else
{
	pizzaface_sprite = spr_timer_pizzaface1
	hand_sprite = spr_timer_hand1
	timer_y = (timer_ystart + 212)
}
if (global.panic && global.fill < (chunkmax / 5))
	hand_sprite = spr_timer_hand2
barfill_x -= 0.2
if (barfill_x < -173)
	barfill_x = 0
if (pizzaface_index > (sprite_get_number(pizzaface_sprite)))
	pizzaface_index = frac(pizzaface_index)
if (hand_index > (sprite_get_number(hand_sprite) - 1))
	hand_index = frac(hand_index)
if global.fill > targetfill {
	if johnface_sprite = spr_timer_johnface {
		johnface_sprite = spr_timer_johnface_backstart
		johnface_index = 0	
	}
}
else if johnface_sprite != spr_timer_johnface_backend && johnface_sprite != spr_timer_johnface {
	johnface_sprite = spr_timer_johnface_backend
	johnface_index = 0	
}
	
if (johnface_index > (sprite_get_number(johnface_sprite))) {
	johnface_index = frac(johnface_index)
	if johnface_sprite = spr_timer_johnface_backstart {
		johnface_sprite = spr_timer_johnface_back
		//johnface_index = 0		
	}
	if johnface_sprite = spr_timer_johnface_backend {
		johnface_sprite = spr_timer_johnface
		johnface_index = 0		
	}
}
combo_posX = Wave(-5, 5, 2, 20)
if (global.combotime > 0 && global.combo != 0)
{
	switch combo_state
	{
		case 0:
			combo_posY += combo_vsp
			combo_vsp += 0.5
			if (combo_posY > 20)
				combo_state++
			break
		case 1:
			combo_posY = lerp(combo_posY, 0, 0.05)
			if (combo_posY < 1)
			{
				combo_posY = 0
				combo_vsp = 0
				combo_state++
			}
			break
		case 2:
			if (global.combotime < 30)
			{
				combo_posY += combo_vsp
				if (combo_vsp < 20)
					combo_vsp += 0.5
				if (combo_posY > 0)
				{
					combo_posY = 0
					combo_vsp = -1
					if (global.combotime < 15)
						combo_vsp = -2
				}
			}
			else
				combo_posY = Approach(combo_posY, 0, 10)
			break
	}

}
else
{
	combo_posY = Approach(combo_posY, -500, 5)
	combo_vsp = 0
	combo_state = 0
}
combofill_index += 0.35
if (combofill_index > (sprite_get_number(spr_tv_combobubblefill) - 1))
	combofill_index = frac(combofill_index)
if keyboard_check_pressed(vk_home)
{
    global.attackstyle += 1
    txt_timer = 120
	txt_y = 20
    if (global.attackstyle == 3)
        global.attackstyle = 0
}
if txt_timer > 0 {
	txt_timer--
	txt_y = Approach(txt_y, 0, 0.5)
}
else
	txt_y = Approach(txt_y, 150, 0.35)
	
if keyboard_check_pressed(vk_end)
{
	global.sidemove += 1
	txt_timer2 = 120
	txt_y2 = 20
	if (global.sidemove == 3)
	    global.sidemove = 0
}
/*
if keyboard_check_pressed(vk_insert)
	global.laps++
if keyboard_check_pressed(vk_delete) && global.laps > 0
	global.laps--
	*/
if txt_timer2 > 0 {
	txt_timer2--
	txt_y2 = Approach(txt_y2, 0, 0.35)
}
else
	txt_y2 = Approach(txt_y2, 150, 0.35)
	
if (global.fill > chunkmax) chunkmax = global.fill
global.maxwave = chunkmax
if global.panic targetfill = lerp(targetfill, global.fill, 0.03)
else targetfill = 0


if prompt_timer > 0 {
	promptalpha = Approach(promptalpha, 1, 0.05)
	prompt_timer--	
}
else
	promptalpha = Approach(promptalpha, 0, 0.05)