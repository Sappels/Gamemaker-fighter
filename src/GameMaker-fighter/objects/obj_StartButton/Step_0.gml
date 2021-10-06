var hover = point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom);

if (hover == 1) 
{
	sprite_index = spr_StartButtonSelected;
	if(mouse_check_button_pressed(mb_left)) 
	{
		room_goto_next();
		
		if(audio_is_playing(MenuSound))
		{
			audio_stop_sound(MenuSound);
		}
	}
}

if (hover == 0) 
{
sprite_index = spr_StartButton;	
}


	