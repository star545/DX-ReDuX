var cur_msg = text_array[message_pos]
var cur_txt = cur_msg[0]
var cur_snd = cur_msg[1]

var snd_length = audio_sound_length(cur_snd) * 1000
snd_length *= 0.2

active = place_meeting(x, y, obj_player)
var prevText_pos = text_pos
if state = states.arenaintro {
	text_pos = 0	
	message_pos = 0
	typer.sound_per_char(cur_snd, 0.95, 1.05)
	text_scroll = 0.3
	set_color = c_white
	typer.in(0,0)
	message_delay = 200
}
else if typer.get_state() < 1 {
	
	
	
	//typer.sound_per_char(_setsnd, 1, 1)	
	
}
else if message_delay > 0
	message_delay--
else if message_pos < array_length(text_array) - 1 {
	message_pos++
	typer.sound_per_char(cur_snd, 0.95, 1.05)
	text_pos = 0
	message_delay = 200
}
else {
	text_pos = 0	
	message_pos = 0	
	message_delay = 200
}

if !active {
	if bubble_spr != spr_npcbubble_close && bubble_spr != noone {
		bubble_spr = spr_npcbubble_close
		bubble_index = 0	
	}
	bubble_index += 0.35
	state = states.arenaintro
	if bubble_spr == spr_npcbubble_close && bubble_index >= sprite_get_number(bubble_spr) 
		bubble_spr = noone
}
else {
	if bubble_spr != spr_npcbubble_open && bubble_spr != spr_npcbubble {
		bubble_spr = spr_npcbubble_open
		bubble_index = 0	
	}
	bubble_index += 0.35
	if bubble_spr == spr_npcbubble_open && bubble_index >= sprite_get_number(bubble_spr) {
		state = states.normal
		typer.in(0.3,0)
		bubble_spr = spr_npcbubble
	}
	
	
}
/*
if floor(text_pos) != floor(prevText_pos) && text_pos != 0 && ((floor(text_pos) % 2) == 0)
	scr_soundeffect(cur_snd)
	