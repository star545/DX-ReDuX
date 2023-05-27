var curMsg = global.dialogmsg[current_message]
var dialogLength = array_length(global.dialogmsg)
var _text = curMsg[0]
var _textLength = string_length(_text)
var _portrait = curMsg[1]
var _sound = curMsg[2]
var _pitchrng = 0
if is_array(_sound){ 
	_pitchrng = _sound[1]
	_sound = _sound[0]
	
}
var _func = curMsg[3]
var hasImage = _portrait != -4
var _states = obj_player1.state == states.actor || obj_player1.state == states.talkto



var _spd = yoffset < 50 ? ((yoffset / 50) * 8) + 0.3 : 8
//image_alpha = 1 - (yoffset / 200)

//drawspd = (obj_player1.key_slap ? 1.5 : 0.5)
snddelay = drawspd * 3
	
if !_states && state != dialogstate.outro
	instance_destroy()
	
switch state {
	
	case dialogstate.intro:
		yoffset = Approach(yoffset, 0, _spd)
		typer.in(0, 0)
		if yoffset = 0 || _states && obj_player1.key_jump {
			state = dialogstate.normal
			typer.in(0.5, 0)
		}
		
	break
	
	case dialogstate.outro:
		yoffset = Approach(yoffset, 200, _spd)
		if yoffset = 200 || instant_destroy
			instance_destroy()
	break
	
	case dialogstate.normal:
		yoffset = 0
		//var _setsnd = typer.sound(_sound, 30, 0.95, 1.05)
		typer.sound(_sound, 10, 1 - _pitchrng, 1 + _pitchrng)
		//typer.sound_per_char(_sound, 1, 1, ".,?!")
		if _states && obj_player1.key_jump {
			switch typer.get_state() {
				case 1:
					event_user(0)
				break
				default:
					typer.skip(true)
				break
			
			}
		}
		/*
		if _states && obj_player1.key_jump || force_next {
			if drawchar >= _textLength || force_next { //If message is done
				// Do function
				
			}	
			else { // Set text to end
				real_drawchar = _textLength
				drawchar = _textLength
			}
		}
		*/
	break
	case dialogstate.choices:
		yoffset = 0
		var totalChoices = array_length(global.dialogchoices)
		var curChoice = global.dialogchoices[choice_selected]
		var _funcChoice = curChoice[1]
		move2 = -(obj_player1.key_up2 - obj_player1.key_down2)
		choice_selected += 1 * move2
		choice_selected = wrap(choice_selected, 0, totalChoices - 1)
		if obj_player1.state == states.actor && obj_player1.key_jump {
			drawchar = 0
			if current_message == dialogLength - 1 { // If last message, end dialog
				state = dialogstate.outro
				obj_player1.state = states.normal	
			}	
			else // Next Message
				current_message++
			if _func != -4 {
				if whos_talkin != -4 && instance_exists(whos_talkin)
					with (whos_talkin)
						_func()
				else
					_func()
			}

			
		}
		
	break
	
	
}
#region Text Scrolling + sound
pause_time--
if pause_time <= 0 {
	if drawchar < _textLength + 1 && (state = dialogstate.normal || state = dialogstate.choices) {
		drawchar += drawspd
		var curLetter = string_char_at(_text, real_drawchar)
		var nextLetter = string_char_at(_text, real_drawchar + 1)
		var nexterLetter = string_char_at(_text, real_drawchar + 2)
		var nextestLetter = string_char_at(_text, real_drawchar + 3)
	}
}
else {
	show_debug_message(pause_time)
}
#endregion