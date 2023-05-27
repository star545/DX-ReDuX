/*if global.panic
{
	
	var pct = clamp(1 - (global.fill / obj_tv.chunkmax), 0, 1)
	var tilt_percent = 0
	if pct >= 0.2 tilt_percent = lerp(0, 1, pct - 0.2)
	tilt_percent = clamp(tilt_percent, 0, 1)
	var mult = 1 + tilt_percent
	var r = round(20 * tilt_percent)
	if buffer > 0 
		buffer--
	else if r > 0 {
		repeat(r) create_debris(irandom(room_width), 0, spr_johnDebris_generic, false) 
		
	
	
		buffer = 10
		
		
	}
}
