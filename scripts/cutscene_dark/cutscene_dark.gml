function cutscene_dark(){
	draw_text_scribble(960 - 94, 489, "[spr_promptfont][fa_middle][fa_right]" + "Rumbling from deep within the basement occurs...")
	cutscene_end_action()
}

function cutscene_dark_wait() {
	var waittime = string_length("Rumbling from deep within the basement occurs...")
	time = clamp(time, 60, 450)
	while not time <= 0
		time--
	if time == 0
		cutscene_end_action()
}
function cutscene_dark_end() {
	room = Realtitlescreen
	instance_destroy(obj_cutscene_fade)
	instance_create(0, 0, obj_fakeFade)
	
	
}