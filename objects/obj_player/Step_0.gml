player_collision()

// Movement Logic
if keyboard_check_pressed(ord("A")){send_move_command(Move.Left_Right, -move_speed)}
if keyboard_check_pressed(ord("D")){send_move_command(Move.Left_Right, move_speed)}
if keyboard_check_pressed(ord("S")){send_move_command(Move.Up_Down, move_speed)}
if keyboard_check_pressed(ord("W")){send_move_command(Move.Up_Down, -move_speed)}


if keyboard_check_released(ord("A")){send_move_command(Move.Left_Right, move_speed)}
if keyboard_check_released(ord("D")){send_move_command(Move.Left_Right, -move_speed)}
if keyboard_check_released(ord("S")){send_move_command(Move.Up_Down, -move_speed)}
if keyboard_check_released(ord("W")){send_move_command(Move.Up_Down, move_speed)}

if keyboard_check_pressed(ord("J")){send_attack_command(Move.Left_Right, -move_speed)}
if keyboard_check_pressed(ord("L")){send_attack_command(Move.Left_Right, move_speed)}
if keyboard_check_pressed(ord("K")){send_attack_command(Move.Up_Down, move_speed)}
if keyboard_check_pressed(ord("I")){send_attack_command(Move.Up_Down, -move_speed)}

if(attack_speed_cooldown_remaining > 0)
{
	attack_speed_cooldown_remaining -= 1/room_speed
}
else if(currently_attacking)
{
	currently_attacking = false;
	send_move_command(Move.Left_Right,0)
	send_move_command(Move.Up_Down,0)
}