if global.option_performance == true { 
	instance_destroy()
	exit; 
}

image_speed = 0;
depth = 50;
trueYscale = image_yscale;
image_yscale = sign(image_yscale);
img_array = []
repeat(abs(trueYscale)) array_push(img_array, irandom_range(0, image_number - 1))
if (ds_list_find_index(global.saveroom, id) == -1) ds_list_add(global.saveroom, id, img_array);
else img_array = ds_list_find_value(global.saveroom, ds_list_find_index(global.saveroom, id) + 1);
image_angle = 0




