if get_keypieces() < 25 || get_progress() < 3 instance_destroy()
switch room {
	case tower_1: if get_keyname("pbroom1") instance_destroy() break;	
	case tower_2: if get_keyname("pbroom2") instance_destroy() break;	
	case tower_3: if get_keyname("pbroom3") instance_destroy() break;	
	case tower_4: if get_keyname("pbroom4") instance_destroy() break;	
	case tower_5: if get_keyname("pbroom5") instance_destroy() break;	
	
}
image_xscale = face_obj(obj_player1)