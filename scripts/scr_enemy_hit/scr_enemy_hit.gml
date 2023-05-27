function scr_enemy_hit()
{
	//x = hitX 
	//y = hitY
	hsp = 0
	vsp = 0
	hitLag--
	sprite_index = stunfallspr
	//check_grabbed_solid(obj_player1)
	if (hitLag <= 0)
	{
		//x = hitX
		//y = hitY
		var _state = obj_player1.state == states.chainsaw ? obj_player1.tauntstoredstate : obj_player1.state
		fake_thrown = false
		thrown = false
		if !_state == states.mach2
			fake_thrown = true
		if kill_throw {
			thrown = true
			mach3destroy = false	
		}
		if lunge_throw {
			thrown = true
			linethrown = true
			lunge_throw = false
		}
			
		vsp = hitvsp
		hsp = hithsp
		global.hit += 1
		if (other.object_index == obj_pizzaball)
			global.golfhit += 1
		global.combotime = 60
		global.heattime = 60
		alarm[1] = 5
		var _hp = 0
		if ((global.attackstyle == 3 or global.attackstyle == 0) && (!global.kungfu))
			_hp = -1
		if destroyable && !kill_throw && ( (!elite && (hp <= _hp || mach3destroy)) || (elite && elitehit <= 0 && mach3destroy) )
		{
			instance_destroy()
			instance_create(x, y, obj_genericpoofeffect)
		}
		stunned = 200
		state = states.stun
	}
	exit;
}

