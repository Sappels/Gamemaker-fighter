if (!pause)
{
	pause = 1;
	instance_deactivate_all(true);
	instance_activate_object(obj_Paused);
}
else
{	
	pause = 0;
	instance_activate_all();
	instance_deactivate_object(obj_Paused);
	
}