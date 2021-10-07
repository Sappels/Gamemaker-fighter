var hover = point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom);

if (hover == 1) 
{
	sprite_index = spr_MainMenuButtonSelected;
	if(mouse_check_button_pressed(mb_left)) 
	{
		room_goto(RoomStart);
		
		
	}
}

if (hover == 0) 
{
sprite_index = spr_MainMenuButton;	
}