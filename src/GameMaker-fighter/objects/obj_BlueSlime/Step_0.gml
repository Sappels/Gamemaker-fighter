if(keyboard_check_pressed(vk_lcontrol)) 
{
	var inst = instance_create_layer(x,y, "instances", obj_BlueSlimeBall);
	inst.direction = image_angle;
}
