function create_baddiegibsticks(argument0, argument1)
{
	instance_create(argument0, argument1, obj_baddiegibsstick)
	exit;
}
function use_heat(transfo = false) {
	return (elite || global.laps >= 2 || (global.option_heatmeter && global.stylethreshold >= 3 && !transfo)) && !unforce_elite	
}

function baddie_destroy_points(bID = id) {
	with bID {
		if !important {
			with (obj_player1) supercharge += 1
			global.combo += 1
			if instance_exists(obj_hardmode) global.heatmeter_count++
			var combototal = (10 + round((10 * (global.combo * 0.5) + (5 * global.tradgedymask))))
			global.collect += combototal
			global.comboscore += combototal
			if global.laps >= 1 && chance(5)
				with instance_create(x, y, obj_ammocollect) {
					vsp = random_range(-3, -8)	
					hsp = random_range(8, -8)	
					sprite_index = spr_pizzashield_collectible
				}				
			
			if global.sidemove == 1 && random(1) <= 0.25
				with instance_create(x, y, obj_ammocollect) {
					vsp = random_range(-3, -8)	
					hsp = random_range(8, -8)	
					sprite_index = choose(spr_fuelHUD, spr_bulletHUD)
				}
			if obj_player1.mortGun && chance(-100) {
				with instance_create(x, y, obj_powerup) {
					vsp = random_range(-3, -8)	
					hsp = random_range(8, -8)	
					//sprite_index = choose(spr_fuelHUD, spr_bulletHUD)
				}
			}
			with obj_arenamode_controller if !dead time += 30
			global.style += (5 + global.combo)
	        global.combotime = 60
	        global.heattime = 60	
			with (instance_create(x, y, obj_smallnumber))
				number = string(combototal)	
			
			scr_soundeffect(sfx_killenemy)
			repeat (3) create_baddiedebris()
			create_particle(x, y, particle.bang_effect)
			shake_cam(3)
		
		} else {
			scr_soundeffect(sfx_killenemy)
			repeat (3) create_baddiedebris()
			create_particle(x, y, particle.bang_effect)
			shake_cam(3)
			//ds_list_add(global.baddieroom, id)
		}
	}
}

function baddie_heat_pal(effect = true) {
	
	var old_pal = paletteselect
	switch object_index	{
		default: if (use_heat() && paletteselect == 0) paletteselect = 1 break;
		case obj_kentukykenny: if (use_heat(true) && paletteselect == 0) paletteselect = 1 break;
		case obj_noisey: case obj_robot: if ((global.laps >= 2 || (global.stylethreshold >= 3 && global.option_heatmeter)) && paletteselect == 0) paletteselect = 1 break;
		case obj_pizzaboy: break;
		case obj_peppinoclone: if (use_heat() && paletteselect == 1) paletteselect = 2 break;
	}
	if old_pal != paletteselect && effect {
		flash = true
		create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
	}
	

}

function baddie_unheat_pal(effect = true) {

	var old_pal = paletteselect
	var use = global.laps < 2 && !elite &&  (!global.option_heatmeter || global.stylethreshold < 3)
	var use2 = global.laps < 2 && (!global.option_heatmeter || global.stylethreshold < 3)
	switch object_index	{
		default: if (use && paletteselect == 1) paletteselect = 0 break;
		case obj_noisey: case obj_robot: if use2 && paletteselect == 1 paletteselect = 0 break;
		case obj_pizzaboy: break;
		case obj_peppinoclone: if (use && paletteselect == 2) paletteselect = 1 break;
	}
	if old_pal != paletteselect && effect {
		flash = true
		create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
	}
	
		
	
	
}