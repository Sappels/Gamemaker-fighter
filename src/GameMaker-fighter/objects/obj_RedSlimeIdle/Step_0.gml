

//Shoot function
if(keyboard_check_pressed(vk_lcontrol)) 
{
	var inst = instance_create_layer(x,y, "instances", obj_BlueSlimeBall);
	inst.direction = image_angle;
}


//gravity
//y += 0.98 * delta_time / 5000;
vsp = vsp + grv;

// idle animation when not moving left or right

if(!keyboard_check(vk_left) || !keyboard_check(vk_right)) 
{
	sprite_index = spr_RedSlimeIdle;
}


if keyboard_check(ord("A"))
{
    sprite_index = spr_RedSlimeRun;
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_GreenSlimeIdle)) 
	{
		x -= 3;
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
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_GreenSlimeIdle)) 
	{
		
		x -= 5;
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
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_GreenSlimeIdle)) 
	{
		x += 3;
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
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_GreenSlimeIdle)) 
	{
		
		x += 5;
	}
	
	// Stop movement when colliding between players
	
	if(place_meeting(x+hsp,y,obj_GreenSlimeIdle)) 
	{
		x += 0;
	}
	
}

if keyboard_check(ord("W"))
{
    //motion_set(90,10);
	vsp = -5;
}
if keyboard_check(ord("S"))
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