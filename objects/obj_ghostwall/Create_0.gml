with (instance_create(x, y, obj_ghosttransparency))
{
	mask_index = other.sprite_index
	sprite_index = other.sprite_index
	image_xscale = other.image_xscale
}
away = 0
canCollide = function(who_is = obj_player) {
	var _state = obj_player1.state == states.chainsaw ? obj_player1.tauntstoredstate : obj_player1.state
	return _state != states.ghost
}