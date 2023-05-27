/// @description Create Default Trigger Stuff
inst_num = instance_number(obj_eventtrigger);
condition = noone;
output = noone;
reverse_output = noone;
#region Default

//Create Condition
default_condition = function() 
{
	return place_meeting(x, y, obj_player);			
}
//Create Output
default_output = function() 
{		
	show_debug_message("Event Trigger:" + string(id) + " - Has missing Output")
}

#endregion

//Mode Stuff
flags = 
{
	do_once : true, //Allows you to call the Output everytime the condition is met. (Makes the output occur once)
	do_save : true, //Allows you to make the trigger save until level restart or exit. (Makes the output Persist)
	do_once_per_save : false, //Allows you to call the Output everytime the condition is met during the room start. (Makes the output occur once)
	saveroom : global.saveroom //Determines which DS_list to save to. (Default: Saveroom)
}
activated = false;

condition = default_condition; //If condition is:
output = default_output; //True - do this
reverse_output = noone; //False - do this



/*
Example
flags.do_once = true;
flags.do_save = true;
flags.saveroom = global.baddieroom;
condition = function() 
{
	return (place_meeting(x, y, obj_player) && obj_player.state == states.groundpoundland);
}

output = function() 
{
	with obj_secretteleporter
	{
		activate = true;
		image_index = 0;
	}
}


*/