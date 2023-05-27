if x > room_width
	instance_destroy()
	
with (create_blur_afterimage(x, y, sprite_index, image_index -1, image_xscale))
	playerid = other.id
	
if moving 
{
	x -= 30 * sign(image_xscale)
	if !instance_exists(obj_hungrypillar)
	{
		obj_player.state = states.normal
	}
}