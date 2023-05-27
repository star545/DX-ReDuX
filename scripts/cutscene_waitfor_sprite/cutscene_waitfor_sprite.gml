function cutscene_waitfor_sprite(argument0)
{
	var _obj = argument0
	var finish = 0
	if anim_end(_obj.image_number - 1, _obj.image_index)
		cutscene_end_action()
	exit;
}
