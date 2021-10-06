

//Shoot function


if(keyboard_check_pressed(vk_lcontrol)) 
{
	sprite_index = spr_RedSlimeShoot;
	
	
	
	if(image_xscale = scale) 

	{
	
	var slimeBallR = instance_create_layer(x,y, "instances", obj_RedSlimeBallR);
	slimeBallR.direction = image_angle;
	audio_play_sound(sfx_SlimeBall, 0, false);
	
	}
	
	if(image_xscale == -scale) 
	{
	
	var slimeBallL = instance_create_layer(x,y, "instances", obj_RedSlimeBallL);
	slimeBallL.direction = image_angle + 180;
	audio_play_sound(sfx_SlimeBall, 0, false);
	
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
	image_xscale = -scale;
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_BlueSlimeIdle)) 
	{
		hsp = -6;
	}
	
}

// sprint left

if(keyboard_check(ord("A")) && keyboard_check(vk_lshift))
{
    sprite_index = spr_RedSlimeSprint;
	image_xscale = -scale;
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_BlueSlimeIdle)) 
	{
		
		hsp = -8;
	}
	
}

if keyboard_check(ord("D"))
{
   	
	sprite_index = spr_RedSlimeRun;
	image_xscale = scale;
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_BlueSlimeIdle)) 
	{
		hsp = 6;
	}
	
}

// sprint right

if(keyboard_check(ord("D")) && keyboard_check(vk_lshift))
{
    sprite_index = spr_RedSlimeSprint;
	image_xscale = scale;
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_BlueSlimeIdle)) 
	{
		
		hsp = 8;
	}
	
}

if (keyboard_check_pressed(ord("W")) && jump_current > 0)
{
    //motion_set(90,10);
	vsp = -10;
	jump_current--;
}



//Player collision
if(place_meeting(x+hsp,y,obj_BlueSlimeIdle)) 
{
	while (!place_meeting(x+hsp,y,obj_BlueSlimeIdle))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}





//Vertical collision platforms
if (place_meeting(x,y+vsp,obj_PlatformPlaceholder))
{
	while (!place_meeting(x,y+sign (vsp),obj_PlatformPlaceholder))
	{
		y = y + sign(vsp);
	}
	if(vsp>0)
    {
        jump_current = jump_number;
    }
	vsp = 0;
}
y = y + vsp;


//Horizontal collision platforms
if (place_meeting(x+hsp,y,obj_PlatformPlaceholder))
{
	while (!place_meeting(x+hsp,y,obj_PlatformPlaceholder))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
	x = xprevious;
	
}
x = x + hsp;

//horizontal collision world
if x > room_width {x = xprevious;}
if x < 0 {x = 0;}
