function scr_transformationcheck(player = object_index)
{
	
	for (var i = 0; i < array_length(player.transformation); i++)
	{
		if (player.state == player.transformation[i])
			return false;
	}
	return true;
}

