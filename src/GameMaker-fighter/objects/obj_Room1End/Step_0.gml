if(global.redSlimeWon == true && global.blueSlimeWon == false)
{
	instance_activate_object(obj_RedSlimeWins);
	
}

if(global.blueSlimeWon == true && global.redSlimeWon == false)
{
	instance_activate_object(obj_BlueSlimeWins);
	
}

if(global.redSlimeWon == false) 
{
	instance_deactivate_object(obj_RedSlimeWins);
}

if(global.blueSlimeWon == false) 
{
	instance_deactivate_object(obj_BlueSlimeWins);
}
	