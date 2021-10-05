
//Shoot function
if(keyboard_check_pressed(vk_rcontrol)) 
{
	var inst = instance_create_layer(x,y, "instances", obj_GreenSlimeBall);
	inst.direction = image_angle + 180;
	
}



//gravity
//y += 0.98 * delta_time / 5000;
vsp = vsp + grv;


//movement
if keyboard_check(vk_left)
{
    x -= 5;
}
if keyboard_check(vk_right)
{
    x += 5;
}
if keyboard_check(vk_up)
{
    vsp = -5;
}
if keyboard_check(vk_down)
{
    //y += 5;
}



//Vertical collision (work in progress)
if (place_meeting(x,y+vsp,obj_PlatformPlaceholder))
{
	while (!place_meeting(x,y+sign (vsp),obj_PlatformPlaceholder))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;


