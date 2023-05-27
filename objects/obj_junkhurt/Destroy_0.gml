var a = sprite_get_number(debris_num)
for (var i = 0; i < a; i++) { with create_debris(x + random_range(-32, 32), y+ random_range(-32, 32) , debris_num, 0) { image_index = i } }
if debris_num == spr_null instance_create(x, y, obj_canonexplosion)