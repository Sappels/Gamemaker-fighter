if(scale >= 0.5) 
{
scale -= 0.2;
image_xscale = scale;
image_yscale = scale;
}

if(scale <= 0.3) 
{
	audio_stop_sound(global.bgMusic); 
	global.redSlimeWon = true;
	room_goto(Room1End);
	
}