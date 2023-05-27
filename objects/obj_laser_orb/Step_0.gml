

if !instance_exists(orbID)
	x += hsp
	y += vsp
	image_alpha = Approach(image_alpha, 0, 0.05)
	if image_alpha <= 0
		instance_destroy()
else {
	var dir = point_direction(x, y, orbID.x, orbID.y)
	var _mvspd = mvspd
	mvspd += 0.2
	_mvspd = clamp(_mvspd, 0.1, 2)
	hsp = lengthdir_x(_mvspd, dir) 
	vsp = lengthdir_y(_mvspd, dir) 
	x = Approach(x, orbID.x, hsp)
	y = Approach(y, orbID.y, vsp)
	image_alpha = Approach(image_alpha, 1, 0.1)
	if x = orbID.x && y = orbID.y 
		instance_destroy()
}