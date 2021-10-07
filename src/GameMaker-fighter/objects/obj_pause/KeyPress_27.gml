if (!global.pause)
{
    global.pause = 1;
    instance_deactivate_all(true);
    instance_activate_object(obj_Paused);
    instance_activate_object(obj_RestartButton);
    instance_activate_object(obj_MainMenuButton);
	
	if(global.blueSlimeWon == true) 
	{
		instance_activate_object(obj_BlueSlimeWins);
	}
	
	if(global.redSlimeWon == true) 
	{
		instance_activate_object(obj_RedSlimeWins);	
	}
}
else
{
    global.pause = 0;
    instance_activate_all();
    instance_deactivate_object(obj_Paused);
    instance_deactivate_object(obj_RestartButton);
    instance_deactivate_object(obj_MainMenuButton);
}