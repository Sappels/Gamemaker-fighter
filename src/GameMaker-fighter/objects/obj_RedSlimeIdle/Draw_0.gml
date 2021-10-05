
draw_self();

if(image_xscale <= 0.3 || image_yscale <= 0.3) 
{
draw_set_font(-1);
draw_set_color(c_black);
draw_text(room_width/2,room_height/2, "Game Over Green Slime Wins")
}
