/// @desc - Queues an array of dialog to run through the NPC Dialog handler
/// @param argument0 - Array which contains all the dialog to run
/// @param {bool} [instant] - Whether to set the NPC's id when running functions (dunno if it matters lol)
function queue_dialogue(argument0, instant = false) {
	//reset_dialogue()
	global.dialogmsg = -4
	global.dialogmsg = argument0	
	if !instance_exists(obj_dialogue) 
		instance_create(0, 0, obj_dialogue)
	with (obj_dialogue) {
		if obj_dialogue.state = dialogstate.outro
			obj_dialogue.state = dialogstate.intro
		if instant {
			obj_dialogue.state = dialogstate.normal
			
		}
		obj_dialogue.current_message = 0	
	}
	
}	

/// @desc - Deletes all dialog and choices, mainly used to reset dialog before queueing new one to prevent crashes
function reset_dialogue() {
	instance_destroy(obj_dialogue)
	instance_destroy(obj_dialogue_choices)
	global.dialogmsg = -4
	global.dialogchoices = -4
	global.choiced = -4
}

/// @desc - Creates array of dialogs used for Dialog Handler
/// @param {any*} - Text to write out in dialog
/// @param {real} [sprite] - Portrait sprite to be placed next to dialog, can be none
/// @param {asset} [sound] - Sound effect when typing text out
/// @param {real} [func] - Function to run when this message is done
/// @returns {array} - Array that dialog handler uses to process options for the message
function create_dialogue(text, sprite = noone, sound = sfx_bumpwall, func = noone) {
	return [text, sprite, sound, func]	
}
/// @desc - Creates array of choice used for Choice Handler
/// @param {any*} text - Text for the option that is shown when selecting
/// @param {any*} func - Function to run when selecting respective choice
/// @returns {array} - Array that choice handler uses to process options for the message
function create_choice(text, func) {
	return [text, func]	
}	
/// @desc - Queues array of choices to be ran through Dialog Choice Handler
/// @param {any*} argument0 - Array input that has all the choices that will be queued
/// @param {any*} text - Text that describes what exactly the choices are for
function queue_choices(argument0, text) {
	reset_dialogue()
	with instance_create(x, y, obj_dialogue_choices)
		msg_text = text
	global.dialogchoices = argument0
	show_debug_message(global.dialogchoices)
		
}	

