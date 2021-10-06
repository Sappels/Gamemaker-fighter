isGrounded = place_meeting(x, y + 1, obj_PlatformPlaceholder);

//Shoot function
if(keyboard_check_pressed(vk_rcontrol)) 
{
	
	
	if(image_xscale = 1) 
	{
		var slimeBallL = instance_create_layer(x,y, "instances", obj_BlueSlimeBallL);
		slimeBallL.direction = image_angle + 180;
	}
	
	if(image_xscale = -1) 
	{
		var slimeBallR = instance_create_layer(x,y, "instances", obj_BlueSlimeBallR);
		slimeBallR.direction = image_angle;
	}
	
}



//gravity
//y += 0.98 * delta_time / 5000;
vsp = vsp + grv;


// idle animation when not moving left or right

if(!keyboard_check(vk_left) || !keyboard_check(vk_right)) 
{
	sprite_index = spr_BlueSlimeIdle;

	

	hsp = 0;

}

//movement

if (keyboard_check(vk_left))
{
    sprite_index = spr_BlueSlimeRun;
	image_xscale = 1;
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_RedSlimeIdle)) 
	{
		
		hsp = -6;
		
	}
	
	// Stop movement when colliding between players
	
	if(place_meeting(x+hsp,y,obj_RedSlimeIdle)) 
	{
		x -= 0;
	}
	
}

// sprint left

if(keyboard_check(vk_left) && keyboard_check(vk_rshift))
{
    sprite_index = spr_BlueSlimeSprint;
	image_xscale = 1;
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_RedSlimeIdle)) 
	{
		
		hsp = -8;
		
	}
	
	// Stop movement when colliding between players
	
	if(place_meeting(x+hsp,y,obj_RedSlimeIdle)) 
	{
		x -= 0;
	}
	
}



if keyboard_check(vk_right)
{
    
	sprite_index = spr_BlueSlimeRun;
	image_xscale = -1;
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_RedSlimeIdle)) 
	{
		hsp = 6;
		
	}
	
	// Stop movement when colliding between players
	
	if(place_meeting(x+hsp,y,obj_RedSlimeIdle)) 
	{
		x += 0;
	}
	
}

// sprint right

if(keyboard_check(vk_right) && keyboard_check(vk_rshift))
{
    
	sprite_index = spr_BlueSlimeSprint;
	image_xscale = -1;
	
		
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_RedSlimeIdle)) 
	{
		
		hsp = 8;
		
	}
	
	// Stop movement when colliding between players
	
	if(place_meeting(x+hsp,y,obj_RedSlimeIdle)) 
	{
		x += 0;
	}
	
	
	
}

if keyboard_check(vk_up) && isGrounded
{
    vsp = -15;
	
}
//if keyboard_check(vk_down)
//{
//    //y += 5;
//}



//Vertical collision 
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

//horizontal collision
if x > room_width {x = xprevious;}
if x < 0 {x = 0;}


