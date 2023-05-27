if !active exit;
//trace("I EXIST")
if show_time > 0 show_time--
else if time > 0 && obj_player1.state != states.chainsaw {
	time--
	instance_create_unique(obj_player1.x, obj_player1.y, obj_pizzaface)	
}
if time == 0 global.timerdropped = true

var tgt_y = 0

if show_time > 0 tgt_y = 100

time_fx_y = Approach(time_fx_y, -50, 1)
time_fx_y = clamp(time_fx_y, -50, 0)

surfy = Approach(surfy, tgt_y, 3)
surfscale = (surfy / 100) * 0.5