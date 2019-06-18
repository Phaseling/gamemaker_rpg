
if(instance_exists(follow)) {
	x_to = follow.x;
	y_to = follow.y;
}

x += round((x_to - x)/12.5);
y += round((y_to - y)/12.5);

x = clamp(x, view_w_half + buff, room_width - view_w_half - buff);
y = clamp(y, view_h_half + buff, room_height - view_h_half - buff);

camera_set_view_pos(cam, x - view_w_half, y - view_h_half);
