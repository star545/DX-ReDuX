/// @description Next MSG
var curMsg = global.dialogmsg[current_message]
var dialogLength = array_length(global.dialogmsg)
var _func = curMsg[3]


if _func != -4 {
	_func()
}
//
if state != dialogstate.choices {
	drawchar = 0
	if current_message == dialogLength - 1 { // If last message, end dialog
		state = dialogstate.outro
		//obj_player.state = states.normal	
	}	
	else {// Next Message
		current_message++
	}
}
typer.skip(false)
force_next = false;



