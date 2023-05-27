x = Wave(obj_player.x - 75, obj_player.x + 75, 1.5, 0)
y = Wave(obj_player.y + 35, obj_player.y - 35, 0.75, 0)

if x <= obj_player.x - 65
{
	image_xscale = lerp(image_xscale, 0.85, 0.05)
	image_yscale = lerp(image_yscale, 0.85, 0.05)
	depth = obj_player.depth + 1
	colmount = lerp(colmount, 0.25, 0.1)
}
else if x >= obj_player.x + 65
{
	image_xscale = lerp(image_xscale, 1, 0.05)
	image_yscale = lerp(image_yscale, 1, 0.05)
	depth = obj_player.depth - 1
	colmount = lerp(colmount, 0, 0.1)
}
