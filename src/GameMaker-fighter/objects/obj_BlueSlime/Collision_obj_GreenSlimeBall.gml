// Reducing character size when hit

if(image_xscale > 0 || image_yscale > 0) 
{
	
image_xscale -= 0.1;
image_yscale -= 0.1;

}


// Game Over Screen
if(image_xscale <= 0 || image_yscale <= 0) 
{
draw_set_font(-1);
draw_set_color(c_black);
draw_text(room_width/2,room_height/2, "Game Over")
}


