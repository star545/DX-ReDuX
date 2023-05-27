if (room == rm_editor)
	exit;
switch state
{
	case states.idle:
		if (sprite_index != spr_soldier_idleend)
			scr_enemy_idle()
		break
	case states.turn:
		scr_enemy_turn()
		break
	case states.walk:
		scr_enemy_walk()
		break
	case states.land:
		scr_enemy_land()
		break
	case states.hit:
		scr_enemy_hit()
		break
	case states.stun:
		scr_enemy_stun()
		break
	case states.pizzagoblinthrow:
		scr_pizzagoblin_throw()
		break
	case states.grabbed:
		scr_enemy_grabbed()
		break
	case states.pummel:
		scr_enemy_pummel()
		break
	case states.staggered:
		scr_enemy_staggered()
		break
	case states.rage:
		scr_enemy_rage()
		break
}

if (state == states.stun && stunned > 100 && birdcreated == 0)
{
	birdcreated = 1
	with (instance_create(x, y, obj_enemybird))
		ID = other.id
}
if (state != states.stun)
	birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = (0.15 * room_speed)
var hoooo_boy_i_am_on_fire = use_heat()
var player = instance_nearest(x, y, obj_player)
var in_sight = (image_xscale == 1 ? (player.x > x) : (player.x < x)) && number_in_range(player.y, y - 15, y + 15)
switch state
{
	case states.idle:
		if bush
		{
			var col = collision_line(x, y, player.x, player.y, obj_solid, false, true)
			var col2 = collision_line(x, y, player.x, player.y, obj_slope, false, true)
			var colX = (player.x > (x - threshold_x) && player.x < (x + threshold_x))
			var colY = (player.y > (y - threshold_y) && player.y < (y + threshold_y))
			if (sprite_index != scaredspr && !use_heat() && col == -4 && col2 == -4 && colX && colY)
			{
				if (x != player.x)
					image_xscale = sign((player.x - x))
				bush = 0
				sprite_index = spr_soldier_idleend
				image_index = 0
			}
			
			if (sprite_index != scaredspr && col == -4 && col2 == -4 && in_sight && use_heat())
			{
				if (x != player.x)
					image_xscale = sign((player.x - x))
				sprite_index = spr_soldier_shootstart
				image_index = 0
				state = states.charge
				var _max_bullet = 1
				bullet_count = _max_bullet
				can_fire = 1
			}
			
		}
		else if (sprite_index == spr_soldier_idleend && floor(image_index) == (image_number - 1))
		{
			state = states.walk
			sprite_index = spr_soldier_walk
		}
		break
	case states.charge:
		hsp = Approach(hsp, 0, 0.5)
		if (sprite_index == spr_soldier_shootstart && floor(image_index) == (image_number - 1))
			sprite_index = spr_soldier_shoot
		if (sprite_index != spr_soldier_shootstart)
		{
			if (bullet_count > 0)
			{
				if can_fire
				{
					can_fire = 0
					var _fire_max = use_heat() ? 1 : fire_max
					alarm[5] = _fire_max
					bullet_count--
					sprite_index = spr_soldier_shoot
					image_index = 0
					var _hsp = (image_xscale * recoil_spd)
					if use_heat() 
						_hsp = (image_xscale * recoil_spd) / 10
					hsp -= _hsp
					
					scr_soundeffect(sfx_enemyprojectile)
					with (instance_create(x, y, obj_enemybullet)) {
						image_xscale = other.image_xscale
						phase = true	
						spd = hoooo_boy_i_am_on_fire ? 24 : 8
						vsp = 0
					}
					
				}
			}
			else if (floor(image_index) == (image_number - 1))
			{
				sprite_index = use_heat() ? spr_soldier_idle : spr_soldier_walk
				var _attack_max = 120
				if use_heat() 
					_attack_max = 240
				attack_cooldown = _attack_max
				state = use_heat() ? states.idle : states.walk
				
			}
		}
		break
	case states.walk:
		if (attack_cooldown > 0)
			attack_cooldown--
		else if !use_heat()
		{
			col = collision_line(x, y, player.x, player.y, obj_solid, false, true)
			col2 = collision_line(x, y, player.x, player.y, obj_slope, false, true)
			colX = (player.x > (x - threshold_x) && player.x < (x + threshold_x))
			colY = (player.y > (y - threshold_y) && player.y < (y + threshold_y))
			if (sprite_index != scaredspr && col == -4 && col2 == -4 && colX && colY)
			{
				if (x != player.x)
					image_xscale = sign((player.x - x))
				sprite_index = spr_soldier_shootstart
				image_index = 0
				state = states.charge
				var _max_bullet = 3
				bullet_count = _max_bullet
				can_fire = 1
			}
		}
		//if use_heat() state = states.idle
		break
}

if knife
{
	if (state == states.walk)
	{
		if (player.x > (x - 200) && player.x < (x + 200) && y <= (player.y + 60) && y >= (player.y - 60))
		{
			if (state != states.rage && ragebuffer == 0)
			{
				hitboxcreate = 0
				state = states.rage
				sprite_index = spr_soldier_knife
				if (x != player.x)
					image_xscale = (-(sign((x - player.x))))
				ragebuffer = 100
				image_index = 0
				image_speed = 0.5
				flash = 1
				alarm[4] = 5
			}
		}
	}
	if (ragebuffer > 0)
		ragebuffer--
}
if (state != states.grabbed)
	depth = 0
if (state != states.stun)
	thrown = false
if (boundbox == 0)
{
	with (instance_create(x, y, obj_baddiecollisionbox))
	{
		sprite_index = other.sprite_index
		mask_index = other.sprite_index
		baddieID = other.id
		other.boundbox = 1
	}
}
