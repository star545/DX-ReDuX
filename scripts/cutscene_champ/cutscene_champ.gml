function cutscene_champ_start() {
	with obj_champ_cutscenegate {
		state = states.fall
		
		
	}
	cutscene_end_action()
	
	
}
function cutscene_champ_wait() {
	if obj_champ_cutscenegate.state == states.finishingblow cutscene_end_action()
	
	
}
function cutscene_champ_end() {
	room = Realtitlescreen
	instance_destroy(obj_cutscene_fade)
	instance_create(0, 0, obj_fakeFade)
	
	
}