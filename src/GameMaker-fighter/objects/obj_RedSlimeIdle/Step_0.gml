isGrounded = place_meeting(x, y + 1, obj_PlatformPlaceholder);

//Shoot function


if(keyboard_check_pressed(vk_lcontrol)) 
{
	sprite_index = spr_RedSlimeShoot;
	
	
	
	
		
	if(image_xscale = 1) 
	{
	
	var slimeBallR = instance_create_layer(x,y, "instances", obj_RedSlimeBallR);
	slimeBallR.direction = image_angle;
	
	}
	
	if(image_xscale = -1) 
	{
	
	var slimeBallL = instance_create_layer(x,y, "instances", obj_RedSlimeBallL);
	slimeBallL.direction = image_angle + 180;
	
	}
	
	
	
}


//gravity
//y += 0.98 * delta_time / 5000;
vsp = vsp + grv;

// idle animation when not moving left or right

if(!keyboard_check(ord("A")) || !keyboard_check(ord("D")) || !keyboard_check(vk_lcontrol))
{
	sprite_index = spr_RedSlimeIdle;
	hsp = 0;
}


if keyboard_check(ord("A"))
{
    sprite_index = spr_RedSlimeRun;
	image_xscale = -1;
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_GreenSlimeIdle)) 
	{
		hsp = -6;
	}
	
	// Stop movement when colliding between players
	
	if(place_meeting(x+hsp,y,obj_GreenSlimeIdle)) 
	{
		x -= 0;
	}
	
}

// sprint left

if(keyboard_check(ord("A")) && keyboard_check(vk_lshift))
{
    sprite_index = spr_RedSlimeSprint;
	image_xscale = -1;
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_GreenSlimeIdle)) 
	{
		
		hsp = -8;
	}
	
	// Stop movement when colliding between players
	
	if(place_meeting(x+hsp,y,obj_GreenSlimeIdle)) 
	{
		x -= 0;
	}
	
}

if keyboard_check(ord("D"))
{
   	
	sprite_index = spr_RedSlimeRun;
	image_xscale = 1;
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_GreenSlimeIdle)) 
	{
		hsp = 6;
	}
	
	// Stop movement when colliding between players
	
	if(place_meeting(x+hsp,y,obj_GreenSlimeIdle)) 
	{
		x += 0;
	}
	
}

// sprint right

if(keyboard_check(ord("D")) && keyboard_check(vk_lshift))
{
    sprite_index = spr_RedSlimeSprint;
	image_xscale = 1;
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_GreenSlimeIdle)) 
	{
		
		hsp = 8;
	}
	
	// Stop movement when colliding between players
	
	if(place_meeting(x+hsp,y,obj_GreenSlimeIdle)) 
	{
		x += 0;
	}
	
}

if keyboard_check(ord("W")) && isGrounded
{
    //motion_set(90,10);
	vsp = -15;
}
//if keyboard_check(ord("S"))
//{
//    //y += 5;
//}
//


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

//Horizontal collision (work in progress)
if (place_meeting(x+hsp,y,obj_PlatformPlaceholder))
{
	while (!place_meeting(x+hsp,y,obj_PlatformPlaceholder))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
	vsp = 1;
}
x = x + hsp;