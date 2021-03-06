//isGrounded = place_meeting(x, y + 1, obj_PlatformPlaceholder);

canShoot -= 1;

//Shoot function
if(keyboard_check(vk_rcontrol)) 
{
	
	if(canShoot <= 0) 
	{
	
		sprite_index = spr_BlueSlimeShoot;
	
		if(image_xscale == scale) 
		{
			var slimeBallL = instance_create_layer(x,y, "instances", obj_BlueSlimeBallL);
			slimeBallL.direction = image_angle + 180;
			audio_play_sound(sfx_SlimeBall, 0, false);
		}
	
		if(image_xscale == -scale) 
		{
			var slimeBallR = instance_create_layer(x,y, "instances", obj_BlueSlimeBallR);
			slimeBallR.direction = image_angle;
			audio_play_sound(sfx_SlimeBall, 0, false);
		}
		
		canShoot = (0.5 * room_speed);
	}
	
	


}



// Hit Animation

if(keyboard_check(vk_numpad0)) 
{
	sprite_index = spr_BlueSlimeHit;

	if(image_xscale == -scale) 
	{
		
	var PunchBox = instance_create_layer(x,y, "instances", obj_PunchBox);
		PunchBox.direction = image_angle;
		
	}
	
	if(image_xscale == scale) 
	{
		
	var PunchBox = instance_create_layer(x,y, "instances", obj_PunchBox);
		PunchBox.direction = image_angle + 180;
		
	}	
	
}


//gravity
//y += 0.98 * delta_time / 5000;
vsp = vsp + grv;


// idle animation when not moving left or right

if(!keyboard_check(vk_left) && jump_current == 2 && !keyboard_check(vk_numpad0) && !keyboard_check(vk_rcontrol) || !keyboard_check(vk_right) && jump_current == 2 && !keyboard_check(vk_numpad0) && !keyboard_check(vk_rcontrol)) 
{
	
	
	sprite_index = spr_BlueSlimeIdle;

	

	hsp = 0;

}

//movement

if (keyboard_check(vk_left) && jump_current == 2 && !keyboard_check(vk_rcontrol))
{
    sprite_index = spr_BlueSlimeRun;
	image_xscale = scale;
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_RedSlimeIdle)) 
	{
		
		hsp = -6;
		
	}

	
}

if (keyboard_check(vk_left) && jump_current < 2)
{
    if(vsp < 0) 
	{
		sprite_index = spr_BlueSlimeJumpUp;
		image_xscale = scale;
	}
	
	if(vsp == 0) 
	{
		sprite_index = spr_BlueSlimeJumpDown;
		image_xscale = scale;
	}
	
	
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_RedSlimeIdle)) 
	{
		
		hsp = -6;
		
	}

	
}

// sprint left

if(keyboard_check(vk_left) && keyboard_check(vk_rshift)  && !keyboard_check(vk_rcontrol))
{
    sprite_index = spr_BlueSlimeSprint;
	image_xscale = scale;
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_RedSlimeIdle)) 
	{
		
		hsp = -8;
		
	}
	

	
}

if(keyboard_check(vk_left) && keyboard_check(vk_rshift) && jump_current < 2)
{
    if(vsp < 0) 
	{
		sprite_index = spr_BlueSlimeJumpUp;
		image_xscale = scale;
	}
	
	if(vsp == 0) 
	{
		sprite_index = spr_BlueSlimeJumpDown;
		image_xscale = scale;
	}
	
		
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_RedSlimeIdle)) 
	{
		
		hsp = -8;
		
	}
	

	
}


if (keyboard_check(vk_right) && jump_current == 2 && !keyboard_check(vk_rcontrol))
{
    
	
	sprite_index = spr_BlueSlimeRun;
	image_xscale = -scale;
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_RedSlimeIdle)) 
	{
		hsp = 6;
		
	}
	

	
}

if (keyboard_check(vk_right) && jump_current < 2)
{
    
	if(vsp < 0) 
	{
		sprite_index = spr_BlueSlimeJumpUp;
		image_xscale = -scale;
	}
	
	if(vsp == 0) 
	{
		sprite_index = spr_BlueSlimeJumpDown;
		image_xscale = -scale;
	}
	
	
	
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_RedSlimeIdle)) 
	{
		hsp = 6;
		
	}
	

	
}

// sprint right

if(keyboard_check(vk_right) && keyboard_check(vk_rshift) && jump_current == 2  && !keyboard_check(vk_rcontrol))
{
    
	sprite_index = spr_BlueSlimeSprint;
	image_xscale = -scale;
	
		
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_RedSlimeIdle)) 
	{
		
		hsp = 8;
		
	}

	
	
}

if(keyboard_check(vk_right) && keyboard_check(vk_rshift) && jump_current < 2)
{
    
	if(vsp < 0) 
	{
		sprite_index = spr_BlueSlimeJumpUp;
		image_xscale = -scale;
	}
	
	if(vsp == 0) 
	{
		sprite_index = spr_BlueSlimeJumpDown;
		image_xscale = -scale;
	}
	
	
		
	// Movement when not Colliding between players
	
	if(!place_meeting(x+hsp,y,obj_RedSlimeIdle)) 
	{
		
		hsp = 8;
		
	}

	
	
}



if (keyboard_check_pressed(vk_up) && jump_current > 0)
{
    
	sprite_index = spr_BlueSlimeJumpUp;
	
	vsp = -10;
	jump_current--;
	
	
	
}

if(vsp == 0) 
{
	sprite_index = spr_BlueSlimeJumpDown;
}


//Player collision
if(place_meeting(x+hsp,y,obj_RedSlimeIdle)) 
{
	while (!place_meeting(x+hsp,y,obj_RedSlimeIdle))
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


//Vertical collision 
if (place_meeting(x,y+vsp,obj_PlatformPlaceholder))
{
	while (!place_meeting(x,y+sign (vsp),obj_PlatformPlaceholder))
	{
		y = y + sign(vsp);
	}
	if (vsp > 0)
	{
	jump_current = jump_number;
	}
	vsp = 0;
}
y = y + vsp;




//Horizontal collision 
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

//horizontal collision
if x > room_width {x = xprevious;}
if x < 0 {x = 0;}


