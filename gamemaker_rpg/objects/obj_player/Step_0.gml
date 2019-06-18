scr_get_player_input();

count += 1;

if((base_attack && state != STATE.ATTACK) || state == STATE.ATTACK) {
	state = STATE.ATTACK;
}else {
	state = STATE.DEFAULT;
}

if(state == STATE.DEFAULT) {
	if(place_meeting(x + h_move, y, obj_collision)) {
		while(!place_meeting(x + h_dir, y, obj_collision)) x += h_dir;
		h_move = 0;
	}
	
	if(place_meeting(x, y + v_move, obj_collision)) {
		while(!place_meeting(x, y + v_dir, obj_collision)) y += v_dir;
		v_move = 0;
	}
	
	x += h_move;
	y += v_move;
	
	if((h_move != h_move_last || v_move != v_move_last) && (h_move != 0 || v_move != 0)) {
		v_move_last = v_move;
		h_move_last = h_move;
	}
	
	if(h_move != 0 || v_move != 0) {
		if(h_move != 0) {
			sprite = (h_move > 0) ? spr_fighter_walk_right : spr_fighter_walk_left;
		}else {
			sprite = (v_move > 0) ? spr_fighter_walk_down : spr_fighter_walk_up;
		}
		if(count%5 == 0)image_index = (image_index + 1 < image_number) ? image_index + 1 : 0;
	}else {
		if(h_move_last != 0)	   sprite = (h_move_last > 0) ? spr_fighter_idle_right : spr_fighter_idle_left;
		else if (v_move_last != 0) sprite = (v_move_last > 0) ? spr_fighter_idle_down : spr_fighter_idle_up;
	}
}else if(state == STATE.ATTACK) {
	if(v_move_last != 0) sprite = (v_move_last > 0) ? spr_fighter_attack_down : spr_fighter_attack_up;
	if(h_move_last != 0) sprite = (h_move_last > 0) ? spr_fighter_attack_right : spr_fighter_attack_left;
	if(v_move_last == 0 && h_move_last == 0) sprite = spr_fighter_attack_down;
	
	if(sprite_index != sprite) {
		image_index = 0;
	}
	
	if(count%10 == 0) image_index += 1;
	
	if(image_index = image_number - 1) {
		state = STATE.DEFAULT;
		//sprite = sprite_last;
	}
}

if(sprite_index != sprite) sprite_index = sprite;
if(sprite_last != sprite) sprite_last = sprite;
show_debug_message(string(image_index) + "   " + string(sprite_index))




