/// @description Punchbox

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