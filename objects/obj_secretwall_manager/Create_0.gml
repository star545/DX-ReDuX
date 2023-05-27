depth = -34
var a = object_index
if (instance_number(a) > 1) {
	var _first = instance_find(a, 0);
	if (id != _first) {
		instance_destroy(); 
		exit; 
	}
}