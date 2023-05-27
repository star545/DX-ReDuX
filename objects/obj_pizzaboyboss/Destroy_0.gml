for (var i = 0; i < 10; i++) {
	var _xx = (960 - 57) - ((i % 5) * 45)
	var _yy = 50 + (floor(i / 5) * 43)
	with instance_create(_xx, _yy, obj_sausageman_dead) {
		sprite_index = spr_pbHp
		image_index = obj_fakebosscontroller.php_index
		image_speed = 0
		
	}
}

		with (instance_create(x, y, obj_sausageman_dead))
		{
			sprite_index = other.spr_dead


		}

scr_soundeffect(sfx_killenemy)
			repeat (3) create_baddiedebris()
			create_particle(x, y, particle.bang_effect)
			shake_cam(3)