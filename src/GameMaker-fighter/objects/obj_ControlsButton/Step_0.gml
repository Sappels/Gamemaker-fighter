var hover = point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom);

if (hover == 1) 
{
	sprite_index = spr_ControlsButtonSelected;
	if(mouse_check_button_pressed(mb_left)) 
	{
		if(audio_is_playing(global.MenuSound))
		{
			audio_stop_sound(global.MenuSound);
		}
		room_goto(RoomControls);
	}
}

if (hover == 0) 
{
sprite_index = spr_ControlsButton;	
}
