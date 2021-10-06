// Reducing character size when hit

if(image_xscale > 0.3 || image_yscale > 0.3) 
{
scale -= 0.1;	
image_xscale = scale;
image_yscale = scale;

}