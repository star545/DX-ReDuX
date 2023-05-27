var _a = 0.75

if (obj_player.state == states.ghost)
	if (_a != 1)
		_a = Approach(_a, 1, 0.1)
else
	if (_a != 0.5)
		_a = Approach(_a, 0.5, 0.1)

image_alpha = _a