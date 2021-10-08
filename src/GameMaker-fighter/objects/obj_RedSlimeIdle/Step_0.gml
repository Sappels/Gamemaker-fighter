


// Game Over Screen




//Shoot function

canShoot -= 1;


if(keyboard_check(ord("V"))) // was _pressed
{
	
	
	if(canShoot <= 0) 
	{
		sprite_index = spr_RedSlimeShoot;
		
		if(image_xscale == scale) 

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
	
		canShoot = (0.5 * room_speed);
	}
	
}


// Hit Animation

if(keyboard_check_pressed(ord("C"))) 

{
	sprite_index = spr_RedSlimeHit;


	if(image_xscale == scale) 
	{
		var PunchBox = instance_create_layer(x,y, "instances", obj_PunchBox2);
		PunchBox.direction = image_angle;
	}
	
	if(image_xscale == -scale) 
	{
	var PunchBox = instance_create_layer(x,y, "instances", obj_PunchBox2);
	PunchBox.direction = image_angle + 180;
	}		

}




//gravity
//y += 0.98 * delta_time / 5000;
vsp = vsp + grv;

// idle animation when not moving left or right

if(!keyboard_check(ord("A")) && jump_current == 2 && !keyboard_check(ord("C")) && !keyboard_check(ord("V")) || !keyboard_check(ord("D")) && jump_current == 2 && !keyboard_check(ord("C")) && !keyboard_check(ord("V")) )
{
	sprite_index = spr_RedSlimeIdle;
	hsp = 0;
	
	
}


if (keyboard_check(ord("A")) && jump_current == 2 && !keyboard_check(ord("V")))
{
    sprite_index = spr_RedSlimeRun;
	image_xscale = -scale;
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_BlueSlimeIdle)) 
	{
		hsp = -6;
	}
	
}

if (keyboard_check(ord("A")) && jump_current < 2)
{
    if(vsp < 0) 
	{
		sprite_index = spr_RedSlimeJumpUp;
		image_xscale = -scale;
	}
	
	if(vsp == 0) 
	{
		sprite_index = spr_RedSlimeJumpDown;
		image_xscale = -scale;
	}
	
		
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_BlueSlimeIdle)) 
	{
		hsp = -6;
	}
	
}

// sprint left

if(keyboard_check(ord("A")) && keyboard_check(vk_lshift) && jump_current == 2  && !keyboard_check(ord("V")))
{
    sprite_index = spr_RedSlimeSprint;
	image_xscale = -scale;
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_BlueSlimeIdle)) 
	{
		
		hsp = -8;
	}
	
}

if(keyboard_check(ord("A")) && keyboard_check(vk_lshift) && jump_current < 2)
{
    if(vsp < 0) 
	{
		sprite_index = spr_RedSlimeJumpUp;
		image_xscale = -scale;
	}
	
	if(vsp == 0) 
	{
		sprite_index = spr_RedSlimeJumpDown;
		image_xscale = -scale;
	}
	
		
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_BlueSlimeIdle)) 
	{
		
		hsp = -8;
	}
	
}

if (keyboard_check(ord("D")) && jump_current == 2  && !keyboard_check(ord("V")))
{
   	
	sprite_index = spr_RedSlimeRun;
	image_xscale = scale;
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_BlueSlimeIdle)) 
	{
		hsp = 6;
	}
	
}

if (keyboard_check(ord("D")) && jump_current < 2)
{
   	
	if(vsp < 0) 
	{
		sprite_index = spr_RedSlimeJumpUp;
		image_xscale = scale;
	}
	
	if(vsp == 0) 
	{
		sprite_index = spr_RedSlimeJumpDown;
		image_xscale = scale;
	}
	
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_BlueSlimeIdle)) 
	{
		hsp = 6;
	}
	
}

// sprint right

if(keyboard_check(ord("D")) && keyboard_check(vk_lshift) && jump_current == 2  && !keyboard_check(ord("V")))
{
    sprite_index = spr_RedSlimeSprint;
	image_xscale = scale;
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_BlueSlimeIdle)) 
	{
		
		hsp = 8;
	}
	
}

if(keyboard_check(ord("D")) && keyboard_check(vk_lshift) && jump_current < 2)
{
    if(vsp < 0) 
	{
		sprite_index = spr_RedSlimeJumpUp;
		image_xscale = scale;
	}
	
	if(vsp == 0) 
	{
		sprite_index = spr_RedSlimeJumpDown;
		image_xscale = scale;
	}
	
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_BlueSlimeIdle)) 
	{
		
		hsp = 8;
	}
	
}

if (keyboard_check_pressed(ord("W")) && jump_current > 0)
{
    //motion_set(90,10);
	
	sprite_index = spr_RedSlimeJumpUp;
	vsp = -10;
	jump_current--;
}

if(vsp == 0) 
{
	sprite_index = spr_RedSlimeJumpDown;
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


// collision with PowerUp

if (place_meeting(x+hsp,y,obj_PowerUp))
{
	instance_deactivate_object(obj_PowerUp);
	scale += 0.2;
	
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
