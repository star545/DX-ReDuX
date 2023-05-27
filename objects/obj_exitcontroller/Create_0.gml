buffer = 0
music_time = 0
cur_music_sync = 0
escape_debris = false
//alarm[0] = 30
/*
music_sync = [
[0, function() { cam_shakex(20, 0.5, 0) }],
[1.55, function() { cam_shakex(20, 0.5, 0) }],
[3.1, function() { cam_shakex(20, 0.5, 0) }],
[4.53, function() { cam_shakex(20, 0.5, 0) }],
[6.12, function() {
	cam_shakex(20, 0.5, 0);
	repeat(60) with create_debris(irandom(room_width), 0, spr_johnDebris_generic, false) {
		vsp = 5
		image_speed = 0		
	}
	}],
[18.09, function() {
	cam_shakex(20, 0.5, 0);
	repeat(60) with create_debris(irandom(room_width), 0, spr_johnDebris_generic, false) {
		vsp = 5
		image_speed = 0		
	}
	}],
[30.1, function() { cam_shakex(20, 0.5, 0) }],
[54.08, function() {
	cam_shakex(20, 0.5, 0);
	repeat(60) with create_debris(irandom(room_width), 0, spr_johnDebris_generic, false) {
		vsp = 5
		image_speed = 0		
	}
	}],
[57.14, function() {
	cam_shakex(20, 0.5, 0);
	repeat(60) with create_debris(irandom(room_width), 0, spr_johnDebris_generic, false) {
		vsp = 5
		image_speed = 0		
	}
	}],
[60.15, function() {
	cam_shakex(20, 0.5, 0);
	escape_debris = true
	repeat(60) with create_debris(irandom(room_width), 0, spr_johnDebris_generic, false) {
		vsp = 5
		image_speed = 0		
	}
	}],
[63.18, function() {
	cam_shakex(20, 0.5, 0);
	repeat(60) with create_debris(irandom(room_width), 0, spr_johnDebris_generic, false) {
		vsp = 5
		image_speed = 0		
	}
	}],
[66.08, function() {
	cam_shakex(20, 0.5, 0);
	repeat(60) with create_debris(irandom(room_width), 0, spr_johnDebris_generic, false) {
		vsp = 5
		image_speed = 0		
	}
	}],
[69.12, function() {
	cam_shakex(20, 0.5, 0);
	repeat(60) with create_debris(irandom(room_width), 0, spr_johnDebris_generic, false) {
		vsp = 5
		image_speed = 0		
	}
	}],
[72.12, function() {
	cam_shakex(20, 0.5, 0);
	repeat(60) with create_debris(irandom(room_width), 0, spr_johnDebris_generic, false) {
		vsp = 5
		image_speed = 0		
	}
	}],
[78.1, function() { cam_shakex(20, 0.5, 0) }],
[81.14, function() { cam_shakex(20, 0.5, 0) }],
[84.06, function() { cam_shakex(20, 0.5, 0) }],
[90.09, function() { cam_shakex(20, 0.5, 0) }],
[93.04, function() { cam_shakex(20, 0.5, 0) }],
[96.12, function() { cam_shakex(20, 0.5, 0) }],
[99.07, function() { cam_shakex(20, 0.5, 0) }],
[102.16, function() { cam_shakex(20, 0.5, 0) }],
[105.10, function() { cam_shakex(20, 0.5, 0) }],
[106.33, function() { cam_shakex(20, 0.5, 0) }],
[108.06, function() { cam_shakex(20, 0.5, 0) }],
[111.13, function() { cam_shakex(20, 0.5, 0) }],
[112.52, function() { cam_shakex(20, 0.5, 0) }],
[114.10, function() { cam_shakex(20, 0.5, 0) }],
[138.09, function() { cam_shakex(20, 0.5, 0) }],
[204, function() { }]

]