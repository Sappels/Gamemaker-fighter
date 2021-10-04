if(keyboard_check_pressed(vk_rcontrol) {
	var inst = instance_create_layer(x,y, "instances", obj_GreenSlimeBall);
	inst.direction = image_angle;
}
