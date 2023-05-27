var _state = obj_player1.state == states.chainsaw ? obj_player1.tauntstoredstate : obj_player1.state
if (_state != states.ghost) {
	x = xstart
	y = ystart
}
else {
	x = -100
	y = -100
}
