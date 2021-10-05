

//Shoot function
if(keyboard_check_pressed(vk_lcontrol)) 
{
	var inst = instance_create_layer(x,y, "instances", obj_BlueSlimeBall);
	inst.direction = image_angle;
}


//gravity
y += 0.98 * delta_time / 5000;


if keyboard_check(ord("A"))
{
    x -= 5;
}
if keyboard_check(ord("D"))
{
    x += 5;
}
if keyboard_check(ord("W"))
{
    y -= 5;
}
if keyboard_check(ord("S"))
{
    y += 5;
}



//Vertical collision (work in progress)
if (place_meeting(x,y+vsp,obj_PlatformPlaceholder))
{
	while (!place_meeting(x,y+sign (vsp),obj_PlatformPlaceholder))
	{
		x = x + sign(vsp);
	}
	vsp = 0;
}
x = x + vsp;