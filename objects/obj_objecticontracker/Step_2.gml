if (!instance_exists(objectID))
{
	instance_destroy()
	exit;
}
x = objectID.x
y = objectID.y
var cx = camera_get_view_x(view_camera[0])
var cy = camera_get_view_y(view_camera[0])
var cw = camera_get_view_width(view_camera[0])
var ch = camera_get_view_height(view_camera[0])
var edge_x = (abs(sprite_width) / 2)
var edge_y = (abs(sprite_height) / 2)
var pad = 12
yoffset = Wave(-4, 4, 2, 8)
var l = ((cx + edge_x) + pad)
var t = ((cy + edge_y) + pad)
var r = (((cx + cw) - edge_x) - pad)
var b = (((cy + ch) - edge_y) - pad)
x = clamp(x, l, r)
y = clamp(y, t, b)
var in_cam = 0
with objectID if bbox_in_camera(view_camera[0], pad) in_cam = true
if !in_cam
	visible = true
else
	visible = false
if obj_player1.state == states.bossdefeat visible = false	
if objectID.object_index == obj_arenaspawner {
	with objectID {
		if current_enem >= array_length(enemy_array) || enemy_array == [] 
			other.visible = false
		
	}
	
}//&& objectID.visible == false visible = false
