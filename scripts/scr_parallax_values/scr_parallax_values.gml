
//Default Parallax - making sure
function scr_default_parallax()
{

scr_addParallaxLayer("Backgrounds_1", defaultParallax, [0.16, 0.16]);
scr_addParallaxLayer("Backgrounds_1_2", defaultParallax, [0.16, 0.16]);
scr_addParallaxLayer("Backgrounds_2", defaultParallax, [0.17, 0.17]);
scr_addParallaxLayer("Backgrounds_3", defaultParallax, [0.18, 0.18]);
scr_addParallaxLayer("Backgrounds_4", defaultParallax, [0.19, 0.19]);
scr_addParallaxLayer("Backgrounds_5", defaultParallax, [0.2, 0.2]);
scr_addParallaxLayer("Backgrounds_scroll", defaultParallax, [0.2, 0.2]);
scr_addParallaxLayer("Backgrounds_scroll2", defaultParallax, [0.2, 0.2]);

scr_addParallaxLayer("Backgrounds_Ground1", defaultParallax, [0.2, 0]);
scr_addParallaxLayer("Backgrounds_Ground2", defaultParallax, [0.18, 0]);
scr_addParallaxLayer("Backgrounds_Ground3", defaultParallax, [0.16, 0]);

scr_addParallaxLayer("Backgrounds_H1", defaultParallaxH, [0.12, 1]);
scr_addParallaxLayer("Backgrounds_H2", defaultParallaxH, [0.15, 1]);
scr_addParallaxLayer("Backgrounds_H3", defaultParallaxH, [0.175, 1]);
scr_addParallaxLayer("Backgrounds_H4", defaultParallaxH, [0.2, 1]);

scr_addParallaxLayer("Backgrounds_V1", defaultParallaxV, [0.25, 0.25]);
scr_addParallaxLayer("Backgrounds_V2", defaultParallaxV, [0.15, 0.15]);

scr_addParallaxLayer("Backgrounds_far", defaultParallaxFar, [0.3, 0.3]);
scr_addParallaxLayer("Backgrounds_far1", defaultParallaxFar, [0.25, 0.25]);
scr_addParallaxLayer("Backgrounds_far2", defaultParallaxFar, [0.15, 0.15]);
scr_addParallaxLayer("Backgrounds_far3", defaultParallaxFar, [0.05, 0.05]);

scr_addParallaxLayer("Backgrounds_farh1", defaultParallaxH, [0.15, 0.05]);
scr_addParallaxLayer("Backgrounds_farh2", defaultParallaxH, [0.05, 0.005]);

scr_addParallaxLayer("Backgrounds_stillH1", defaultParallaxH, [0.12, 0.12]);
scr_addParallaxLayer("Backgrounds_stillH2", defaultParallaxH, [0.15, 0.15]);
scr_addParallaxLayer("Backgrounds_stillH3", defaultParallaxH, [0.175, 0.175]);
scr_addParallaxLayer("Backgrounds_stillH4", defaultParallaxH, [0.2, 0.2]);
scr_addParallaxLayer("Backgrounds_stilld", defaultParallax, [0, 0]);
scr_addParallaxLayer("Backgrounds_cloud", defaultParallax, [1, 0]);
scr_addParallaxLayer("Backgrounds_moon", defaultParallax, [0, 0.99]);

scr_addParallaxLayer("Backgrounds_still", defaultParallaxFar, [0.15, 0.15]);
scr_addParallaxLayer("Backgrounds_still1", defaultParallaxFar, [0.15, 0.15]);
scr_addParallaxLayer("Backgrounds_still2", defaultParallaxFar, [0.25, 0.25]);
scr_addParallaxLayer("Backgrounds_still3", defaultParallaxFar, [0.35, 0.35]);

scr_addParallaxLayer("Assets_BG1", defaultParallax, [0.2, 0.2]);
scr_addParallaxLayer("Assets_BG", defaultParallax, [0.2, 0.2]);
scr_addParallaxLayer("Assets_BG2", defaultParallax, [0.15, 0.15]);
scr_addParallaxLayer("Assets_BG3", defaultParallax, [0.1, 0.1]);
scr_addParallaxLayer("Assets_HBG", defaultParallax, [0.15, 0]);
scr_addParallaxLayer("Foreground_1", defaultParallax, [-0.35, -0.35]);
scr_addParallaxLayer("Foreground_Ground1", defaultParallaxGround, [-0.15, -0.25])
scr_addParallaxLayer("Backgrounds_zigzagV1", ParallaxZigZag, [0.16, 0.16]);

/*
#region Foreground_Ground1
bg = function(set_array = -4)
{
	var _camera = new camera_get_position_struct(view_camera[0], set_array);
	var back_id = layer_background_get_id_fixed(layer_get_id("Foreground_Ground1"));
	var _height = room_height - sprite_get_height(layer_background_get_sprite(back_id));
	var array = noone, _zoom = 1; //(camera_get_view_width(view_camera[0]) / 960);
	
	array[0] = (_camera.centeredcam_x * -(0.15 / _zoom));
	array[1] = clamp(((_camera.cam_y * (-(0.25 / _zoom))) + camera_get_view_height(view_camera[0]) - sprite_get_height(layer_background_get_sprite(back_id))), _height, _height + 8);	
	return array;
}

#endregion
*/
}