// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function animation_hit_frame(t_frame) {
	var frame = argument0; // The frame to check for
	return (image_index >= frame+1 - image_speed) && (image_index < frame+1);
}