enum STATE {
	DEFAULT,
	ATTACK,
}

count = 0;

v_move = 0;
h_move = 0;
v_move_last = v_move;
h_move_last = h_move;

spd = 5;

state = STATE.DEFAULT;

sprite = spr_fighter_walk_down;
sprite_last = sprite;
image_speed = 0;

