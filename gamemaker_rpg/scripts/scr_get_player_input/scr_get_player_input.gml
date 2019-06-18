/// @desc scr_get_player_input()

up = keyboard_check(ord("W")) || keyboard_check(vk_up);
left = keyboard_check(ord("A")) || keyboard_check(vk_left);
down = keyboard_check(ord("S")) || keyboard_check(vk_down);
right = keyboard_check(ord("D")) || keyboard_check(vk_right);
base_attack = keyboard_check_pressed(ord("F")) || keyboard_check_pressed(vk_space);

h_dir = right - left;
v_dir = down - up;

move_dir = point_direction(x, y, x + h_dir, y + v_dir);

if(h_dir != 0 || v_dir != 0) {
	h_move = lengthdir_x(spd, move_dir);
	v_move = lengthdir_y(spd, move_dir);
}else {
	h_move = 0;
	v_move = 0;
}
