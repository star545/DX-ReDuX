with instance_nearest(x, y, obj_player) {
	var _hurt = 0
	if (state != states.hurt && state != states.ratmounthurt && state != states.grabbed && other.cooldown <= 0 && cutscene == 0)
		{
			other.cooldown = 60
			if (state == states.mort or state == states.morthook or state == states.mortjump or state == states.mortattack)
			{
				with (instance_create(x, y, obj_mortflyaway))
					image_xscale = (-other.xscale)
			}
			if instance_exists(obj_hardmode)
				global.heatmeter_count = ((global.heatmeter_threshold - 1) * global.heatmeter_threshold_count)
			_hurt = 1
			//if (character == characters.vigilante)
				//global.playerhealth -= 25
			if (state == states.barrel or state == states.barrelclimbwall or state == states.barreljump or state == states.barrelslide)
			{
				repeat (4)
					create_debris(x, y, spr_barreldebris)
			}
			if global.kungfu
			{
				if (global.hp > 1)
				{
					global.hp--
					with (obj_camera)
						healthshaketime = 60
				}
				else
				{
					with (obj_music)
						arena = 0
					global.kungfu = 0
					if (!instance_exists(obj_fadeout))
					{
						with (obj_player)
							targetRoom = lastroom
						instance_create(x, y, obj_fadeout)
					}
				}
			}
			if (state == states.grabbed)
			{
				if (object_index == obj_player1)
					y = obj_player2.y
				else
					y = obj_player1.y
			}
			scr_soundeffect(sfx_pephurt)
			alarm[8] = 100
			alarm[7] = 50
			hurted = 1
			if (xscale == other.image_xscale)
				sprite_index = spr_hurtjump
			else
				sprite_index = spr_hurt
			movespeed = 8
			vsp = -14
			timeuntilhpback = 300
			instance_create(x, y, obj_spikehurteffect)
			
			state = states.hurt
			if super_mario {
				state = states.gameover 
				visible = false
				instance_create(x, y, obj_mariodead)
			}
			image_index = 0
			flash = 1
		}
		if _hurt
		{
			global.combotime -= 25
			global.style = 0
			global.stylethreshold--
			global.stylethreshold = clamp(global.stylethreshold, 0, 3)
			global.hurtcounter += 1
			//scr_heatdown()
			var loseamount = global.option_heatmeter ? 50 + (50 * global.stylethreshold) : 50
			var r = global.collect >= loseamount ? loseamount / 10 : global.collect / 10
			r = round(r)
			global.collect -= loseamount
			global.collect = max(global.collect, 0)
			var col = get_chardetail("collect")
			repeat (r) with instance_create(121, 81 + obj_camera.hud_posY, obj_pizzaloss) sprite_index = col[irandom(array_length(col) - 1)]
			obj_camera.collect_shake = 10
			
			
		}	
	
	
}